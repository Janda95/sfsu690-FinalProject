//
//  CurrentGameViewController.swift
//  TrapShootingApp
//
//  Created by Jarek Rettinghouse on 12/1/18.
//  Copyright © 2018 JLR. All rights reserved.
//

import UIKit

class CurrentGameViewController: UIViewController, UITextFieldDelegate{
    
    //sets label.text values
    override func viewDidLoad() {
        super.viewDidLoad()
        shotNumber.text = String(currentNumber)
        displayShotsLabel.text = newGame.returnDataString()
        errorMsgLabel.text = ""
        gamenameTextField.delegate = self
    }
    
    //new Game data for editing to be sent to player with corresponding id set in player selection
    var newGame: Game = Game()
    var playerid: Int = -1
    var currentNumber: Int = 1
    
    //Labels and Text Fields
    @IBOutlet weak var gamenameTextField: UITextField!
    @IBOutlet weak var shotNumber: UILabel!
    @IBOutlet weak var displayShotsLabel: UILabel!
    @IBOutlet weak var errorMsgLabel: UILabel!
    
    //updates index and display
    @IBAction func minusButton(_ sender: UIButton) {
        if(currentNumber == 1){
            currentNumber = 25
        } else {
            currentNumber = currentNumber - 1
        }
        shotNumber.text = String(currentNumber)
    }
    
    //updates index and display
    @IBAction func plusButton(_ sender: UIButton) {
        if(currentNumber == 25){
            currentNumber = 1
        } else {
            currentNumber = currentNumber + 1
        }
        shotNumber.text = String(currentNumber)
    }
    
    //0 is not entered yet
    //1 is hit
    @IBAction func hitButton(_ sender: Any) {
        
        newGame.gamedata[currentNumber-1] = 1
        displayShotsLabel.text = newGame.returnDataString()
        if(currentNumber == 25){
            currentNumber = 1
        } else {
            currentNumber = currentNumber + 1
        }
        shotNumber.text = String(currentNumber)
    }
    
    //2 is miss
    @IBAction func missButton(_ sender: Any) {
        newGame.gamedata[currentNumber-1] = 2
        displayShotsLabel.text = newGame.returnDataString()
        if(currentNumber == 25){
            currentNumber = 1
        } else {
            currentNumber = currentNumber + 1
        }
        shotNumber.text = String(currentNumber)
        
    }
    
    //do checks and save game else print error message
    @IBAction func saveGameButton(_ sender: Any) {
        
        if playerid == -1{
            print ("Player Id not passed")
            return
        } else if newGame.checkCompletion() > 0 {
            errorMsgLabel.text = "Need to finish game entry"
            return
        } else {
            guard let name = gamenameTextField.text else {
                print("Game TextField error!")
                return
            }
            newGame.gamename = name
            
            performSegue(withIdentifier: "unwindNewGame", sender: self)
        }
    }
    
    //prepare segue to main screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MainPageViewController {
            print(destination.playerList[playerid].Games.count)
            destination.playerList[playerid].Games.append(newGame)
            print(destination.playerList[playerid].Games.count)
            
        }
    }
    
    
    
    //on game save, append function game to playerid from player array
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        gamenameTextField.resignFirstResponder()
        return true
    }
    
}
