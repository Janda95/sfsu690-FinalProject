//
//  GameDisplayViewController.swift
//  TrapShootingApp
//
//  Created by Jarek Rettinghouse on 12/1/18.
//  Copyright © 2018 JLR. All rights reserved.
//

import UIKit

class GameDisplayViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination1 = segue.destination as? GameDataViewController {
            
        }
    }
    
    //performSegue(withIdentifier: "displayExistingGame", sender: self)
    
    
}
