//
//  Game.swift
//  501 Darts
//
//  Created by William O'Keeffe on 20/01/2015.
//  Copyright (c) 2015 GryffindorLogicStudio. All rights reserved.
//

import Foundation

import UIKit

var newGame: NewGame = NewGame()


struct game{
    
    var sets = 0
    var legs = 0
    var firstToLegsTotal = false
    var legWon = false
    var gameWon = false
}

class NewGame: NSObject {
    
    var gameList = [game]()
    
    func addGame( sets:Int,legs:Int, firstToLegsTotal:Bool, legWon:Bool, gameWon:Bool) {
        
        gameList.append(game(sets:sets, legs:legs, firstToLegsTotal:false, legWon:false, gameWon:false))
    }
    
    func listGameArray(){
        for newGame in gameList{
            println("sets: \(newGame.sets) legs: \(newGame.legs) firstToLegsTotal \(newGame.firstToLegsTotal) legWon \(newGame.legWon) gameWon \(newGame.gameWon)")
        }
    }
}

