//
//  ViewController.swift
//  UserDefault Studies
//
//  Created by Burak Yılmaz on 3.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    let def = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let user = def.string(forKey: "username") ?? "empty"
        let userpass = def.string(forKey: "password") ?? "empyt"
        
        if user != "empty" && userpass != "empty" {
            performSegue(withIdentifier: "toSecondVC", sender: nil)
        }
        
        
    }


    @IBAction func loginClicked(_ sender: Any) {
        
        if let user = usernameTextField.text, let userpass = passwordTextField.text {
            
            if user == "admin" && userpass == "123456" {
                
                def.set(user, forKey: "username")
                def.set(userpass, forKey: "password")
                
                performSegue(withIdentifier: "toSecondVC", sender: nil)
                
            } else {
                
                let alert = UIAlertController(title: "Error", message: "Username/Password", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default)
                alert.addAction(ok)
                present(alert, animated: true)
                
            }
            
        }
        
        
    }
}

