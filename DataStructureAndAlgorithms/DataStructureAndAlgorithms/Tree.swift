//
//  Tree.swift
//  DataStructureAndAlgorithms
//
//  Created by Mac_Work on 02.11.17.
//  Copyright © 2017 Mac_Work. All rights reserved.
//

import Foundation

class TreeNode<T: Equatable> {
    
    typealias Node = TreeNode
    
    var value:T
    init (value: T) { self.value = value }
    weak var parent: Node?
    var children: [Node] = []
    
    func add(child: Node) {
        children.append(child)
        child.parent = self
    }
    
    
}

extension TreeNode: CustomStringConvertible {
    var description: String {
        var text = "\(value)"
        if !children.isEmpty {
            text += " {" + children.map{ $0.description }.joined(separator: ", ") + "} "
        }
        return text
    }
}

extension TreeNode {
    func search (value: T) -> TreeNode? {
        if self.value == value {
            return self
        }
        for child in children {
            if let found = child.search(value: value) {
                return found
            }
        }
        return nil
    }
}
