//
//  UserDeletionViewController.swift
//  TrapShootingApp
//
//  Created by Jarek Rettinghouse on 12/1/18.
//  Copyright © 2018 JLR. All rights reserved.
//

import UIKit

class UserDeletionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var deletionPlayerTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        deletionPlayerTableView.delegate = self
        deletionPlayerTableView.dataSource = self
    }
    
    var deletionPlayerList: [Player] = []
    
    //creating cell row count for index later
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deletionPlayerList.count
    }
    
    //text for cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indexItem = deletionPlayerList[indexPath.row]
        let playertext = indexItem.username
        let cell = tableView.dequeueReusableCell(withIdentifier: "deleteUserSelection" )!
        cell.textLabel?.text = playertext
        return cell
    }
    
    //cell sizing
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50)
    }
    
    //testing material
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //delete cell, also default action if swipe is fully completed
        let delete = UITableViewRowAction(style: .normal, title: "Delete") { action, index in
            print("Delete button tapped")
            //delete item
            self.deletionPlayerList.remove(at: indexPath.row)
            self.deletionPlayerTableView.deleteRows(at: [indexPath], with: .automatic)
        }
        delete.backgroundColor = .red
        
        return [delete]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let unwindDestination = segue.destination as? MainPageViewController {
            if unwindDestination.playerList.count != deletionPlayerList.count {
                unwindDestination.playerList = deletionPlayerList
            }
        }
    }
    
}
