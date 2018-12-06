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
    
    
    @IBAction func NewGameButton(_ sender: Any) {
        performSegue(withIdentifier: "NewGame", sender: self)
    }
    
    @IBAction func NewUserButton(_ sender: Any) {
        performSegue(withIdentifier: "NewUser", sender: self)
    }
    
    @IBAction func ExistingGameButton(_ sender: Any) {
        performSegue(withIdentifier: "ExistingGame", sender: self)
    }
    
    @IBAction func DeleteUserButton(_ sender: Any) {
        performSegue(withIdentifier: "DeleteUser", sender: self)
    }
    
    @IBAction func UserStatsButton(_ sender: Any) {
        performSegue(withIdentifier: "UserStats", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "NewUser":
            if let destination1 = segue.destination as? UserCreationViewController {
                
            }
            break
        case "DeleteUser":
            if let destination2 = segue.destination as? UserDeletionViewController{
                
            }
            break
        case "UserStats":
            if let destination3 = segue.destination as?  PlayerStatsSelectionViewController{
                
            }
            break
        case "ExistingGame":
            if let destination4 = segue.destination as? GameListViewController {
                
            }
            break
        case "NewGame":
            if let destination5 = segue.destination as? PlayerSelectionViewController {
                
            }
            break
        default:
            break
            
        }
    }
}
