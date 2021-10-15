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
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let firstName = firstNameTextField.text, let lastName = lastNameTextField.text, let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    self.errorMessage.isHidden = false
                    self.errorMessage.text = e.localizedDescription
                    print(e.localizedDescription)
                } else {
                    //Navigate to user landing page
                    self.errorMessage.isHidden = true
                    
                    
                    Constants.firebaseDB.collection("user").addDocument(data: ["firstname": firstName, "lastname": lastName, "uid": authResult!.user.uid ]) { (error) in
                        if error != nil {
                            print("User information saving error with reason:  \(String(describing: error))")
                        }
                    }

                    let newUser = Me(context: self.context)
                    
                    newUser.uid = authResult!.user.uid
                    newUser.firstName = firstName
                    newUser.lastName = lastName
                    newUser.emailAddress = email
                    self.saveMyProfile()
                    
                    print("account register successful")
                    self.performSegue(withIdentifier: "RegisterSuccessfulSegue", sender: self)
                    
                }
            }
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Load Registration View")
    }

    //MARK: Model Manipulation Methods
    
    func saveMyProfile() {
        do {
            try context.save()
        } catch {
            print("Error decoding array. \(error)")
        }
        
    }
}


