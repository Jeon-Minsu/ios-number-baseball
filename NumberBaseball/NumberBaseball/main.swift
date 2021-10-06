//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var randomNumbers: [Int] = []
var remainChances: Int = 9

func generate3RandomNumbers() -> [Int] {
    var numbers:[Int] = []
    
    while numbers.count < 3 {
        let randomNumber:Int = Int.random(in: 1...9)
        
        if numbers.contains(randomNumber) == false {
            numbers.append(randomNumber)
        }
    }
    
    return numbers
}

func checkTheResult (for inputNumbers:[Int]) -> (Int, Int) {
    var sameNumberCount:Int = 0
    var strikeCount:Int = 0
    
    for inputNumber in inputNumbers {
        if randomNumbers.contains(inputNumber) {
            sameNumberCount += 1
        }
    }
    
    for index in (0...2) {
        if randomNumbers[index] == inputNumbers[index] {
            strikeCount += 1
        }
    }

    return (strikeCount, sameNumberCount - strikeCount)
}

func gameStart() {
    randomNumbers = generate3RandomNumbers()
    
    while remainChances > 0 {
        let playNumbers: [Int] = generate3RandomNumbers()
        print("임의의 수 : \(playNumbers.map{ String($0) }.joined(separator: " "))")
        let (strikeCount, ballCount) = checkTheResult(for: playNumbers)
        
        if strikeCount == 3 {
            break
        }
        
        remainChances -= 1
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        print("남은 기회 : \(remainChances)")
    }
    
    if remainChances == 0 {
        print("컴퓨터 승리...")
    } else {
        print("사용자 승리...")
    }
}

gameStart()
