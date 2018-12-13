//
//  GameListViewController.swift
//  TrapShootingApp
//
//  Created by Jarek Rettinghouse on 12/1/18.
//  Copyright © 2018 JLR. All rights reserved.
//

import UIKit

class GameListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //setting tableview delegates
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //local playerlist
    var gameListPlayerList: [Player] = []
    
    @IBOutlet weak var tableView: UITableView!

    
    //creating cell row count for index later
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameListPlayerList.count
    }
    
    //text for cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indexItem = gameListPlayerList[indexPath.row]
        let playertext = indexItem.username
        let cell = tableView.dequeueReusableCell(withIdentifier: "gamedataPlayerCell" )!
        cell.textLabel?.text = playertext
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 2
        cell.layer.borderWidth = 1
        return cell
    }
    
    //cell sizing
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50)
    }
    
    //player selected, pass info in prepare()
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ViewGameInfo", sender: self)
    }
    
    //prepare segue by passing related player
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? GameDisplayViewController {
            if let temp: Int = tableView.indexPathForSelectedRow?.row {
                destination.playerPlaceholder = gameListPlayerList[temp]
            }
        }
    }
}
