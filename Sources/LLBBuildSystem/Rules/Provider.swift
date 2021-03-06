// This source file is part of the Swift.org open source project
//
// Copyright (c) 2020 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See http://swift.org/LICENSE.txt for license information
// See http://swift.org/CONTRIBUTORS.txt for the list of Swift project authors

import llbuild2

public protocol LLBProvider: LLBPolymorphicSerializable {}

public enum LLBProviderMapError: Error {
    /// Thrown when there are multiple providers of the same type being added to a ProviderMap.
    case multipleProviders(String)
    
    /// Thrown when an unknown
    case providerTypeNotFound(String)
}

public extension LLBProviderMap {
    init(providers: [LLBProvider]) throws {
        // Sort providers to create a deterministic output.
        var validProviders = [LLBAnySerializable]()
        try providers.sorted {
            type(of: $0).polymorphicIdentifier < type(of: $1).polymorphicIdentifier
        }.forEach { provider in
            if let lastCodable = validProviders.last,
                  lastCodable.typeIdentifier == type(of: provider).polymorphicIdentifier {
                throw LLBProviderMapError.multipleProviders(String(describing: type(of: provider).polymorphicIdentifier))
            }
            validProviders.append(try LLBAnySerializable(from: provider))
        }
        self.providers = validProviders
    }
    
    var count: Int {
        return providers.count
    }
}

extension LLBProviderMap {
    /// Returns the provider contained in the map for the given provider type, or throws if none is found.
    public func get<P: LLBProvider>(_ type: P.Type = P.self) throws -> P {
        guard let provider = try getOptional(P.self) else {
            throw LLBProviderMapError.providerTypeNotFound(P.polymorphicIdentifier)
        }
        
        return provider
    }

    public func getOptional<P: LLBProvider>(_ type: P.Type = P.self) throws -> P? {
        for anyProvider in providers {
            if anyProvider.typeIdentifier == P.polymorphicIdentifier {
                let byteBuffer = LLBByteBuffer.withBytes(ArraySlice<UInt8>(anyProvider.serializedBytes))
                return try P.init(from: byteBuffer)
            }
        }

        return nil
    }
}
