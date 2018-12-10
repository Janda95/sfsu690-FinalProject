//
//  CurrentGameViewController.swift
//  TrapShootingApp
//
//  Created by Jarek Rettinghouse on 12/1/18.
//  Copyright © 2018 JLR. All rights reserved.
//

import UIKit

class CurrentGameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        newGame = Game()
        currentNumber = 1
        shotNumber.text = String(currentNumber)
        newGame.date = Date()
        displayShotsLabel.text = newGame.returnDataString()
    }
    //new Game data for editing to be sent to player with corresponding id set in player selection
    var newGame: Game = nil
    var playerid: Int = -1
    var currentNumber: Int = -1
    
    
    @IBOutlet weak var gamenameTextField: UITextField!
    @IBOutlet weak var shotNumber: UILabel!
    @IBOutlet weak var displayShotsLabel: UILabel!
    
    @IBAction func minusButton(_ sender: UIButton) {
        if(currentNumber == 1){
            currentNumber = 25
        } else {
            currentNumber = currentNumber - 1
        }
        shotNumber.text = String(currentNumber)
    }
    
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
    }
    
    //2 is miss
    @IBAction func missButton(_ sender: Any) {
        newGame.gamedata[currentNumber-1] = 2
        displayShotsLabel.text = newGame.returnDataString()
    }
    
    
    
    //on game save, append function game to playerid from player array
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        gamenameTextField.resignFirstResponder()
        return true
    }
    
}
