//: Playground - noun: a place where people can play

import UIKit

// Given an array of integers, find two numbers such that they add up to a specific target number.
// The function twoSum should return indices of the two numbers such that they add up to the target,
// where index1 must be less than index2. Please note that your returned answers (both index1 and index2) are not zero-based.

// You may assume that each input would have exactly one solution.
// Input: numbers={2, 7, 11, 15}, target=9 Output: index1=1, index2=2



func twoSum( intArray:[Int] , targetNumber:Int ) -> [String] {
    var index1:Int = 0
    var index2:Int = 0
    var ansArray:[String] = []
    
    for i in 0...intArray.count - 2 {
        
        if  intArray[i] >= targetNumber {
            continue
        }else {
            for j in (i+1)...intArray.count - 1 {
                if  intArray[j] >= targetNumber {
                    continue
                }else {
                    if intArray[i] + intArray[j] == targetNumber {
                        index1 = i+1
                        index2 = j+1
                        ansArray.append("index1=\(index1), index2=\(index2)")
                    }
                }
            }
        }
    }
    
    return ansArray
}


let testArray = [2,7,11,15,4,5,8,3,45,13,78,0,13,5,14]
let target = 9


let ans = twoSum(testArray, targetNumber: target)
