//
//  LoginAccountViewController.swift
//  Cohere
//
//  Created by Chiu Wing Cheung on 04/10/2021.
//

import UIKit
import Firebase


class LogInAccountViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessage: UILabel!

    
    @IBAction func LogInPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
                if let e = error {
                    self.errorMessage.isHidden = false
                    self.errorMessage.text = e.localizedDescription
                    print(e.localizedDescription)
                } else {
                    self.errorMessage.isHidden = true
                    print("Log in successful")
                    //need to make sure user profile extraction are the same locally and non-locally
                    UserDefaults.standard.set(email, forKey: Constants.DefaultsKey.emailAddressKey)
                    self.performSegue(withIdentifier: "LogInSuccessfulSegue", sender: self)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


