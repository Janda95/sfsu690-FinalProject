//
//  UserCreationViewController.swift
//  TrapShootingApp
//
//  Created by Jarek Rettinghouse on 12/1/18.
//  Copyright © 2018 JLR. All rights reserved.
//

import UIKit

class UserCreationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var fullnameTextField: UITextField!
    
    
    
    @IBAction func addNewUserButton(_ sender: Any) {
        guard let username = usernameTextField.text,
        let fullname = fullnameTextField.text else {
            //do nothing
            return
        }
        
        if username == "" || fullname == ""{
            //maybe an error message
            return
        }
        
        //add user to player list in main and segue
    }
    
    //Perform segue back to main screen saving information
}
