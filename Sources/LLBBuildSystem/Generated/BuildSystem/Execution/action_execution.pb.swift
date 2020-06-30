// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: BuildSystem/Execution/action_execution.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

// This source file is part of the Swift.org open source project
//
// Copyright (c) 2020 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See http://swift.org/LICENSE.txt for license information
// See http://swift.org/CONTRIBUTORS.txt for the list of Swift project authors

import Foundation
import SwiftProtobuf

import TSFCAS
import llbuild2

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

/// Key that represents the execution of an action after the input artifacts have been resolved into concrete data IDs,
/// used to resolve the data IDs of the requested outputs.
public struct LLBActionExecutionKey {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Represents what type of action execution this key represents.
  public var actionExecutionType: LLBActionExecutionKey.OneOf_ActionExecutionType? = nil

  /// A command line based action execution key.
  public var command: LLBCommandActionExecution {
    get {
      if case .command(let v)? = actionExecutionType {return v}
      return LLBCommandActionExecution()
    }
    set {actionExecutionType = .command(newValue)}
  }

  /// A merge trees based action execution key.
  public var mergeTrees: LLBMergeTreesActionExecution {
    get {
      if case .mergeTrees(let v)? = actionExecutionType {return v}
      return LLBMergeTreesActionExecution()
    }
    set {actionExecutionType = .mergeTrees(newValue)}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  /// Represents what type of action execution this key represents.
  public enum OneOf_ActionExecutionType: Equatable {
    /// A command line based action execution key.
    case command(LLBCommandActionExecution)
    /// A merge trees based action execution key.
    case mergeTrees(LLBMergeTreesActionExecution)

  #if !swift(>=4.1)
    public static func ==(lhs: LLBActionExecutionKey.OneOf_ActionExecutionType, rhs: LLBActionExecutionKey.OneOf_ActionExecutionType) -> Bool {
      switch (lhs, rhs) {
      case (.command(let l), .command(let r)): return l == r
      case (.mergeTrees(let l), .mergeTrees(let r)): return l == r
      default: return false
      }
    }
  #endif
  }

  public init() {}
}

/// The value for an ActionExecutionKey.
public struct LLBActionExecutionValue {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The list of outputs IDs that the action produced. This will be in the same order as requested in
  /// actionExecutionType.
  public var outputs: [TSFCAS.LLBDataID] = []

  /// The data ID for the stdout of the action.
  public var stdoutID: TSFCAS.LLBDataID {
    get {return _stdoutID ?? TSFCAS.LLBDataID()}
    set {_stdoutID = newValue}
  }
  /// Returns true if `stdoutID` has been explicitly set.
  public var hasStdoutID: Bool {return self._stdoutID != nil}
  /// Clears the value of `stdoutID`. Subsequent reads from it will return its default value.
  public mutating func clearStdoutID() {self._stdoutID = nil}

  /// The data ID for the stderr of the action.
  public var stderrID: TSFCAS.LLBDataID {
    get {return _stderrID ?? TSFCAS.LLBDataID()}
    set {_stderrID = newValue}
  }
  /// Returns true if `stderrID` has been explicitly set.
  public var hasStderrID: Bool {return self._stderrID != nil}
  /// Clears the value of `stderrID`. Subsequent reads from it will return its default value.
  public mutating func clearStderrID() {self._stderrID = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _stdoutID: TSFCAS.LLBDataID? = nil
  fileprivate var _stderrID: TSFCAS.LLBDataID? = nil
}

/// An action execution description for a command line invocation.
public struct LLBCommandActionExecution {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The spec for the action to execute.
  public var actionSpec: llbuild2.LLBActionSpec {
    get {return _actionSpec ?? llbuild2.LLBActionSpec()}
    set {_actionSpec = newValue}
  }
  /// Returns true if `actionSpec` has been explicitly set.
  public var hasActionSpec: Bool {return self._actionSpec != nil}
  /// Clears the value of `actionSpec`. Subsequent reads from it will return its default value.
  public mutating func clearActionSpec() {self._actionSpec = nil}

  /// The list of inputs required for this action execution.
  public var inputs: [llbuild2.LLBActionInput] = []

