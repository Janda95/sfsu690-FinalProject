//
//  PlayerSelectionViewController.swift
//  TrapShootingApp
//
//  Created by Jarek Rettinghouse on 12/1/18.
//  Copyright © 2018 JLR. All rights reserved.
//

import UIKit

class PlayerSelectionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var playerSelectionTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        playerSelectionTableView.delegate = self
        playerSelectionTableView.dataSource = self
    }
    
    var playerSelectionList: [Player] = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerSelectionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indexItem = playerSelectionList[indexPath.row]
        let playertext = indexItem.username
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerselect" )!
        cell.textLabel?.text = playertext
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "CurrentGame", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CurrentGameViewController {
            
        }
    }
    
    
    /*
    override func performSegue(withIdentifier identifier: "CurrentGame", sender: Any?) {
        <#code#>
    }
     */
}
