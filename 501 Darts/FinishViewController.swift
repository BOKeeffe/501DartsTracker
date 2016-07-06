//
//  finishView.swift
//  501 Darts
//
//  Created by William O'Keeffe on 07/05/2015.
//  Copyright (c) 2015 GryffindorLogicStudio. All rights reserved.
//

import Foundation
import UIKit

class FinishViewController: UIViewController{
    
    var recivedP1Array: [Int] = []
    var recivedP2Array : [Int] = []
    
    var recivedP1Sets: Int = 0
    var recivedP2sets: Int = 0
    
    var recivedP1HighestCheckOut: [Int] = []
    var recivedP2HighestCheckOut: [Int] = []
    

    // IB outlets to modify view appearence
    @IBOutlet var playerWinnerView: UIView!
    @IBOutlet var playerNameView: UIView!
    @IBOutlet var finalPlayerScoreView: UIView!
    @IBOutlet var averagerScoreView: UIView!
    @IBOutlet var oneEightyView: UIView!
    @IBOutlet var oneForthyView: UIView!
    @IBOutlet var oneHundredView: UIView!
    @IBOutlet var sixthyView: UIView!
    @IBOutlet var highestCheckOut: UIView!
    @IBOutlet var dartsUsedView: UIView!
    @IBOutlet var checkOutPercentage: UIView!
    
    //actions
    @IBOutlet var winnerDspText: UITextField!
    
    @IBOutlet var player1NameDsp: UITextField!
    @IBOutlet var player2NameDsp: UITextField!
    
    @IBOutlet var player1FinalScore: UITextField!
    @IBOutlet var player2FinalScore: UITextField!
    
    @IBOutlet var player1OneEighty: UITextField!
    @IBOutlet var player2OneEighty: UITextField!
    
    @IBOutlet var player1oneForthy: UITextField!
    @IBOutlet var player2oneForthy: UITextField!
    
    @IBOutlet var player1oneHundred: UITextField!
    @IBOutlet var player2oneHundred: UITextField!
    
    @IBOutlet var player1sixthy: UITextField!
    @IBOutlet var player2sixthy: UITextField!
    
    @IBOutlet var p1Average: UITextField!
    @IBOutlet var p2average: UITextField!
    
    @IBOutlet var p1HighestFinish: UITextField!
    @IBOutlet var p2HighestFinish: UITextField!
    
    var winnerNameStr = ""
    
    @IBOutlet var bottomBoarder: UIView!
    
    func startGame(){
        
        bottomBoarder.hidden = true
        
        // set up & customising of each view in finishViewController
        player1NameDsp.layer.borderWidth = 1
        player1NameDsp.layer.borderColor = UIColor.whiteColor().CGColor
        player1NameDsp.layer.cornerRadius = 5
        
        player2NameDsp.layer.borderWidth = 1
        player2NameDsp.layer.borderColor = UIColor.whiteColor().CGColor
        player2NameDsp.layer.cornerRadius = 5
        
        playerWinnerView.layer.cornerRadius = 5
        playerWinnerView.layer.borderWidth = 1
        playerWinnerView.layer.borderColor = UIColor.whiteColor().CGColor
        
        finalPlayerScoreView.layer.cornerRadius = 5
        finalPlayerScoreView.layer.borderWidth = 1
        finalPlayerScoreView.layer.borderColor = UIColor.whiteColor().CGColor
        
        averagerScoreView.layer.cornerRadius = 5
        averagerScoreView.layer.borderColor = UIColor.whiteColor().CGColor
        averagerScoreView.layer.borderWidth = 1
        
        oneEightyView.layer.cornerRadius = 5
        oneEightyView.layer.borderWidth = 1
        oneEightyView.layer.borderColor = UIColor.whiteColor().CGColor
        
        oneForthyView.layer.cornerRadius = 5
        oneForthyView.layer.borderWidth = 1
        oneForthyView.layer.borderColor = UIColor.whiteColor().CGColor
        
        oneHundredView.layer.cornerRadius = 5
        oneHundredView.layer.borderWidth = 1
        oneHundredView.layer.borderColor = UIColor.whiteColor().CGColor
        
        sixthyView.layer.cornerRadius = 5
        sixthyView.layer.borderWidth = 1
        sixthyView.layer.borderColor = UIColor.whiteColor().CGColor
        
        checkOutPercentage.layer.cornerRadius = 5
        checkOutPercentage.layer.borderWidth = 1
        checkOutPercentage.layer.borderColor = UIColor.whiteColor().CGColor
        
        highestCheckOut.layer.cornerRadius = 5
        highestCheckOut.layer.borderWidth = 1
        highestCheckOut.layer.borderColor = UIColor.whiteColor().CGColor
        
        dartsUsedView.layer.cornerRadius = 5
        dartsUsedView.layer.borderWidth = 1
        dartsUsedView.layer.borderColor = UIColor.whiteColor().CGColor
        
        //display players end of game stats
        player1NameDsp.text = newPlayer.playerList[0].name
        player2NameDsp.text = newPlayer.playerList[1].name
        
        let tempScore: Int = recivedP1Sets
        var dspScore = String(tempScore)
        player1FinalScore.text = dspScore
        
        let temp2Score: Int = recivedP2sets
        var dsp2Score = String(tempScore)
        player2FinalScore.text = dspScore
        
        whoWonMatch()
        findPlayer1AverageScore()
        findPlayer2AverageScore()
        findP1NumberStats()
        findP2NumberStats()
        findHighestCheckOut()
        
        
        
        
        print("***** gameManager arrays \(recivedP1Array)*****\n **** \(recivedP2Array)")
    }

