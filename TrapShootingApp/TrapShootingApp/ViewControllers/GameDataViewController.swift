//
//  PlayerSelectionViewController.swift
//  TrapShootingApp
//
//  Created by Jarek Rettinghouse on 12/7/18.
//  Copyright © 2018 JLR. All rights reserved.
//

import UIKit

class GameDataViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(gamePlaceholder.gamename)
        playernameLabel.text = "Name: " + playername
        gamenameLabel.text = "Game: " + gamePlaceholder.gamename
        gametimeLabel.text = gamePlaceholder.date.description
        
        first5Label.text = "1: " + gamePlaceholder.first5()
        second5Label.text = "2: " + gamePlaceholder.second5()
        third5Label.text = "3: " + gamePlaceholder.third5()
        fourth5Label.text = "4: " + gamePlaceholder.fourth5()
        fifth5Label.text = "5: " + gamePlaceholder.fifth5()
    }
    
    var gamePlaceholder: Game!
    var playername: String!
    
    @IBOutlet weak var playernameLabel: UILabel!
    @IBOutlet weak var gamenameLabel: UILabel!
    @IBOutlet weak var gametimeLabel: UILabel!
    
    @IBOutlet weak var first5Label: UILabel!
    @IBOutlet weak var second5Label: UILabel!
    @IBOutlet weak var third5Label: UILabel!
    @IBOutlet weak var fourth5Label: UILabel!
    @IBOutlet weak var fifth5Label: UILabel!
    
}
