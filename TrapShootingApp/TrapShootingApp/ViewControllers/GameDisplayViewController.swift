//
//  GameDisplayViewController.swift
//  TrapShootingApp
//
//  Created by Jarek Rettinghouse on 12/1/18.
//  Copyright © 2018 JLR. All rights reserved.
//

import UIKit

class GameDisplayViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameTableView.delegate = self
        gameTableView.dataSource = self
    }
    
    //player placeholder
    var playerPlaceholder: Player!
    @IBOutlet weak var gameTableView: UITableView!
    
    
    //creating cell row count for index later
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerPlaceholder.Games.count
    }
    
    //text for cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indexItem = playerPlaceholder.Games[indexPath.row]
        let gametext = indexItem.gamename
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell")!
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 2
        cell.layer.borderWidth = 1
        cell.textLabel?.text = gametext
        return cell
    }
    
    //cell sizing
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50)
    }
    
    //player selected, pass info in prepare()
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "displayExistingGame", sender: self)
    }
    
    //prepare segue by passing related player
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? GameDataViewController {
            if let temp: Int = gameTableView.indexPathForSelectedRow?.row {
                destination.gamePlaceholder = playerPlaceholder.Games[temp]
                destination.playername = playerPlaceholder.fullname
            }
        }
    }
}
