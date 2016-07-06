//
//  GameManager.swift
//  501 Darts
//
//  Created by William O'Keeffe on 06/07/2016.
//  Copyright (c) 2016 GryffindorLogicStudio. All rights reserved.
//

import Foundation

import UIKit

var gameManager: GameManager!

class GameManager: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var scoreHeader: UIView!
    @IBOutlet var p1ScoreView: UIView!
    @IBOutlet var p2ScoreView: UIView!
    
    @IBOutlet var p1SetIndicator: UIView!
    @IBOutlet var p2SetIndicator: UIView!
    
    //for textFields
    @IBOutlet var p1CheckOut: UITextField!
    @IBOutlet var p2CheckOut: UITextField!
    
    @IBOutlet var p1NameDspl: UITextField!
    @IBOutlet var p1SetsDspl: UITextField!
    @IBOutlet var p1legsDspl: UITextField!
    @IBOutlet var p1ScoreDspl: UITextField!
    
    @IBOutlet var p2NameDspl: UITextField!
    @IBOutlet var p2SetsDpsl: UITextField!
    @IBOutlet var p2LegsDspl: UITextField!
    @IBOutlet var p2ScoreDspl: UITextField!
    
    @IBOutlet var p1TurnIcon: UITextField!
    @IBOutlet var p2TurnIcon: UITextField!
    
    @IBOutlet var BestOfSets: UITextField!
    
    @IBOutlet var pointsDspl: UITextField!
    /*
    * Game control variables
    */
    
    var numberStr: String = ""
    let maxScore = 180
    let maxCheckOut = 170
    let checkedOut = 0
    let noCheckOutNumbers: Int!
    let maxDarts = 3
    var dartsThrown: Int!
    let noScore = 0
    let noLegs = 0
    let noSets = 0
    let lowestCheckout = 2
    let increment = 1
    let bustOne = 1
    
    // Two/one Dart checkout table finishes
    let f0 = ""
    let f1 = "Bust"
    let f2 = "D1"
    let f3 = "1 D1"
    let f4 = "D2"
    let f5 = "1 D2"
    let f6 = "D3"
    let f7 = "1 D3"
    let f8 = "D4"
    let f9 = "1 D4"
    let f10 = "D5"
    let f11 = "3 D4"
    let f12 = "D6"
    let f13 = "5 D4"
    let f14 = "D7"
    let f15 = "7 D4"
    let f16 = "D8"
    let f17 = "9 D4"
    let f18 = "D9"
    let f19 = "3 D8"
    let f20 = "D10"
    let f21 = "5 D8"
    let f22 = "D11"
    let f23 = "7 D8"
    let f24 = "D12"
    let f25 = "1 D12"
    let f26 = "D13"
    let f27 = "3 D12"
    let f28 = "D14"
    let f29 = "5 12"
    let f30 = "D15"
    let f31 = "7 D12"
    let f32 = "D16"
    let f33 = "1 D16"
    let f34 = "D17"
    let f35 = "3 D16"
    let f36 = "D18"
    let f37 = "5 D16"
    let f38 = "D19"
    let f39 = "7 D16"
    let f40 = "D20"
    let f41 = "9 D16"
    let f42 = "10 D16"
    let f43 = "3 D20"
    let f44 = "12 D16"
    let f45 = "13 D16"
    let f46 = "6 D20"
    let f47 = "15 D16"
    let f48 = "16 D16"
    let f49 = "17 D16"
    let f50 = "10 D20"
    let f51 = "19 D16"
    let f52 = "12 D20"
    let f53 = "13 D20"
    let f54 = "14 D20"
    let f55 = "15 D20"
    let f56 = "16 D20"
    let f57 = "17 D20"
    let f58 = "18 D20"
    let f59 = "19 D20"
    let f60 = "20 D20"
    let f61 = "T15 D8"
    let f62 = "T10 D16"
    let f63 = "T13 D12"
    let f64 = "T16 D8"
    let f65 = "T19 D8"
    let f66 = "T10 D18"
    let f67 = "T17 D8"
    let f68 = "T20 D4"
    let f69 = "T19 Bull"
    let f70 = "T18 D8"
    let f71 = "T13 D16"
    let f72 = "T16 D12"
    let f73 = "T19 D8"
    let f74 = "T14 D16"
    let f75 = "T13 D18"
    let f76 = "T20 D8"
    let f77 = "T15 D16"
    let f78 = "T18 D12"
    let f79 = "T13 D20"
    let f80 = "T16 D16"
    let f81 = "T15 D18"
    let f82 = "T14 D20"
    let f83 = "T17 D16"
    let f84 = "T16 D18"
    let f85 = "T15 D20"
    let f86 = "T18 D16"
    let f87 = "T17 D18"
    let f88 = "T16 D20"
    let f89 = "T19 D16"
    let f90 = "T18 D18"
    let f91 = "T17 D20"
    let f92 = "T20 D16"
    let f93 = "T19 D18"
    let f94 = "T18 D20"
    let f95 = "T19 D19"
    let f96 = "T20 D18"
    let f97 = "T19 D20"
    let f98 = "T20 D19"
    
    //Three Dart checkout table finishes
    let f99 = "T19 10 D16"
    let f100 = "T20 D20"
    let f101 = "T17 10 D20"
    let f102 = "T20 10 D16"
    let f103 = "T19 10 D18"
    let f104 = "T20 12 D16"
    let f105 = "T20 13 D16"
    let f106 = "T20 10 D18"
    let f107 = "T19 10 D20"
    let f108 = "T20 16 D18"
    let f109 = "T19 12 D20"
    let f110 = "T20 10 D20"
    let f111 = "T20 19 D16"
    let f112 = "T20 12 D20"
    let f113 = "T20 13 D20"
    let f114 = "T20 14 D20"
    let f115 = "T20 15 D20"
    let f116 = "T20 16 D20"
    let f117 = "T20 17 D20"
    let f118 = "T20 18 D20"
    let f119 = "T20 19 D20"
    let f120 = "T20 20 D20"
    let f121 = "T19 14 Bull"
    let f122 = "T18 18 Bull"
    let f123 = "T20 T13 D12"
    let f124 = "T20 T16 D8"
    let f125 = "T20 T19 D4"
    let f126 = "T19 19 Bull"
    let f127 = "T20 T17 D8"
    let f128 = "T20 T20 D8"
    let f129 = "T19 T16 D12"
    let f130 = "T20 T18 D8"
    let f131 = "T20 T18 D8"
    let f132 = "T20 T16 D12"
    let f133 = "T20 T19 D8"
    let f134 = "T20 T14 D16"
    let f135 = "T20 T13 D18"
    let f136 = "T20 T20 D8"
    let f137 = "T18 T17 D16"
    let f138 = "T20 T16 D15"
    let f139 = "T20 T13 D20"
    let f140 = "T20 T16 D16"
    let f141 = "T20 T15 D18"
    let f142 = "T20 T14 D20"
    let f143 = "T20 T17 D16"
    let f144 = "T20 T20 D12"
    let f145 = "T20 T15 D20"
    let f146 = "T20 T18 D16"
    let f147 = "T20 T17 D18"
    let f148 = "T20 T20 D14"
    let f149 = "T20 T19 D16"
    let f150 = "T20 T18 D18"
    let f151 = "T20 T17 D20"
    let f152 = "T20 T20 D16"
    let f153 = "T20 T19 D18"
    let f154 = "T20 T18 D20"
    let f155 = "T20 T19 D19"
    let f156 = "T20 T20 D18"
    let f157 = "T19 T20 D20"
    let f158 = "T20 T20 D19"
    let f159 = "No checkout"
    let f160 = "T20 T20 D20"
    let f161 = "T20 T17 Bull"
    let f162 = "no checkout"
    let f163 = "no checkout"
    let f164 = "T19 T19 Bull"
    let f165 = "no checkout"
    let f166 = "no checkout"
    let f167 = "T20 T19 Bull"
    let f168 = "no checkout"
    let f169 = "no checkout"
    let f170 = "T20 T20 Bull"
    
    var checkOutList =  [""]
    var p1ScoreList: [Int] = []
    var p2ScoreList: [Int] = []
    var p1HighestCheckOut: [Int] = []
    var p2HighestCheckOut: [Int] = []
    
    
    func startGame(){
        if(newPlayer.playerList.isEmpty){
            // do nothing
        }else{
            
            p2ScoreView.layer.cornerRadius = 5
            scoreHeader.layer.cornerRadius = 5
            scoreHeader.layer.borderWidth = 1
            scoreHeader.layer.borderColor = UIColor.blackColor().CGColor
            
            p2SetIndicator.hidden = true
            
            //set game pirameters
            // Best of set display information
            
            
            
            var currentBestOfSets: String!
            
            let best1Sets = "FIRST TO 1 SET"
            let best3Sets = "FIRST TO 3 SETS"
            let best5Sets = "FIRST TO 5 SETS"
            let best7Sets = "FIRST TO 7 SETS"
            let best9Sets = "FIRST TO 9 SETS"
            
            //set Best if sets display
            if(newGame.gameList[0].sets == 1){
                currentBestOfSets = best1Sets
                
            } else if (newGame.gameList[0].sets == 3){
                currentBestOfSets = best3Sets
            } else if (newGame.gameList[0].sets == 5){
                currentBestOfSets = best5Sets
            } else if (newGame.gameList[0].sets == 7){
                currentBestOfSets = best7Sets
            } else if (newGame.gameList[0].sets == 9){
                currentBestOfSets = best9Sets
            }
            
            BestOfSets.text = currentBestOfSets
            
            //Player 1 name value
            p1NameDspl.text = newPlayer.playerList[0].name
            newPlayer.playerList[0].myTurn = true
            p1CheckOut.hidden = true
            p2CheckOut.hidden = true
            p2TurnIcon.hidden = true
            p2NameDspl.textColor = UIColor.grayColor()
            p2LegsDspl.textColor = UIColor.grayColor()
            p2SetsDpsl.textColor = UIColor.grayColor()
            p2ScoreDspl.textColor = UIColor.grayColor()
            
            let tmpScore: Int = newPlayer.playerList[0].score
            var dspScore = String(tmpScore)
            p1ScoreDspl.text = dspScore
            
            let tmpSets: Int = newPlayer.playerList[0].sets
            var dspSets = String(tmpSets)
            p1SetsDspl.text = dspSets
            
            let tmpLegs: Int = newPlayer.playerList[0].legs
            var dspLegs = String(tmpLegs)
            p1legsDspl.text = dspLegs
            
            p2NameDspl.text = newPlayer.playerList[1].name
            let tmpSets2: Int = newPlayer.playerList[1].sets
            var dspSets2 = String(tmpSets2)
            p2SetsDpsl.text = dspSets2
            
            let tmpLegs2: Int = newPlayer.playerList[1].legs
            var dspLegs2 = String(tmpLegs2)
            p2LegsDspl.text = dspLegs2
            
            let tmpScore2: Int = newPlayer.playerList[1].score
            var dspScore2 = String(tmpScore2)
            p2ScoreDspl.text = dspScore2
            
        }
        
        
        //setUp checkout array list
        checkOutList.append(f0)
        checkOutList.append(f1)
        checkOutList.append(f2)
        checkOutList.append(f3)
        checkOutList.append(f4)
        checkOutList.append(f5)
        checkOutList.append(f6)
        checkOutList.append(f7)
        checkOutList.append(f8)
        checkOutList.append(f9)
        checkOutList.append(f10)
        checkOutList.append(f11)
        checkOutList.append(f12)
        checkOutList.append(f13)
        checkOutList.append(f14)
        checkOutList.append(f15)
        checkOutList.append(f16)
        checkOutList.append(f17)
        checkOutList.append(f18)
        checkOutList.append(f19)
        checkOutList.append(f20)
        checkOutList.append(f21)
        checkOutList.append(f22)
        checkOutList.append(f23)
        checkOutList.append(f24)
        checkOutList.append(f25)
        checkOutList.append(f26)
        checkOutList.append(f27)
        checkOutList.append(f28)
        checkOutList.append(f29)
        checkOutList.append(f30)
        checkOutList.append(f31)
        checkOutList.append(f32)
        checkOutList.append(f33)
        checkOutList.append(f34)
        checkOutList.append(f35)
        checkOutList.append(f36)
        checkOutList.append(f37)
        checkOutList.append(f38)
        checkOutList.append(f39)
        checkOutList.append(f40)
        checkOutList.append(f41)
        checkOutList.append(f42)
        checkOutList.append(f43)
        checkOutList.append(f44)
        checkOutList.append(f45)
        checkOutList.append(f46)
        checkOutList.append(f47)
        checkOutList.append(f48)
        checkOutList.append(f49)
        checkOutList.append(f50)
        checkOutList.append(f51)
        checkOutList.append(f52)
        checkOutList.append(f53)
        checkOutList.append(f54)
        checkOutList.append(f55)
        checkOutList.append(f56)
        checkOutList.append(f57)
        checkOutList.append(f58)
        checkOutList.append(f59)
        checkOutList.append(f60)
        checkOutList.append(f61)
        checkOutList.append(f62)
        checkOutList.append(f63)
        checkOutList.append(f64)
        checkOutList.append(f65)
        checkOutList.append(f66)
        checkOutList.append(f67)
        checkOutList.append(f68)
        checkOutList.append(f69)
        checkOutList.append(f70)
        checkOutList.append(f71)
        checkOutList.append(f72)
        checkOutList.append(f73)
        checkOutList.append(f74)
        checkOutList.append(f75)
        checkOutList.append(f76)
        checkOutList.append(f77)
        checkOutList.append(f78)
        checkOutList.append(f79)
        checkOutList.append(f80)
        checkOutList.append(f81)
        checkOutList.append(f82)
        checkOutList.append(f83)
        checkOutList.append(f84)
        checkOutList.append(f85)
        checkOutList.append(f86)
        checkOutList.append(f87)
        checkOutList.append(f88)
        checkOutList.append(f89)
        checkOutList.append(f90)
        checkOutList.append(f91)
        checkOutList.append(f92)
        checkOutList.append(f93)
        checkOutList.append(f94)
        checkOutList.append(f95)
        checkOutList.append(f96)
        checkOutList.append(f97)
        checkOutList.append(f98)
        checkOutList.append(f99)
        checkOutList.append(f100)
        checkOutList.append(f101)
        checkOutList.append(f102)
        checkOutList.append(f103)
        checkOutList.append(f104)
        checkOutList.append(f105)
        checkOutList.append(f106)
        checkOutList.append(f107)
        checkOutList.append(f108)
        checkOutList.append(f109)
        checkOutList.append(f110)
        checkOutList.append(f111)
        checkOutList.append(f112)
        checkOutList.append(f113)
        checkOutList.append(f114)
        checkOutList.append(f115)
        checkOutList.append(f116)
        checkOutList.append(f117)
        checkOutList.append(f118)
        checkOutList.append(f119)
        checkOutList.append(f120)
        checkOutList.append(f121)
        checkOutList.append(f122)
        checkOutList.append(f123)
        checkOutList.append(f124)
        checkOutList.append(f125)
        checkOutList.append(f126)
        checkOutList.append(f127)
        checkOutList.append(f128)
        checkOutList.append(f129)
        checkOutList.append(f130)
        checkOutList.append(f131)
        checkOutList.append(f132)
        checkOutList.append(f133)
        checkOutList.append(f134)
        checkOutList.append(f135)
        checkOutList.append(f136)
        checkOutList.append(f137)
        checkOutList.append(f138)
        checkOutList.append(f139)
        checkOutList.append(f140)
        checkOutList.append(f141)
        checkOutList.append(f142)
        checkOutList.append(f143)
        checkOutList.append(f144)
        checkOutList.append(f145)
        checkOutList.append(f146)
        checkOutList.append(f147)
        checkOutList.append(f148)
        checkOutList.append(f149)
        checkOutList.append(f150)
        checkOutList.append(f151)
        checkOutList.append(f152)
        checkOutList.append(f153)
        checkOutList.append(f154)
        checkOutList.append(f155)
        checkOutList.append(f156)
        checkOutList.append(f157)
        checkOutList.append(f158)
        checkOutList.append(f159)
        checkOutList.append(f160)
        checkOutList.append(f161)
        checkOutList.append(f162)
        checkOutList.append(f163)
        checkOutList.append(f164)
        checkOutList.append(f165)
        checkOutList.append(f166)
        checkOutList.append(f167)
        checkOutList.append(f168)
        checkOutList.append(f169)
        checkOutList.append(f170)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startGame()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func zero(sender: UIButton) {
        for(var i = 0; i < checkOutList.count; i++){
            println("at index \(i) get \(checkOutList[i])")
        }
        
        println("current Player list is \(newGame.listGameArray())")
        let zero: String = "0"
        if(numberStr.isEmpty){
            numberStr = zero
        }else{
            numberStr += zero
            pointsDspl.text = numberStr
            println(" numberString \(numberStr)")
        }
    }
    
    @IBAction func one(sender: UIButton) {
        let one = "1"
        if(numberStr.isEmpty){
            numberStr = one
        }else{
            numberStr += one
            pointsDspl.text = numberStr
            println(" numberString \(numberStr)")
        }
        
        print("current game \(newGame.listGameArray())")
    }
    
    @IBAction func two(sender: UIButton) {
        
        let two = "2"
        if(numberStr.isEmpty){
            numberStr = two
        }else{
            numberStr += two
            pointsDspl.text = numberStr
            println(" numberString \(numberStr)")
        }
    }
    
    @IBAction func three(sender: UIButton) {
        
        let three: String = "3"
        if(numberStr.isEmpty){
            numberStr = three
        }else{
            numberStr += three
            pointsDspl.text = numberStr
            println(" numberString \(numberStr)")
        }
    }
    
    @IBAction func four(sender: UIButton) {
        
        let four: String = "4"
        if(numberStr.isEmpty){
            numberStr = four
        }else{
            numberStr += four
            pointsDspl.text = numberStr
            println(" numberString \(numberStr)")
        }
    }
    
    @IBAction func five(sender: UIButton) {
        
        let five: String = "5"
        if(numberStr.isEmpty){
            numberStr = five
        }else{
            numberStr += five
            pointsDspl.text = numberStr
            println(" numberString \(numberStr)")
        }
    }
    
    @IBAction func six(sender: UIButton) {
        
        let six: String = "6"
        if(numberStr.isEmpty){
            numberStr = six
        }else{
            numberStr += six
            pointsDspl.text = numberStr
            println(" numberString \(numberStr)")
        }
    }
    
    @IBAction func seven(sender: UIButton) {
        
        let seven: String = "7"
        if(numberStr.isEmpty){
            numberStr = seven
        }else{
            numberStr += seven
            pointsDspl.text = numberStr
            println(" numberString \(numberStr)")
        }
    }
    
    @IBAction func eight(sender: UIButton) {
        
        let eight: String = "8"
        if(numberStr.isEmpty){
            numberStr = eight
        }else{
            numberStr += eight
            pointsDspl.text = numberStr
            println(" numberString \(numberStr)")
        }
    }
    
    @IBAction func nine(sender: UIButton) {
        
        let nine: String = "9"
        if(numberStr.isEmpty){
            numberStr = nine
            
        }else{
            numberStr += nine
            pointsDspl.text = numberStr
            println(" numberString \(numberStr)")
        }
    }
    
    @IBAction func cancel(sender: UIButton) {
        
        let cancel: String = "c"
        if(numberStr.isEmpty){
            
        }else{
            pointsDspl.text = "PTS"
            numberStr = ""
            println(" numberString \(numberStr)")
        }
    }
    
    
    @IBAction func ok(sender: UIButton) {
        
        // No Finish variables
        let noFinish169 = 169
        let noFinish168 = 168
        let noFinish166 = 166
        let noFinish165 = 165
        let noFinish163 = 163
        let noFinish162 = 162
        let noFinish159 = 159
        
        pointsDspl.text = "PTS"
        
        var score: Int!
        var stringScore:Int? = numberStr.toInt()
        score = stringScore!
        
        
        if(numberStr.isEmpty || score > maxScore){
            //Do Nothing
            numberStr = ""
            stringScore = nil
            score = nil
            println(" stringScore \(stringScore) numberString \(numberStr)")
        }else{
            //Game Loop
            for (var i = 0; i < newPlayer.playerList.count;i++){
                println("inside floor loop")
                
                //Player 1 manager
                if(newPlayer.playerList[i].myTurn == true && newPlayer.playerList[i].id == newPlayer.playerList[0].id){
                    
                    // turn player 2 checkout card on if on a finish
                    if(newPlayer.playerList[1].score <= maxCheckOut){
                        
                        for(var j = 0; j < checkOutList.count; j++){
                            println("inside check out loop")
                            if (j-1 == newPlayer.playerList[1].score){
                                
                                p2CheckOut.text = checkOutList[j]
                                p2CheckOut.hidden = false
                                p1CheckOut.hidden = true
                                
                            }
                        }
                    }
                    
                    if(newPlayer.playerList[1].score > maxCheckOut){
                        p1CheckOut.hidden = true
                    }
                    
                    var p1Score: Int!
                    newPlayer.playerList[i].darts += maxDarts
                    let tmpSets: Int = newPlayer.playerList[i].sets
                    var dspSets = String(tmpSets)
                    
                    let tmpLegs: Int = newPlayer.playerList[i].legs
                    var dspLegs = String(tmpLegs)
                    
                    //check if score is not in check out range and subtract score
                    if(newPlayer.playerList[i].score > maxCheckOut){
                        
                        //score
                        let p1StringScore:Int? = numberStr.toInt()
                        p1Score = p1StringScore!
                        p1ScoreList.append(p1Score)
                        print("p1ScoreList greater than max checkOut \(p1ScoreList)")
                        
                        newPlayer.playerList[0].score -= p1Score
                        let tmpScore: Int = newPlayer.playerList[i].score
                        var dspScore = String(tmpScore)
                        p1ScoreDspl.text = dspScore
                        
                        // legs
                        let tmpLegs: Int = newPlayer.playerList[i].legs
                        var dspLegs = String(tmpLegs)
                        p1legsDspl.text = dspLegs
                        
                        let tmpSets: Int = newPlayer.playerList[i].sets
                        var dspSets = String(tmpSets)
                        p1SetsDspl.text = dspSets
                        
                    }
                        // Only do this if score is less than score is  > 2 and < 170
                    else if(newPlayer.playerList[i].score <= maxCheckOut
                        && newPlayer.playerList[i].score != 168
                        || newPlayer.playerList[i].score != 169
                        || newPlayer.playerList[i].score != 166
                        || newPlayer.playerList[i].score != 165
                        || newPlayer.playerList[i].score != 163
                        || newPlayer.playerList[i].score != 162
                        || newPlayer.playerList[i].score != 159){
                            
                            //ToDo display checkOut possibality
                            
                            //score
                            let p1StringScore:Int? = numberStr.toInt()
                            p1Score = p1StringScore!
                            // add score to player 1 score array
                            p1ScoreList.append(p1Score)
                            print("p1ScoreList less the maxCheckOut\(p1ScoreList)")
                            
                            newPlayer.playerList[0].score -= p1Score
                            let tmpScore: Int = newPlayer.playerList[i].score
                            var dspScore = String(tmpScore)
                            p1ScoreDspl.text = dspScore
                            
                            // legs
                            let tmpLegs: Int = newPlayer.playerList[i].legs
                            var dspLegs = String(tmpLegs)
                            p1legsDspl.text = dspLegs
                            
                            let tmpSets: Int = newPlayer.playerList[i].sets
                            var dspSets = String(tmpSets)
                            p1SetsDspl.text = dspSets
                            
                            
                            // not working
                            if(newPlayer.playerList[i].score < noScore || newPlayer.playerList[i].score == bustOne){
                                //ToDo reset to prevoius score of player when bust
                                p1CheckOut.text = checkOutList[0]
                                println("P1 gone bust")
                                
                                newPlayer.playerList[i].score += p1Score
                                print("p1ScoreList remove\(p1ScoreList)")
                                let tmpScore: Int = newPlayer.playerList[i].score
                                var dspScore = String(tmpScore)
                                p1ScoreDspl.text = dspScore
                                
                                p1CheckOut.text = f1
                                p1CheckOut.hidden = false
                                
                                
                            }
                            
                            if (newPlayer.playerList[i].score == checkedOut){
                                newGame.gameList[0].legWon = true
                                
                                p1HighestCheckOut.append(p1Score)
                                print("\(p1HighestCheckOut)")
                                
                                
                                println("Player1 checked out")
                                newPlayer.playerList[i].score = 501
                                newPlayer.playerList[1].score = 501
                                let tmpScore: Int = newPlayer.playerList[i].score
                                var dspScore = String(tmpScore)
                                p1ScoreDspl.text = dspScore
                                p2ScoreDspl.text = dspScore
                                p1CheckOut.hidden = true
                                p2CheckOut.hidden = true
                                
                                if(newPlayer.playerList[i].legs < newGame.gameList[0].legs){
                                    println("P1 leg incremented")
                                    newPlayer.playerList[i].legs += increment
                                    let tmpLegs: Int = newPlayer.playerList[i].legs
                                    var dspLegs = String(tmpLegs)
                                    p1legsDspl.text = dspLegs
                                    
                                    if(newPlayer.playerList[i].legs == newGame.gameList[0].legs){
                                        println("P1 legs at Sets incremented")
                                        newGame.gameList[0].firstToLegsTotal = true
                                        
                                        if (newPlayer.playerList[i].sets < newGame.gameList[0].sets){
                                            
                                            newPlayer.playerList[i].sets += increment
                                            //trip set on bool so other player throws first on next set
                                            
                                            if(newPlayer.playerList[i].sets == newGame.gameList[0].sets){
                                                
                                                print("Player \(newPlayer.playerList[i].name) has won the match")
                                                newPlayer.playerList[i].win = true
                                                
                                                //ToDo insert a pause or wait function here
                                                self.performSegueWithIdentifier("gameManagerToWinView", sender: nil)
                                            }
                                        }
                                        
                                        let tmpSets: Int = newPlayer.playerList[i].sets
                                        var dspSets = String(tmpSets)
                                        p1SetsDspl.text = dspSets
                                        legWasOne()
                                    }
                                }
                            }
                    }
                }
                    
                    // Player2/CPU manager
                else if (newPlayer.playerList[i].myTurn == true && newPlayer.playerList[i].id == newPlayer.playerList[1].id){
                    
                    // turn player 1 checkout card on if on a finish
                    if(newPlayer.playerList[0].score <= maxCheckOut){
                        
                        for(var j = 0; j < checkOutList.count; j++){
                            println("inside check out loop")
                            if (j-1 == newPlayer.playerList[0].score){
                                
                                p1CheckOut.text = checkOutList[j]
                                p1CheckOut.hidden = false
                                p2CheckOut.hidden = true
                                
                            }
                        }
                    }
                    
                    if(newPlayer.playerList[0].score > maxCheckOut){
                        p2CheckOut.hidden = true
                    }
                    
                    var p2Score: Int!
                    newPlayer.playerList[i].darts += maxDarts
                    let tmpSets: Int = newPlayer.playerList[i].sets
                    var dspSets = String(tmpSets)
                    
                    let tmpLegs: Int = newPlayer.playerList[i].legs
                    var dspLegs = String(tmpLegs)
                    
                    //check if score is not in check out range and subtract score
                    if(newPlayer.playerList[i].score > maxCheckOut){
                        
                        //score
                        let p2StringScore:Int? = numberStr.toInt()
                        p2Score = p2StringScore!
                        p2ScoreList.append(p2Score)
                        print("p2ScoreList greater than max checkOut  \(p2ScoreList)")
                        newPlayer.playerList[1].score -= p2Score
                        let tmpScore: Int = newPlayer.playerList[i].score
                        var dspScore = String(tmpScore)
                        p2ScoreDspl.text = dspScore
                        
                        // legs
                        let tmpLegs: Int = newPlayer.playerList[i].legs
                        var dspLegs = String(tmpLegs)
                        p2LegsDspl.text = dspLegs
                        
                        let tmpSets: Int = newPlayer.playerList[i].sets
                        var dspSets = String(tmpSets)
                        p2SetsDpsl.text = dspSets
                        
                        // turn player 1 checkout card on if on a finish
                        if(newPlayer.playerList[0].score <= maxCheckOut){
                            
                            for(var j = 0; j < checkOutList.count; j++){
                                println("inside check out loop")
                                if (j-1 == newPlayer.playerList[0].score){
                                    
                                    p1CheckOut.text = checkOutList[j]
                                    p1CheckOut.hidden = false
                                    p2CheckOut.hidden = true
                                    
                                }
                            }
                        }
                    }
                        // Only do this if score is less than score is  > 2 and < 170
                    else if(newPlayer.playerList[i].score <= maxCheckOut
                        && newPlayer.playerList[i].score != 168
                        || newPlayer.playerList[i].score != 169
                        || newPlayer.playerList[i].score != 166
                        || newPlayer.playerList[i].score != 165
                        || newPlayer.playerList[i].score != 163
                        || newPlayer.playerList[i].score != 162
                        || newPlayer.playerList[i].score != 159){
                            
                            //ToDo display checkOut possibality
                            
                            //score
                            let p2StringScore:Int? = numberStr.toInt()
                            p2Score = p2StringScore!
                            p2ScoreList.append(p2Score)
                            print("p2ScoreList less than or = maxcheckOut \(p2ScoreList)")
                            newPlayer.playerList[1].score -= p2Score
                            let tmpScore: Int = newPlayer.playerList[i].score
                            var dspScore = String(tmpScore)
                            p2ScoreDspl.text = dspScore
                            
                            // legs
                            let tmpLegs: Int = newPlayer.playerList[i].legs
                            var dspLegs = String(tmpLegs)
                            p2LegsDspl.text = dspLegs
                            
                            let tmpSets: Int = newPlayer.playerList[i].sets
                            var dspSets = String(tmpSets)
                            p2SetsDpsl.text = dspSets
                            
                            for(var j = 0; j < checkOutList.count; j++){
                                println("inside check out loop")
                                if (j-1 == newPlayer.playerList[0].score){
                                    
                                    p1CheckOut.text = checkOutList[j]
                                    p1CheckOut.hidden = false
                                    p2CheckOut.hidden = true
                                    
                                }
                            }
                            
                            // not working
                            if(newPlayer.playerList[i].score < noScore || newPlayer.playerList[i].score == bustOne){
                                //ToDo reset to prevoius score of player when bust
                                p2CheckOut.text = checkOutList[0]
                                println("P2 gone bust")
                                
                                p2CheckOut.text = f1
                                p2CheckOut.hidden = false
                                
                                newPlayer.playerList[i].score += p2Score
                                let tmpScore: Int = newPlayer.playerList[i].score
                                var dspScore = String(tmpScore)
                                p2ScoreDspl.text = dspScore
                                
                                
                            }
                            
                            if (newPlayer.playerList[i].score == checkedOut){
                                newGame.gameList[0].legWon = true
                                
                                p2HighestCheckOut.append(p2Score)
                                print("\(p2HighestCheckOut)")
                                
                                
                                println("Player2 checked out")
                                newPlayer.playerList[i].score = 501
                                newPlayer.playerList[0].score = 501
                                let tmpScore: Int = newPlayer.playerList[i].score
                                var dspScore = String(tmpScore)
                                p1ScoreDspl.text = dspScore
                                p2ScoreDspl.text = dspScore
                                p1CheckOut.hidden = true
                                p2CheckOut.hidden = true
                                
                                if(newPlayer.playerList[i].legs < newGame.gameList[0].legs){
                                    println("P2 leg incremented")
                                    
                                    newPlayer.playerList[i].legs += increment
                                    let tmpLegs: Int = newPlayer.playerList[i].legs
                                    var dspLegs = String(tmpLegs)
                                    p2LegsDspl.text = dspLegs
                                    
                                    if(newPlayer.playerList[i].legs == newGame.gameList[0].legs){
                                        println("P2 legs at Sets incremented")
                                        newGame.gameList[0].firstToLegsTotal = true
                                        
                                        if (newPlayer.playerList[i].sets < newGame.gameList[0].sets){
                                            newPlayer.playerList[i].sets += increment
                                            
                                            //trip set on bool so other player throws first on next set
                                            
                                            
                                            if(newPlayer.playerList[i].sets == newGame.gameList[0].sets){
                                                
                                                print("Player \(newPlayer.playerList[i].name) has won the match")
                                                newPlayer.playerList[i].win = true
                                                
                                                //ToDo insert a pause or wait function here
                                                self.performSegueWithIdentifier("gameManagerToWinView", sender: nil)
                                            }
                                        }
                                        
                                        let tmpSets: Int = newPlayer.playerList[i].sets
                                        var dspSets = String(tmpSets)
                                        p2SetsDpsl.text = dspSets
                                        legWasOne()
                                    }
                                }
                            }
                    }
                }
            }
            changePlayerTurnAndTextColor()
            println(" numberString \(numberStr)")
            numberStr = ""
            println(" numberString after delete \(numberStr)")
            
            println("curent list \(newPlayer.listPlayerArray())")
            
            
        }
    }
    
    func legIndicatorDot(){
        
        if(p1SetIndicator.hidden == false && newGame.gameList[0].legWon == true){
            
            p1SetIndicator.hidden = true
            p2SetIndicator.hidden = false
        }else if(p2SetIndicator.hidden == false && newGame.gameList[0].legWon == true){
            
            p2SetIndicator.hidden = true
            p1SetIndicator.hidden = false
            
        }
        //newGame.gameList[0].legWon = false
    }
    
    
    func legWasOne(){
        
        if(newGame.gameList[0].firstToLegsTotal == true && newGame.gameList[0].legWon == true){
            println("legsOne check condition")
            p1CheckOut.hidden = true
            p2CheckOut.hidden = true
            newPlayer.playerList[0].score = 501
            newPlayer.playerList[0].darts = 0
            newPlayer.playerList[0].legs = noLegs
            newPlayer.playerList[1].score = 501
            newPlayer.playerList[1].darts = 0
            newPlayer.playerList[1].legs = noLegs
            
            let tmpScore = newPlayer.playerList[0].score
            var dspScore = String(tmpScore)
            p1ScoreDspl.text = dspScore
            p2ScoreDspl.text = dspScore
            
            let tmpLegs = newPlayer.playerList[0].legs
            var dspLegs = String(tmpLegs)
            p1legsDspl.text = dspLegs
            p2LegsDspl.text = dspLegs
            
            newGame.gameList[0].firstToLegsTotal = false
            
        }
        else if(newGame.gameList[0].legWon == true){
            println("legsOne check condition")
            p1CheckOut.hidden = true
            p2CheckOut.hidden = true
            newPlayer.playerList[0].score = 501
            newPlayer.playerList[0].darts = 0
            //newPlayer.playerList[0].legs = noLegs
            newPlayer.playerList[1].score = 501
            newPlayer.playerList[1].darts = 0
            //newPlayer.playerList[1].legs = noLegs
            
            let tmpScore = newPlayer.playerList[0].score
            var dspScore = String(tmpScore)
            p1ScoreDspl.text = dspScore
            p2ScoreDspl.text = dspScore
            
            let tmpLegs = newPlayer.playerList[0].legs
            var dspLegs = String(tmpLegs)
            p1legsDspl.text = dspLegs
            p2LegsDspl.text = dspLegs
            
        }
    }
    
    
    func changePlayerTurnAndTextColor() {
        
        if(newGame.gameList[0].legWon == true && p1SetIndicator.hidden == false){
            
            p2SetIndicator.hidden = false
            p1SetIndicator.hidden = true
            newPlayer.playerList[0].myTurn = false
            newPlayer.playerList[1].myTurn = true
            p1TurnIcon.hidden = true
            p2TurnIcon.hidden = false
            p1NameDspl.textColor = UIColor.grayColor()
            p1SetsDspl.textColor = UIColor.grayColor()
            p1legsDspl.textColor = UIColor.grayColor()
            p1ScoreDspl.textColor = UIColor.grayColor()
            
            p2NameDspl.textColor = UIColor.whiteColor()
            p2LegsDspl.textColor = UIColor.whiteColor()
            p2SetsDpsl.textColor = UIColor.whiteColor()
            p2ScoreDspl.textColor = UIColor.whiteColor()
            
            newGame.gameList[0].legWon = false
            
            print("inside 1.(newGame.gameList[0].legWon == true && p1SetIndicator.hidden == false)")
            
        }
        else if(newGame.gameList[0].legWon == true && p2SetIndicator.hidden == false){
            
            p2SetIndicator.hidden = true
            p1SetIndicator.hidden = false
            newPlayer.playerList[1].myTurn = false
            newPlayer.playerList[0].myTurn = true
            p1TurnIcon.hidden = false
            p2TurnIcon.hidden = true
            p2NameDspl.textColor = UIColor.grayColor()
            p2SetsDpsl.textColor = UIColor.grayColor()
            p2LegsDspl.textColor = UIColor.grayColor()
            p2ScoreDspl.textColor = UIColor.grayColor()
            
            p1NameDspl.textColor = UIColor.whiteColor()
            p1legsDspl.textColor = UIColor.whiteColor()
            p1SetsDspl.textColor = UIColor.whiteColor()
            p1ScoreDspl.textColor = UIColor.whiteColor()
            
            newGame.gameList[0].legWon = false
            
            print("inside 2.(newGame.gameList[0].legWon == true && p2SetIndicator.hidden == false)")
            
            
        }else if(newPlayer.playerList[0].myTurn == true && newGame.gameList[0].legWon == false){
            
            newPlayer.playerList[0].myTurn = false
            newPlayer.playerList[1].myTurn = true
            p1TurnIcon.hidden = true
            p2TurnIcon.hidden = false
            p1NameDspl.textColor = UIColor.grayColor()
            p1SetsDspl.textColor = UIColor.grayColor()
            p1legsDspl.textColor = UIColor.grayColor()
            p1ScoreDspl.textColor = UIColor.grayColor()
            
            p2NameDspl.textColor = UIColor.whiteColor()
            p2LegsDspl.textColor = UIColor.whiteColor()
            p2SetsDpsl.textColor = UIColor.whiteColor()
            p2ScoreDspl.textColor = UIColor.whiteColor()
            
            print("inside 3.(newPlayer.playerList[0].myTurn == true && newGame.gameList[0].legWon == false)")
        }
        else if(newPlayer.playerList[1].myTurn == true && newGame.gameList[0].legWon == false){
            
            newPlayer.playerList[1].myTurn = false
            newPlayer.playerList[0].myTurn = true
            p1TurnIcon.hidden = false
            p2TurnIcon.hidden = true
            p2NameDspl.textColor = UIColor.grayColor()
            p2SetsDpsl.textColor = UIColor.grayColor()
            p2LegsDspl.textColor = UIColor.grayColor()
            p2ScoreDspl.textColor = UIColor.grayColor()
            
            p1NameDspl.textColor = UIColor.whiteColor()
            p1legsDspl.textColor = UIColor.whiteColor()
            p1SetsDspl.textColor = UIColor.whiteColor()
            p1ScoreDspl.textColor = UIColor.whiteColor()
            
            print("inside 4.(newPlayer.playerList[1].myTurn == true && newGame.gameList[0].legWon == false)")
        }
        else{
            
            println("(error exception) both false or both true")
        }
        print("game state \(newGame.listGameArray())\n")
        print("newGame \(newGame.gameList[0].legWon)")
        newGame.gameList[0].legWon == false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var finishVC: FinishViewController = segue.destinationViewController as! FinishViewController
        
        finishVC.recivedP1Array = p1ScoreList
        finishVC.recivedP2Array = p2ScoreList
        finishVC.recivedP1HighestCheckOut = p1HighestCheckOut
        finishVC.recivedP2HighestCheckOut = p2HighestCheckOut
        finishVC.recivedP1Sets = newPlayer.playerList[0].sets
        finishVC.recivedP2sets = newPlayer.playerList[1].sets
    }
}
