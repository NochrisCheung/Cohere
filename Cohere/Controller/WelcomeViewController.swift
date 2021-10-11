//
//  WelcomeViewController.swift
//  Cohere
//
//  Created by Chiu Wing Cheung on 04/10/2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBAction func registerPressed(_ sender: UIButton) {
        print("Clicked Register")
        self.performSegue(withIdentifier: "RegisterAccountSegue", sender: self)
    }
    
    @IBAction func loginPreseed(_ sender: UIButton) {
        print("Clicked Login")
        self.performSegue(withIdentifier: "LoginAccountSegue", sender: self)
     
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

