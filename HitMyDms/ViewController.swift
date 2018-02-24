//
//  ViewController.swift
//  HitMyDms
//
//  Created by Kymberlee Hill on 2/24/18.
//  Copyright © 2018 Kymberlee Hill. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signInDidTap(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: usernameTextField.text!, password: passwordTextField.text!) { (user:PFUser?, error) in
            if user != nil {
                print("you logged in")
                self.performSegue(withIdentifier: "logInSegue", sender: nil)
            } else if let error = error {
                let errorMessage = error.localizedDescription
                print(errorMessage)
                
                
                if self.usernameTextField.text == "" {
                    let alertController = UIAlertController(title: "Email required", message: errorMessage as String!, preferredStyle: .alert)
                    
                    let alertAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        // handle response here.
                    }
                    // add the OK action to the alert controller
                    alertController.addAction(alertAction)
                    
                    self.present(alertController, animated: true) {
                        // optional code for what happens after the alert controller has finished presenting
                    }
                }
                else if self.passwordTextField.text == "" {
                    
                    let alertController = UIAlertController(title: "Password required", message: errorMessage as String!, preferredStyle: .alert)
                    
                    let alertAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        // handle response here.
                    }
                    // add the OK action to the alert controller
                    alertController.addAction(alertAction)
                    
                    self.present(alertController, animated: true) {
                        // optional code for what happens after the alert controller has finished presenting
                    }
                    
                }
                
            }
        }
    }
    
    @IBAction func loginDidTap(_ sender: Any) {
        let newUser = PFUser()
        
        // set user properties
        newUser.username = usernameTextField.text
        newUser.password = passwordTextField.text
        
        // call sign up function on the object
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                let errorMessage = error.localizedDescription
                print(errorMessage)
                
                
                if self.usernameTextField.text == "" {
                    let alertController = UIAlertController(title: "Email required", message: errorMessage as String!, preferredStyle: .alert)
                    
                    let alertAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        // handle response here.
                    }
                    // add the OK action to the alert controller
                    alertController.addAction(alertAction)
                    
                    self.present(alertController, animated: true) {
                        // optional code for what happens after the alert controller has finished presenting
                    }
                }
                else if self.passwordTextField.text == "" {
                    
                    let alertController = UIAlertController(title: "Password required", message: errorMessage as String!, preferredStyle: .alert)
                    
                    let alertAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        // handle response here.
                    }
                    // add the OK action to the alert controller
                    alertController.addAction(alertAction)
                    
                    self.present(alertController, animated: true) {
                        // optional code for what happens after the alert controller has finished presenting
                    }
                    
                }
                
            } else {
                print("User Registered successfully")
                self.performSegue(withIdentifier: "logInSegue", sender: nil)
                // manually segue to logged in view
            }
        }
    }
}
