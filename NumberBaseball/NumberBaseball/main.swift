//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var numbersByComputer: [Int] = []
var numbersByUser: [Int] = []
var strikeCount: Int = 0
var ballCount: Int = 0

func generateRandomNumbers() -> [Int] {
    var randomNumbers: [Int] = []
    var numberPool: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9].shuffled()
    for _ in 1...3 {
        randomNumbers.append(numberPool.removeFirst())
    }

    return randomNumbers
}

func updateStrikeAndBallCount() {
    strikeCount = 0
    ballCount = 0
    
    for index in 0...2 {
        if numbersByUser[index] == numbersByComputer[index] {
            strikeCount += 1
        } else if numbersByComputer.contains(numbersByUser[index]) {
            ballCount += 1
        }
    }
}

func startGame(numberOfChance: Int) {
    numbersByComputer = generateRandomNumbers()
    var numberOfChance = numberOfChance
    
    while(numberOfChance > 0 && strikeCount < 3) {
        numbersByUser = generateRandomNumbers()
        let convertedNumbers = numbersByUser.map({ String($0) })
        print("임의의 수 :", convertedNumbers.joined(separator: " "))
        
        updateStrikeAndBallCount()
        numberOfChance -= 1
        
        if strikeCount == 3 {
            print("사용자 승리!")
        } else if numberOfChance == 0 {
            print("컴퓨터 승리...!")
        }
        
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        print("남은 기회 : \(numberOfChance)")
    }
}

func playNumberBaseball() {
    var flag: String = ""
    
    repeat{
        print("1. 게임시작")
        print("2. 게임종료")
        print("원하는 기능을 선택해주세요", terminator: " : ")
        let input: String? = readLine()
        if let menu = input {
            flag = menu
            switch flag {
            case "1":
                print("1번 메뉴입니다")
            case "2":
                print("프로그램 종료")
            default:
                print("입력이 잘못되었습니다")
            }
        }
    } while(flag != "2")
}
playNumberBaseball()
