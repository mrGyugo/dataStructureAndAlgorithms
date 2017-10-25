//
//  Queue.swift
//  DataStructureAndAlgorithms
//
//  Created by Mac_Work on 24.10.17.
//  Copyright © 2017 Mac_Work. All rights reserved.
//

import Foundation

//QUEUE-------------------------

/*
 Очередь реализует следующие семь операций:
 
 • enqueue() - Добавляет элемент в конец очереди
 • dequeue() - Удаляет и возвращает первый элемент из очереди
 • peek() - Возвращает первый элемент из очереди, но не удаляет его
 • clear() - Сбрасывает очередь в пустое состояние
 • count - Возвращает количество элементов в очереди
 • isEmpty() - Возвращает true, если очередь пуста, и false в противном случае
 • isFull() - Возвращает true, если очередь заполнена, а false в противном случае
 
 Общие реализации могут также включать вспомогательные методы, такие как следующие:
 
 • capacity - read/write property для извлечения или установки емкости очереди
 • insert(_:atIndex) - Метод, который вставляет элемент по указанному индексу в очередь
 • removeAtIndex(_) - Метод, который удаляет элемент по указанному индексу
 */

//Implementation

public struct Queue<Element> {
    fileprivate var data = [Element]()
    public init() {}
    
    public init<S: Sequence>(_ elements: S) where S.Iterator.Element == Element {
        data.append(contentsOf: elements)
    }
    
    public mutating func dequeur() -> Element? {
        return data.removeFirst()
    }
    
    public mutating func peek() -> Element? {
        return data.first
    }
    
    public mutating func enqueue(element: Element) {
        data.append(element)
    }
    
    public mutating func clear() {
        data.removeAll()
    }
    
    public var count: Int {
        return data.count
    }
    
    public var capacity: Int {
        get {
            return data.capacity
        }
        set {
            data.reserveCapacity(newValue)
        }
    }
    
    public func isfull() -> Bool {
        return count == data.capacity
    }
    
    public func isEmpty() -> Bool {
        return data.isEmpty
    }
    
    fileprivate func checkIndex(_ index: Int) {
        if index < 0 || index > count {
            fatalError("Index out of range")
        }
    }
    
    public mutating func insert(element: Element, toIndex index : Int) {
        data.insert(element, at: index)
    }
    
    public mutating func remove(toIndex index : Int) {
        data.remove(at: index)
    }
    
}

//Protocols

extension Queue: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        return data.description
    }
    public var debugDescription: String {
        return data.debugDescription
    }
}

extension Queue: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Element...) {
        self.data = elements
    }
}

extension Queue: Sequence {
    public func makeIterator() -> AnyIterator<Element> {
        return AnyIterator(IndexingIterator(_elements: self.data.lazy))
    }
}

extension Queue: MutableCollection {
    public var startIndex: Int {
        return 0
    }
    
    public var endIndex: Int {
        return count - 1
    }
    
    /// Возвращает позицию сразу после данного индекса.
    public func index(after i: Int) -> Int {
        return data.index(after: i)
    }
    
    public subscript(index: Int) -> Element {
        get {
            checkIndex(index)
            return data[index]
        }
        set {
            checkIndex(index)
            data[index] = newValue
        }
    }
    
    
}