  /// The list of outputs expected from this action execution.
  public var outputs: [llbuild2.LLBActionOutput] = []

  /// Identifier for the dynamic action executor for this action. If this is empty (which should be the majority of the
  /// cases) actions will be scheduled on the executor specified for the build. If set, action execution will find the
  /// dynamic executor with this identifier from the dynamic execution delegate and invoke that instead.
  public var dynamicIdentifier: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _actionSpec: llbuild2.LLBActionSpec? = nil
}

/// An action execution description for a merge trees action.
public struct LLBMergeTreesActionExecution {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The list of inputs to be merged together. In this context, the path in LLBActionInput is considered to be the
  /// root under which the artifact will be placed into.
  public var inputs: [llbuild2.LLBActionInput] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

extension LLBActionExecutionKey: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = "LLBActionExecutionKey"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    16: .same(proto: "command"),
    17: .same(proto: "mergeTrees"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 16:
        var v: LLBCommandActionExecution?
        if let current = self.actionExecutionType {
          try decoder.handleConflictingOneOf()
          if case .command(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {self.actionExecutionType = .command(v)}
      case 17:
        var v: LLBMergeTreesActionExecution?
        if let current = self.actionExecutionType {
          try decoder.handleConflictingOneOf()
          if case .mergeTrees(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {self.actionExecutionType = .mergeTrees(v)}
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    switch self.actionExecutionType {
    case .command(let v)?:
      try visitor.visitSingularMessageField(value: v, fieldNumber: 16)
    case .mergeTrees(let v)?:
      try visitor.visitSingularMessageField(value: v, fieldNumber: 17)
    case nil: break
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: LLBActionExecutionKey, rhs: LLBActionExecutionKey) -> Bool {
    if lhs.actionExecutionType != rhs.actionExecutionType {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension LLBActionExecutionValue: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = "LLBActionExecutionValue"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "outputs"),
    2: .same(proto: "stdoutID"),
    3: .same(proto: "stderrID"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedMessageField(value: &self.outputs)
      case 2: try decoder.decodeSingularMessageField(value: &self._stdoutID)
      case 3: try decoder.decodeSingularMessageField(value: &self._stderrID)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.outputs.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.outputs, fieldNumber: 1)
    }
    if let v = self._stdoutID {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    }
    if let v = self._stderrID {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: LLBActionExecutionValue, rhs: LLBActionExecutionValue) -> Bool {
    if lhs.outputs != rhs.outputs {return false}
    if lhs._stdoutID != rhs._stdoutID {return false}
    if lhs._stderrID != rhs._stderrID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension LLBCommandActionExecution: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = "LLBCommandActionExecution"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "actionSpec"),
    2: .same(proto: "inputs"),
    3: .same(proto: "outputs"),
    4: .same(proto: "dynamicIdentifier"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularMessageField(value: &self._actionSpec)
      case 2: try decoder.decodeRepeatedMessageField(value: &self.inputs)
      case 3: try decoder.decodeRepeatedMessageField(value: &self.outputs)
      case 4: try decoder.decodeSingularStringField(value: &self.dynamicIdentifier)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._actionSpec {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }
    if !self.inputs.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.inputs, fieldNumber: 2)
    }
    if !self.outputs.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.outputs, fieldNumber: 3)
    }
    if !self.dynamicIdentifier.isEmpty {
      try visitor.visitSingularStringField(value: self.dynamicIdentifier, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: LLBCommandActionExecution, rhs: LLBCommandActionExecution) -> Bool {
    if lhs._actionSpec != rhs._actionSpec {return false}
    if lhs.inputs != rhs.inputs {return false}
    if lhs.outputs != rhs.outputs {return false}
    if lhs.dynamicIdentifier != rhs.dynamicIdentifier {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension LLBMergeTreesActionExecution: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = "LLBMergeTreesActionExecution"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "inputs"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedMessageField(value: &self.inputs)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.inputs.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.inputs, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: LLBMergeTreesActionExecution, rhs: LLBMergeTreesActionExecution) -> Bool {
    if lhs.inputs != rhs.inputs {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
