//
//  CircularBuffer.swift
//  DataStructureAndAlgorithms
//
//  Created by Mac_Work on 25.10.17.
//  Copyright © 2017 Mac_Work. All rights reserved.
//

import Foundation

public struct RingBuffer<T: CustomStringConvertible> {
    
    fileprivate var array: [T?]
    fileprivate var readIndex = 0
    fileprivate var writeIndex = 0
    
    
    public init(count: Int) {
        array = [T?](repeating: nil, count: count)
    }
    
    
    public mutating func write(_ element: T) -> Bool {
        if !isFull {
            array[writeIndex % array.count] = element
            writeIndex += 1
            return true
        } else {
            return false
        }
    }
    
    public mutating func read() -> T? {
        if !isEmpty {
            let element = array[readIndex % array.count]
            readIndex += 1
            return element
        } else {
            return nil
        }
    }
    
    
    fileprivate var availableSpaceForReading: Int {
        return writeIndex - readIndex
    }
    
    public var isEmpty: Bool {
        return availableSpaceForReading == 0
    }
    
    fileprivate var availableSpaceForWriting: Int {
        return array.count - availableSpaceForReading
    }
    
    public var isFull: Bool {
        return availableSpaceForWriting == 0
    }
    
    
}

//Protocols

extension RingBuffer: CustomStringConvertible {

    public var description: String {
        var newString = ""
        for (index, items) in array.enumerated() {
            if items != nil {
                newString += items!.description
            } else {
                newString += "_"
            }
            if index != array.count {
                newString += ", "
            }
        }
        return newString
    }
}

