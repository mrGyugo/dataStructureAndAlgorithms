//
//  PriorityQueue.swift
//  DataStructureAndAlgorithms
//
//  Created by Mac_Work on 26.10.17.
//  Copyright © 2017 Mac_Work. All rights reserved.
//

import Foundation

public class LinkedList<T> {
    
    /// Linked List's Node Class Declaration
    public class LinkedListNode<T> {
        var value: T
        var next: LinkedListNode?
        weak var previous: LinkedListNode?
        
        public init(value: T) {
            self.value = value
        }
    }
    
    
    public typealias Node = LinkedListNode<T>
    
    fileprivate var head: Node?
    
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node? {
        return head
    }
    
    
    public var last: Node? {
        if var node = head {
            while let next = node.next {
                node = next
            }
            return node
        } else {
            return nil
        }
    }
    
    
    public func append(_ value: T) {
        let newNode = Node(value: value)
        
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
    
    
    
    public var count: Int {
        if var node = head {
            var c = 1
            while let next = node.next {
                node = next
                c += 1
            }
            return c
        } else {
            return 0
        }
    }
    
    
    public func nodeAt (_ index: Int) -> Node? {
        
        if index >= 0 {
            var node = head
            var i = index
            while  node != nil {
                if i == 0 { return node }
                i -= 1
                node = node!.next
            }
        }
        return nil
        
    }
    
    
    public subscript(index: Int) -> T {
        let node = nodeAt(index)
        return node!.value
    }
    
    public func insert(value: T, atIndex index: Int) {
        
        let (prev, next) = nodesBeforeAndAfter(index: index)
        
        
        let newNode = Node(value: value)
        newNode.previous = prev
        newNode.next = next
        prev?.next = newNode
        next?.previous = newNode
        
        if prev == nil {
            head = newNode
        }
        
        
        
    }
    
    public func removeAll() {
        head = nil
    }
    
    
    
    public func remove(node: Node) -> T {
        
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        
        next?.previous = prev
        
        node.previous = nil
        node.next = nil
        return node.value
    }
    
    
    
    private func nodesBeforeAndAfter(index: Int) -> (Node?, Node?) {
        
        assert(index >= 0)
        
        var i = index
        var next = head
        var prev: Node?
        
        while next != nil && i > 0 {
            i -= 1
            prev = next
            next = next!.next
        }
        assert(i == 0)
        return (prev, next)
    }
    
    
    public func removeLast() -> T {
        assert(!isEmpty)
        return remove(node: last!)
    }
    
    public func removeAt(_ index: Int) -> T {
        let node = nodeAt(index)
        assert(node != nil)
        return remove(node: node!)
    }
    
    public func reverse() {
        
        var node = head
        while let currentNode = node {
            node = currentNode.next
            swap(&currentNode.next, &currentNode.previous)
            head = currentNode
        }
    }
    
    
    public func map<U>(transform: (T) -> U) -> LinkedList<U> {
        let result = LinkedList<U>()
        var node = head
        while node != nil {
            result.append(transform(node!.value))
            node = node!.next
        }
        return result
    }
    
    
    public func filter(predicate: (T) -> Bool) -> LinkedList<T> {
        let result = LinkedList<T>()
        var node = head
        while node != nil {
            if predicate(node!.value) {
                result.append(node!.value)
            }
            node = node!.next
        }
        return result
    }
    
    
    
}

extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        var s = "["
        var node = head
        while node != nil {
            s += "\(node!.value)"
            node = node!.next
            if node != nil { s += ", " }
        }
        return s + "]"
    }
}




