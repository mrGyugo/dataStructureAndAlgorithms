//
//  BinaryTree.swift
//  DataStructureAndAlgorithms
//
//  Created by Mac_Work on 02.11.17.
//  Copyright © 2017 Mac_Work. All rights reserved.
//

import Foundation

public indirect enum BinaryTree<T> {
    case node (BinaryTree<T>, T, BinaryTree<T>)
    case empty
    
    public var count: Int {
        switch self {
        case let .node(left, _, right):
            return left.count + 1 + right.count
        case .empty:
            return 0
        }
    }
    
    public func traversInOrder(process: (T) -> ()) {
        if case let .node(left, value, right) = self {
            left.traversInOrder(process: process)
            process(value)
            right.traversInOrder(process: process)
            
        }
    }
    
    public func traversePreOrder(process: (T) -> Void) {
        if case let .node(left, value, right) = self {
            process(value)
            left.traversePreOrder(process: process)
            right.traversePreOrder(process: process)
        }
    }
    
    public func traversePostOrder(process: (T) -> Void) {
        if case let .node(left, value, right) = self {
            left.traversePostOrder(process: process)
            right.traversePostOrder(process: process)
            process(value)
        }
    }
    
}

extension BinaryTree: CustomStringConvertible {
    public var description: String {
        switch self {
        case let .node(left, value, right):
            return "value \(value), left - [\(left.description)], right = [\(right.description)]"
        case .empty:
            return ""
        }
    }
}
