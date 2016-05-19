//: Playground - noun: a place where people can play

import UIKit

// Bubble sort
var inputArray = [3, 12, 56, 32, 23, 67, 87, 45, 23, 10, 11, 99, 4, 12, 49, 20, 40, 1]

func bubbleSort(originArray: [Int]) -> Array<Int> {
    var mutableArray = originArray
    
    var sortedAboveIndex = mutableArray.count
    
    while sortedAboveIndex != 0 && sortedAboveIndex != 1 {
        var lastIndex = 0
        for index in 1...sortedAboveIndex - 1 {
            if mutableArray[index-1] > mutableArray[index] {
                swap(&mutableArray[index], &mutableArray[index-1])
                lastIndex = index
            }
        }
        sortedAboveIndex = lastIndex
    }
    return mutableArray
}

bubbleSort(inputArray)

// Quick sort

func quickSort(originArray: [Int]) -> Array<Int> {
    var less = [Int]()
    var equal = [Int]()
    var greater = [Int]()
    
    if originArray.count > 1{
        let pivot = originArray[0]
        
        for x in originArray {
            if x < pivot{
                less.append(x)
            }
            if x == pivot {
                equal.append(x)
            }
            if x > pivot {
                greater.append(x)
            }
        }
        return (quickSort(less)+equal+quickSort(greater))
    } else {
        return originArray
    }
    
}

quickSort(inputArray)

// Insertion sort

func insertionSort(originArray: [Int]) -> Array<Int> {
    var mutableArray = originArray
    
    for index in 1...mutableArray.count - 1 {
        let temp = mutableArray[index]
        var sortIndex = index
        
        while sortIndex > 0 && mutableArray[sortIndex - 1] > temp {
            mutableArray[sortIndex] = mutableArray[sortIndex - 1]
            sortIndex -= 1;
        }
        mutableArray[sortIndex] = temp
    }
    
    return mutableArray
}

insertionSort(inputArray)

// Selection sort

func selectionSort(originArray: [Int]) -> Array<Int> {
    var mutableArray = originArray
    
    for indexI in 0...mutableArray.count - 2 {
        var min = indexI
        for indexJ in indexI + 1...mutableArray.count - 1 {
            if mutableArray[min] > mutableArray[indexJ] {
                min = indexJ
            }
        }
        let temp = mutableArray[min]
        mutableArray[min] = mutableArray[indexI]
        mutableArray[indexI] = temp
    }
    
    return mutableArray
}

selectionSort(inputArray)

// Merge sort

func mergeSortRecursive(inout array: [Int], start: Int, end: Int) {
    if start >= end {
        return
    }
    
    var reg = [Int](count: array.count, repeatedValue: 0)
    
    let middle = (start + end) / 2
    var start1 = start
    let end1 = middle
    var start2 = middle + 1
    let end2 = end
    
    
    mergeSortRecursive(&array, start: start1, end: end1)
    mergeSortRecursive(&array, start: start2, end: end2)
    
    var index = start
    
    while start1 <= end1 && start2 <= end2 {
        if array[start1] < array[start2] {
            reg[index] = array[start1]
            start1 += 1
        } else {
            reg[index] = array[start2]
            start2 += 1
        }
        index += 1
    }
    while start1 <= end1 {
        reg[index] = array[start1]
        index += 1
        start1 += 1
    }
    while start2 <= end2 {
        reg[index] = array[start2]
        index += 1
        start2 += 1
    }
    
    for regIndex in start...end {
        array[regIndex] = reg[regIndex]
    }
}

mergeSortRecursive(&inputArray, start: 0, end: inputArray.count - 1)
