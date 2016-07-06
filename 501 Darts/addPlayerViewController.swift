//
//  addPlayerViewController.swift
//  501 Darts
//
//  Created by William O'Keeffe on 19/01/2015.
//  Copyright (c) 2015 GryffindorLogicStudio. All rights reserved.
//

import UIKit

var addPlayer: addPlayerViewController = addPlayerViewController()

class addPlayerViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var player1TextField: UITextField!
    @IBOutlet var player2TextField: UITextField!
    @IBOutlet var setsTextField: UITextField!
    @IBOutlet var legsTextField: UITextField!
    
    var maxSets:Int!
    var maxLegs:Int!
    
    var currentLegValue:Int!
    var currentSetValue:Int!
    
    let leg1 = 1
    let leg3 = 3
    let leg5 = 5
    let leg7 = 7
    let leg9 = 9
    
    let set1 = 1
    let set3 = 3
    let set5 = 5
    let set7 = 7
    let set9 = 9
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        currentLegValue = leg1
        currentSetValue = set1
        
        var zeroLegs = 0
        var zeroSets = 0
        
        //newGame.addGame(zeroSets, legs:zeroLegs,legWon:false, gameWon:false)
        
        
        var tmpSets: Int =  currentLegValue//newGame.gameList[0].setList[0]
        var dspSets = String(tmpSets)
        setsTextField.text = dspSets
        
        var tmpLegs: Int = currentLegValue //newGame.gameList[0].legList[0]
        var dspLegs = String(tmpLegs)
        legsTextField.text = dspSets
        
        
        println("\(currentLegValue)")
        println(" \(newGame.listGameArray()) ")
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // iOS Toush function (close touch pad by touching the screen)
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        self.view.endEditing(true)
        self.player1TextField.resignFirstResponder()
    }
*/
    /*
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            // ...
            self.view.endEditing(true)
            self.player1TextField.resignFirstResponder()
        }
       // super.touchesBegan(touches, withEvent:event)
    }
*/
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        // called when 'return' key pressed. return NO to ignore.
        
        textField.resignFirstResponder()
        return false
    }
    
    @IBAction func legsRightBtn(sender: UIButton) {
       
        if(currentLegValue == leg1){
            currentLegValue = leg3
        } else if (currentLegValue == leg3){
            currentLegValue = leg5
        } else if (currentLegValue == leg5){
            currentLegValue = leg7
        } else if (currentLegValue == leg7){
            currentLegValue = leg9
        }
        
        let tmpLegs =  currentLegValue
        var dspLegs = String(tmpLegs)
        legsTextField.text = dspLegs
        
    }
        
    
    
    @IBAction func legsLeftBtn(sender: UIButton) {
        
        if (currentLegValue == leg9){
            currentLegValue = leg7
        } else if (currentLegValue == leg7){
            currentLegValue = leg5
        } else if (currentLegValue == leg5){
            currentLegValue = leg3
        } else if (currentLegValue == leg3){
            currentLegValue = leg1
        }
        
        let tmpLegs =  currentLegValue
        var dspLegs = String(tmpLegs)
        legsTextField.text = dspLegs
        
    }
    
    
    @IBAction func setsRightBtn(sender: UIButton) {
        
        if(currentSetValue == set1){
            currentSetValue = set3
        } else if (currentSetValue == set3){
                currentSetValue = set5
        } else if (currentSetValue == set5){
            currentSetValue = set7
        } else if (currentSetValue == set7){
            currentSetValue = set9
        }
        
        let tmpSets = currentSetValue
        var dspSets = String(tmpSets)
        setsTextField.text = dspSets
    }
    
    
    @IBAction func setsLeftBtn(sender: UIButton) {
        
        if(currentSetValue == set9){
            currentSetValue = set7
        } else if (currentSetValue == set7){
            currentSetValue = set5
        } else if(currentSetValue == set5){
            currentSetValue = set3
        } else if (currentSetValue == set3){
            currentSetValue = set1
        }
        
        let tmpSets = currentSetValue
        var dspSets = String(tmpSets)
        setsTextField.text = dspSets
    }
    
    //Events
    @IBAction func butnDonePressed(sender: UIButton){
        
        
        
        if(player1TextField.text == "" || player2TextField.text == "" || setsTextField.text == "" || legsTextField.text == ""){
            // do nothing
        }
        else if(!newGame.gameList.isEmpty){
            // Do nothing
        }
        else{
            
            //toInt return optional(tring to Int conversion)
            let setsDsp:Int? = setsTextField.text.toInt()
            let legsDsp: Int? = legsTextField.text.toInt()
            
            
            // check setsDsp and legsDsp before unwrapping
            if (setsDsp != nil) {
                maxSets = setsDsp!
                setsTextField.text = "Sets \(maxSets)"
                var legsDspAns = legsDsp!
            }else{
                setsTextField.text = "Invalid Input"
            }
            
            if (legsDsp != nil) {
                maxLegs = legsDsp!
                legsTextField.text = "Legs \(maxLegs)"
            }else{
                
            }
            
            //create game and player and add to respective array's
            newGame.addGame(maxSets, legs:maxLegs,firstToLegsTotal:false, legWon:false, gameWon:false)
            
            newPlayer.addPlayer(0, name:player1TextField.text, score:501, sets:0, legs:0, darts:0, myTurn:false, finish:false, win:false, setStarted:false, legStarted:false)
            
            newPlayer.addPlayer(1, name:player2TextField.text, score:501, sets:0, legs:0, darts:0, myTurn:false, finish:false, win:false, setStarted:false, legStarted:false)
            
            self.view.endEditing(true)
            println(" \(newGame.gameList[0]) ")
            
            println(" \(newPlayer.listPlayerArray()) ")
        }
        
        var checkOutOptions: [String]

    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
