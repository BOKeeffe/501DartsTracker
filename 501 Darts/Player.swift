//
//  Player.swift
//  501 Darts
//
//  Created by William O'Keeffe on 19/01/2015.
//  Copyright (c) 2015 GryffindorLogicStudio. All rights reserved.
//

import Foundation

import UIKit

var newPlayer: NewPlayer = NewPlayer()


struct player{
    var id = 0
    var name = "name"
    var score = 501
    var sets = 0
    var legs = 0
    var darts = 0
    var myTurn = false
    var finish = false
    var win = false
    var setStarted = false
    var legStarted = false
}

class NewPlayer: NSObject {
    
    var playerList = [player]()
    
    
    func addPlayer(id: Int, name:String, score:Int, sets:Int, legs:Int, darts:Int, myTurn:Bool, finish:Bool, win:Bool, setStarted: Bool, legStarted: Bool) {
        
        playerList.append(player(id:id, name:name, score:501, sets:sets, legs:legs, darts:darts, myTurn:false, finish:false, win:false, setStarted:false, legStarted:false))
        
        
    }
    
    func listPlayerArray(){
        for newPlayer in playerList{
            println("player id: \(newPlayer.id) Player name: \(newPlayer.name)  score: \(newPlayer.score) sets: \(newPlayer.sets) legs: \(newPlayer.legs) darts: \(newPlayer.darts) finish: \(newPlayer.finish) myTurn \(newPlayer.myTurn) setsWon\(newPlayer.setStarted) legs\(newPlayer.legStarted) ")
        }
    }
}
