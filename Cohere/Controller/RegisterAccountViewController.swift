//
//  RegisterViewController.swift
//  Cohere
//
//  Created by Chiu Wing Cheung on 03/10/2021.
//

import UIKit
import Firebase

class RegisterAccountViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    self.errorMessage.isHidden = false
                    self.errorMessage.text = e.localizedDescription
                    print(e.localizedDescription)
                } else {
                    //Navigate to user landing page
                    self.errorMessage.isHidden = true
                    print("account register successful")
                    self.performSegue(withIdentifier: "RegisterSuccessfulSegue", sender: self)
                    
                }
            }
            
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

