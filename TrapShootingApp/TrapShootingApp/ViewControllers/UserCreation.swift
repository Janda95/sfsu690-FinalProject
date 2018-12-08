//
//  UserCreationViewController.swift
//  TrapShootingApp
//
//  Created by Jarek Rettinghouse on 12/1/18.
//  Copyright © 2018 JLR. All rights reserved.
//

import UIKit

class UserCreationViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        errorTextField.text = ""
        usernameTextField.delegate = self
        fullnameTextField.delegate = self
    }
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var fullnameTextField: UITextField!
    
    @IBOutlet weak var errorTextField: UILabel!
    
    
    @IBAction func createUserButton(_ sender: Any) {
        guard let username = usernameTextField.text,
            let fullname = fullnameTextField.text else {
                print("Textfield error!")
                return
        }
        
        if username == ""{
            errorTextField.text = "Please enter Username"
            return
        } else if fullname == "" {
            errorTextField.text = "Please enter Fullname"
            return
        } else {
            performSegue(withIdentifier: "unwindUserCreation", sender: self)
        }
    }
    
    //textfield return will exit edit mode
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        fullnameTextField.resignFirstResponder()
        usernameTextField.resignFirstResponder()
        return true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MainPageViewController, let user = usernameTextField.text, let full = fullnameTextField.text {
            destination.playerList.append(Player(full, user))
        }
    }
    
}
