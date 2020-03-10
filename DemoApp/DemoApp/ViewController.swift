//
//  ViewController.swift
//  DemoApp
//
//  Created by Tyler Sherman on 2/11/20.
//  Copyright © 2020 Tyler Sherman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var outputLabel: UILabel!
    @IBOutlet var arrayLabel: UILabel!
    @IBOutlet var bubbleSortCountLabel: UILabel!
    @IBOutlet var insertionSortCountLabel: UILabel!
    @IBOutlet var quickSortCountLabel: UILabel!
    @IBOutlet var mergeSortCountLabel: UILabel!
    
    var unsortedArray = [Int]()
    var bubbleSortIterations = 0
    var insertionSortIterations = 0
    var quickSortIterations = 0
    var mergeSortIterations = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        demoFunction()
        
        unsortedArray = [4,14,6,-4,0,12,3,103,864,12,4,-4]
        unsortedArray.append(4)
        
        arrayLabel.text = "\(unsortedArray)"
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        outputLabel.text = returnFunction()
    }
    
    @IBAction func sortArray(_ sender: Any) {
        bubbleSortIterations = 0
        
        let unsortedArray2 = self.bubbleSort(unsortedArray)
        
        arrayLabel.text = "\(unsortedArray2)"
        bubbleSortCountLabel.text = "Bubble Sort Iterations: \(bubbleSortIterations)"
    }
    
    @IBAction func insertionSortAction(_ sender: Any) {
        insertionSortIterations = 0
        
        let unsortedArray2 = self.insertionSort(unsortedArray)
        
        arrayLabel.text = "\(unsortedArray2)"
        insertionSortCountLabel.text = "Insertion Sort Iterations: \(insertionSortIterations)"
    }
    
    @IBAction func quickSortAction(_ sender: Any) {
        quickSortIterations = 0
        
        let unsortedArray2 = self.quickSort(unsortedArray)
        
        arrayLabel.text = "\(unsortedArray2)"
        quickSortCountLabel.text = "Quick Sort Iterations: \(quickSortIterations)"
    }
    
    @IBAction func mergeSortAction(_ sender: Any) {
        mergeSortIterations = 0
        
        let unsortedArray2 = self.mergeSort(unsortedArray)
        
        arrayLabel.text = "\(unsortedArray2)"
        mergeSortCountLabel.text = "Merge Sort Iterations: \(mergeSortIterations)"
    }
    
    func bubbleSort<T: Comparable>(_ a: [T]) -> [T] {
        var array = a
        
        //sort array here
        for x in 1..<array.count {
            for y in 0..<array.count {
                //swap values if needed
                let value1 = array[x]
                let value2 = array[y]
                
                if value1 < value2 {
                    //swap values
                    array.swapAt(x, y)
                }
                
                bubbleSortIterations += 1
            }
        }
        
        return array
    }
    
    func insertionSort<T: Comparable>(_ a: [T]) -> [T] {
        var array = a
        
        for x in 1...array.count - 1 {
            var y = x
            
            while y > 0 && array[y] < array[y - 1] {
                array.swapAt(y - 1, y)
                
                y -= 1
                
                insertionSortIterations += 1
            }
        }
        
        return array
    }
    
    func quickSort<T: Comparable>(_ a: [T]) -> [T] {
        guard a.count > 1 else {
            quickSortIterations += 1
            return a
        }
        
        let pivot = a[a.count / 2]
        let leftArray = a.filter{$0 < pivot}
        let rightArray = a.filter{$0 > pivot}
        let middleArray = a.filter{$0 == pivot}
        
        quickSortIterations += 1
        
        return quickSort(leftArray) + middleArray + quickSort(rightArray)
    }
    
    func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
        guard array.count > 1 else {
            mergeSortIterations += 1
            return array
        }
        
        let middle = array.count / 2
        let leftArray = mergeSort(Array(array[0..<middle]))
        let rightArray = mergeSort(Array(array[middle..<array.count]))
        
        return merge(leftArray, rightArray)
    }
    
    func merge<T: Comparable>(_ left: [T], _ right: [T]) -> [T] {
        var leftIndex = 0
        var rightIndex = 0
        var orderedArray = [T]()
        
        while leftIndex < left.count && rightIndex < right.count {
            mergeSortIterations += 1
            
            if left[leftIndex] < right[rightIndex] {
                orderedArray.append(left[leftIndex])
                leftIndex += 1
            } else if left[leftIndex] > right[rightIndex] {
                orderedArray.append(right[rightIndex])
                rightIndex += 1
            } else {
                orderedArray.append(left[leftIndex])
                leftIndex += 1
                orderedArray.append(right[rightIndex])
                rightIndex += 1
            }
        }
        
        while leftIndex < left.count {
            orderedArray.append(left[leftIndex])
            leftIndex += 1
            mergeSortIterations += 1
        }
        
        while rightIndex < right.count {
            orderedArray.append(right[rightIndex])
            rightIndex += 1
            mergeSortIterations += 1
        }
        
        return orderedArray
    }
    
    func demoFunction() {
        //different variable declarations
        //let means set and never modified
        let variable1 = "String Value"
        
        //var means set and can be modified
        var variable2 = variable1
        
        //now set to NEW String Value
        variable2 = "NEW " + variable2
        
        //store the string returned from returnFunction()
        _ = returnFunction()
    }
    
    func returnFunction() -> String {
        return "String value"
    }
}
