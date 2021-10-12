//
//  RegisterViewController.swift
//  Cohere
//
//  Created by Chiu Wing Cheung on 03/10/2021.
//

import UIKit
import Firebase

class RegisterAccountViewController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var forenameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let forename = forenameTextField.text, let surname = surnameTextField.text, let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    self.errorMessage.isHidden = false
                    self.errorMessage.text = e.localizedDescription
                    print(e.localizedDescription)
                } else {
                    //Navigate to user landing page
                    self.errorMessage.isHidden = true
                    print("account register successful")
                    
                    let newUser = UserProfile(context: self.context)
                    
                    newUser.forename = forename
                    newUser.surname = surname
                    newUser.emailAddress = email
                    self.saveUserProfile()
                    
                    self.performSegue(withIdentifier: "RegisterSuccessfulSegue", sender: self)
                    
                }
            }
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: Model Manipulation Methods
    
    func saveUserProfile() {
        do {
            try context.save()
        } catch {
            print("Error decoding array. \(error)")
        }
        
    }
}