    // display the match winners to stats table
    func whoWonMatch(){
        
        if(newPlayer.playerList[0].win){
            winnerNameStr = newPlayer.playerList[0].name + " won the match"
            newPlayer.playerList[0].win = false
        }else if (newPlayer.playerList[1].win){
            winnerNameStr = newPlayer.playerList[1].name + " won the match"
            newPlayer.playerList[1].win = false
        }
        winnerDspText.text = winnerNameStr
    }
    
    func playerScore(){
        
        //player 1 score
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startGame()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func findPlayer1AverageScore(){
        
        var sumOfAllScores = 0
        var averageOfvalues: Double = 0
        for(var i = 0; i < recivedP1Array.count; i++){
            sumOfAllScores += recivedP1Array[i]
        }
        
        averageOfvalues = Double(sumOfAllScores) / Double(recivedP1Array.count)
        let tmpScore : Double = averageOfvalues
        var dspScore = toString(tmpScore)
        p1Average.text = dspScore
        
        print("The average score of player 1 \(averageOfvalues)")
        
        
    }
    
    func findPlayer2AverageScore(){
        
        var sumOfAllScores = 0
        var averageOfvalues: Double = 0
        for(var i = 0; i < recivedP2Array.count; i++){
            sumOfAllScores += recivedP2Array[i]
        }
        
        averageOfvalues = Double(sumOfAllScores) / Double(recivedP2Array.count)
        
        let tmpScore: Double = averageOfvalues
        var dspScore = toString(tmpScore)
        p2average.text = dspScore
        
        print("The average score of player 2 \(averageOfvalues)")
    
    }
    
    func findP1NumberStats(){
        //player1 vars
        var oneEighty = 180
        var oneForthy = 140
        var oneHundred = 100
        var sixthy = 60
        
        var countOneEightys = 0
        var countOneForthys = 0
        var countOneHunderds = 0
        var countSixthys = 0
        
        // find player1 stats
        for(var i = 0; i < recivedP1Array.count; i++){
            
            var oneEighty = 180
            var oneForthy = 140
            var oneHundred = 100
            var sixthy = 60
            
            if(recivedP1Array[i] == oneEighty){
                countOneEightys++
            }
            else if(recivedP1Array[i] == oneForthy){
                countOneForthys++
            }
            else if(recivedP1Array[i] == oneHundred){
                countOneHunderds++
            }
            else if(recivedP1Array[i] == sixthy){
                countSixthys++
            }
        }
        
        let temp180: Int = countOneEightys
        var dsp180 = String(temp180)
        player1OneEighty.text = dsp180
        
        let temp140: Int = countOneForthys
        var dsp140 = String(temp140)
        player1oneForthy.text = dsp140
        
        let temp100: Int = countOneHunderds
        var dsp100 = String(temp100)
        player1oneHundred.text = dsp100
        
        let temp60: Int = countSixthys
        var dsp60 = String(temp60)
        player1sixthy.text = dsp60
        
    }
    
    
    func findP2NumberStats(){
        
        //player1 vars
        var oneEighty = 180
        var oneForthy = 140
        var oneHundred = 100
        var sixthy = 60
        
        var countOneEightys = 0
        var countOneForthys = 0
        var countOneHunderds = 0
        var countSixthys = 0
        
        // find player1 stats
        for(var i = 0; i < recivedP2Array.count; i++){
            
            var oneEighty = 180
            var oneForthy = 140
            var oneHundred = 100
            var sixthy = 60
            
            if(recivedP2Array[i] == oneEighty){
                countOneEightys++
            }
            else if(recivedP2Array[i] == oneForthy){
                countOneForthys++
            }
            else if(recivedP2Array[i] == oneHundred){
                countOneHunderds++
            }
            else if(recivedP2Array[i] == sixthy){
                countSixthys++
            }
        }
        
        let temp180: Int = countOneEightys
        var dsp180 = String(temp180)
        player2OneEighty.text = dsp180
        
        let temp140: Int = countOneForthys
        var dsp140 = String(temp140)
        player2oneForthy.text = dsp140
        
        let temp100: Int = countOneHunderds
        var dsp100 = String(temp100)
        player2oneHundred.text = dsp100
        
        let temp60: Int = countSixthys
        var dsp60 = String(temp60)
        player2sixthy.text = dsp60
    }
    
    func findHighestCheckOut(){
        
        //Check Player 1 highest finish
        if(!recivedP1HighestCheckOut.isEmpty){
            var p1HighestCheckOut = recivedP1HighestCheckOut[0]
            for(var i = 0; i < recivedP1HighestCheckOut.count; i++){
                if(p1HighestCheckOut < recivedP1HighestCheckOut[i]){
                    p1HighestCheckOut = recivedP1HighestCheckOut[i]
                }
            }
            let tempP1HighestChecOut: Int = p1HighestCheckOut
            var dspP1HighestCheckout = String(tempP1HighestChecOut)
            p1HighestFinish.text = dspP1HighestCheckout
        }
        
        //
        if(!recivedP2HighestCheckOut.isEmpty){
            var p2HighestCheckOut = recivedP2HighestCheckOut[0]
            for(var i = 0; i < recivedP2HighestCheckOut.count; i++){
                if(p2HighestCheckOut < recivedP2HighestCheckOut.count){
                    p2HighestCheckOut = recivedP2HighestCheckOut[i]
                }
            }
            let tempP2HighestCheckOut: Int = p2HighestCheckOut
            var dspP2HighestCheckOut = String(tempP2HighestCheckOut)
            p2HighestFinish.text = dspP2HighestCheckOut
        }
        print("p1 Finish \(p1HighestFinish) \n")
        print("p1 Finish \(p2HighestFinish)")

    }

}
