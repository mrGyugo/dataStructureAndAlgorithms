//
//  Alhotithms.swift
//  DataStructureAndAlgorithms
//
//  Created by Mac_Work on 27.10.17.
//  Copyright © 2017 Mac_Work. All rights reserved.
//

import Foundation



final class Alhorithm {
    
    private init(){}
    static let sharid = Alhorithm()
    
    func insertionSort<T> (_ array: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
        var a = array			 // 1
        for x in 1..<a.count {		 // 2
            var y = x
            let temp = a[y]

            while y > 0 && isOrderedBefore(temp, a[y - 1]) { // 3
                a[y] = a[y - 1]
                y -= 1
            }
            a[y] = temp
        }
        return a
    }
    
    
    func mergeSort<T: Comparable> (_ array: [T]) -> [T] {
        
        guard array.count > 1 else { return array }
        
        let middleIndex = array.count / 2
        
        let leftArray = mergeSort(Array(array[0..<middleIndex]))
        let rightArray = mergeSort (Array(array[middleIndex..<array.count]))
        
        return marge(leftArray, rightArray)
    }
    
    private func marge<T: Comparable> (_ left: [T], _ right: [T]) -> [T] {
        
        var leftIndex = 0
        var rightIndex = 0
        
        var sortArray: [T] = []
        
        while leftIndex < left.count && rightIndex < right.count {
            
            let leftElement = left[leftIndex]
            let rightElement = right[rightIndex]
            
            if leftElement < rightElement {
                sortArray.append(leftElement)
                leftIndex += 1
            } else if leftElement > rightElement {
                sortArray.append(rightElement)
                rightIndex += 1
            } else {
                sortArray.append(leftElement)
                sortArray.append(rightElement)
                leftIndex += 1
                rightIndex += 1
            }
        }
        
        while leftIndex < left.count {
            sortArray.append(left[leftIndex])
            leftIndex += 1
        }
        
        while rightIndex < right.count {
            sortArray.append(right[rightIndex])
            rightIndex += 1
        }
        
        return sortArray
    }
    
    
    func quickSort<T: Comparable> (_ array: [T]) -> [T] {
        
        guard array.count > 1 else { return array }
        let middleElement = array[array.count / 2]
        let lower = array.filter{$0 < middleElement}
        let equal = array.filter{$0 == middleElement}
        let biger = array.filter{$0 > middleElement}
        return quickSort(lower) + equal + quickSort(biger)

    }
    
    func partitionLomuto<T: Comparable> (_ a: inout [T], low: Int, high: Int) -> Int {
        let pivot = a[high]
        var i = low
        for j in low..<high {
            if a[j] <= pivot {
                (a[i], a[j]) = (a[j], a[i])
                i += 1
            }
        }
        (a[i], a[high]) = (a[high], a[i])
        return i
    }
    
    
    
    
    func partitionHoare<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
        let pivot = a[low]
        var i = low - 1
        var j = high + 1
        
        while true {
            repeat { j -= 1 } while a[j] > pivot
            repeat { i += 1 } while a[i] < pivot
            
            if i < j {
                swap(&a[i], &a[j])
            } else {
                return j
            }
        }
    }
    
    
    func quicksortHoare<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
        if low < high {
            let p = partitionHoare(&a, low: low, high: high)
            quicksortHoare(&a, low: low, high: p)
            quicksortHoare(&a, low: p + 1, high: high)
        }
    }
    
    
    
    func bubbleSort<T: Comparable> (_ array: [T]) -> [T] {
        
        var a = array
        
        for i in 1..<a.count - 1 {
            for f in 0...a.count - (i + 1) {
                if a[f] > a[f + 1] {
                    swap(&a[f], &a[f + 1])
                }
            }
        }
        return a
    }
    
    func randomNumber<T : SignedInteger>(inRange range: ClosedRange<T> = 1...6) -> T {
        let length = (range.upperBound - range.lowerBound + 1).toIntMax()
        let value = arc4random().toIntMax() % length + range.lowerBound.toIntMax()
        return T(value)
    }
    
    
    
    
    func quicsortRandom<T: Comparable> (_ a: inout [T], low: Int, high: Int) {

        
        if low < high {
            let pivotIndex = randomNumber(inRange: low...high)
            (a[pivotIndex], a[high]) = (a[high], a[pivotIndex])
            
            let p = partitionLomuto(&a, low: low, high: high)
            quicsortRandom(&a, low: 0, high: p - 1)
            quicsortRandom(&a, low: p + 1, high: high)
            
        }
    }
    
    
    func partitionDutchFlag<T: Comparable>(_ a: inout [T], low: Int, high: Int, pivotIndex: Int) -> (Int, Int) {
        let pivot = a[pivotIndex]
        
        var smaller = low
        var equal = low
        var larger = high
        
        while equal <= larger {
            if a[equal] < pivot {
                swap(&smaller, &equal)
                smaller += 1
                equal += 1
            } else if a[equal] == pivot {
                equal += 1
            } else {
                swap(&equal, &larger)
                larger -= 1
            }
        }
        return (smaller, larger)
    }

}
