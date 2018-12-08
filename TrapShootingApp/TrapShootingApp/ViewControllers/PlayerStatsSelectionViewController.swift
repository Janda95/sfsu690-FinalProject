//
//  PlayerStatsSelectionViewController.swift
//  TrapShootingApp
//
//  Created by Jarek Rettinghouse on 12/1/18.
//  Copyright © 2018 JLR. All rights reserved.
//

import UIKit

class PlayerStatsSelectionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var playerStatsSelectionTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        playerStatsSelectionTableView.delegate = self
        playerStatsSelectionTableView.dataSource = self
    }
    
    //local player list passed from main viewcontroller
    var playerStatsList: [Player] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerStatsList.count
    }
    
    //text for cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indexItem = playerStatsList[indexPath.row]
        let playertext = indexItem.username
        let cell = tableView.dequeueReusableCell(withIdentifier: "statselect" )!
        cell.textLabel?.text = playertext
        return cell
    }
    
    //cell sizing
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50)
    }
    
    //player selected, pass info in prepare()
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "DisplayPlayerStats", sender: self)
    }
    
    //passing player in so DisplayStats can show handle and show appropiate data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DisplayStatsViewController{
            if let temp: Int = playerStatsSelectionTableView.indexPathForSelectedRow?.row {
                let PlayerSelected: Player = playerStatsList[temp]
                destination.localPlayer = PlayerSelected
                
            }
            
        }
    }
}
