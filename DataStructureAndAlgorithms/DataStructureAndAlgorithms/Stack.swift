//
//  Stack.swift
//  DataStructureAndAlgorithms
//
//  Created by Mac_Work on 24.10.17.
//  Copyright © 2017 Mac_Work. All rights reserved.
//

import Foundation


//STACK-------------------------

/*
 Стек реализует следующие три метода:
 
 • push() - Добавляет элемент в конец стека
 • pop() - Удаляет и возвращает элемент из вершины стека
 • peek() - Возвращает верхний элемент из стека, но не удаляет его
 
 Общие реализации могут также включать вспомогательные операции, такие как:
 
 • count - Возвращает количество элементов в стеке
 • isEmpty() - Возвращает true, если стек пуст, и false в противном случае
 • isFull() - Если стек ограничивает количество элементов, этот метод возвращает true, если он заполнен и false в противном случае
 */


//Implementation


public struct Stack<Element> {
    
    fileprivate var elements = [Element]()
    public init() {}
    
    public mutating func pop () -> Element? {
        return self.elements.popLast()
    }
    
    public mutating func push (_ element: Element) {
        self.elements.append(element)
    }
    
    public mutating func peek () -> Element? {
        return self.elements.last
    }
    
    public var isEmpty: Bool {
        return self.elements.isEmpty
    }
    
    public var count: Int {
        return self.elements.count
    }
    
    public init<S : Sequence>(_ s: S) where S.Iterator.Element == Element {
        self.elements = Array(s.reversed())
    }
}

//Protocols

extension Stack: CustomStringConvertible, CustomDebugStringConvertible {
    
    public var description: String {
        return self.elements.description
    }
    public var debugDescription: String {
        return self.elements.debugDescription
    }
}


extension Stack: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Element...) {
        self.elements = elements
    }
}

extension Stack: Sequence {
    public func makeIterator() -> AnyIterator<Element> {
        return AnyIterator(IndexingIterator(_elements: self.elements.lazy.reversed()))
    }
}


