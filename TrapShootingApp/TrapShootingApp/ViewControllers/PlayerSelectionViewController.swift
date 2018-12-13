//
//  PlayerSelectionViewController.swift
//  TrapShootingApp
//
//  Created by Jarek Rettinghouse on 12/1/18.
//  Copyright © 2018 JLR. All rights reserved.
//

import UIKit

class PlayerSelectionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //outlet for tableview inside our PlayerSelectionViewController
    @IBOutlet weak var playerSelectionTableView: UITableView!
    
    
    //loading and setting delegates
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        playerSelectionTableView.delegate = self
        playerSelectionTableView.dataSource = self
    }
    
    //local array copyed from main
    var playerSelectionList: [Player] = []
    
    //creating cell row count for index later
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerSelectionList.count
    }
    
    //text for cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indexItem = playerSelectionList[indexPath.row]
        let playertext = indexItem.username
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerselect" )!
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 2
        cell.layer.borderWidth = 1
        cell.textLabel?.text = playertext
        return cell
    }
    
    //cell sizing
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50)
    }
    
    //player selected, pass info in prepare()
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "CurrentGame", sender: self)
    }
    
    //passing information for new game save later
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CurrentGameViewController {
            //index for saving game to player at position x in main player array
            if let temp: Int = playerSelectionTableView.indexPathForSelectedRow?.row {
                destination.playerid = temp
            }
            
        }
    }
    
    //Layout Constraints
    
    
}
