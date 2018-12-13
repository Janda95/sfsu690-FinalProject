//
//  MainPageViewController.swift
//  TrapShootingApp
//
//  Created by Jarek Rettinghouse on 12/1/18.
//  Copyright © 2018 JLR. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //main array of Player information
    var playerList: [Player] = [Player("Jarek","JLR")]
    
    
    //segue button to player selection for new game
    @IBAction func NewGameButton(_ sender: Any) {
        performSegue(withIdentifier: "NewGame", sender: self)
    }
    
    //segue button to form for new user
    @IBAction func NewUserButton(_ sender: Any) {
        performSegue(withIdentifier: "NewUser", sender: self)
    }
    
    //segue button to view a game already created
    @IBAction func ExistingGameButton(_ sender: Any) {
        performSegue(withIdentifier: "ExistingGame", sender: self)
    }
    
    //segue button to tableview for deletion of users
    @IBAction func DeleteUserButton(_ sender: Any) {
        performSegue(withIdentifier: "DeleteUser", sender: self)
    }
    
    //segue button to player selection before viewing stats
    @IBAction func UserStatsButton(_ sender: Any) {
        performSegue(withIdentifier: "UserStats", sender: self)
    }
    
    //NOTE: unwind is special segue using exit function to adhere to Navigation Controller schema
    //handle information for new Game() for player X
    @IBAction func unwindToSaveNewGame(_ sender: UIStoryboardSegue){}
    
    //compares and saves deleted users with main array
    @IBAction func unwindToDeleteUsers(_ sender: UIStoryboardSegue){}
    
    //appends new user to player array from newUser form
    @IBAction func unwindToSaveNewUser(_ sender: UIStoryboardSegue){}
    
    
    //prepares segue using switch string for segue String identifier
    //passes information the next view controller needs
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "NewUser":
            //if let destination1 = segue.destination as? UserCreationViewController {}
            //nothing needed to pass
            break
            
        case "DeleteUser":
            if let destination2 = segue.destination as? UserDeletionViewController{
                destination2.deletionPlayerList = playerList
            }
            break
            
        case "UserStats":
            if let destination3 = segue.destination as?  PlayerStatsSelectionViewController{
                destination3.playerStatsList = playerList
            }
            break
            
        case "ExistingGame":
            if let destination4 = segue.destination as? GameListViewController {
                destination4.gameListPlayerList = playerList
            }
            break
            
        case "NewGame":
            if let destination5 = segue.destination as? PlayerSelectionViewController {
                destination5.playerSelectionList = playerList
            }
            break
            
        default:
            break
        }
    }
    
    //Layout Constraints
    
}
