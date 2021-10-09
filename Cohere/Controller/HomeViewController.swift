//
//  HomeViewController.swift
//  Cohere
//
//  Created by Chiu Wing Cheung on 04/10/2021.
//

import UIKit


class HomeViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Load Home")
        
        // Hide back button after login page.
        tabBarController!.navigationItem.hidesBackButton = true
        
        let addFriendIconImage = UIImage(systemName: "plus.circle")
        tabBarController!.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: addFriendIconImage,
            style: .plain,
            target: self,
            action: #selector(addNewEventPressed)
        )
    }

    @objc func addNewEventPressed() {
        self.performSegue(withIdentifier: "AddNewEventSegue", sender: self)
    }
 
}
