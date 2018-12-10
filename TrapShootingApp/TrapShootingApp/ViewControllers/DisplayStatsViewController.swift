//
//  DisplayStatsViewController.swift
//  TrapShootingApp
//
//  Created by Jarek Rettinghouse on 12/1/18.
//  Copyright © 2018 JLR. All rights reserved.
//

import UIKit

class DisplayStatsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lastGamePlayedLabel.text = "Last Game Played at: " + localPlayer!.lastGameTime()
        usernameLabel.text = "Username: " + localPlayer!.username
        fullnameLabel.text = "Name: " + localPlayer!.fullname
        gamesplayedLabel.text = "Total Games: " + String(localPlayer!.Games.count)
        gameAverageLabel.text = "Overall Avg: " + String(localPlayer!.avg()) //round this????
        totalHLabel.text = localPlayer?.totalhit()
    }
    var localPlayer: Player?
    
    
    //Labels
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var gamesplayedLabel: UILabel!
    @IBOutlet weak var gameAverageLabel: UILabel!
    @IBOutlet weak var totalHLabel: UILabel!
    @IBOutlet weak var lastGamePlayedLabel: UILabel!
    
}
