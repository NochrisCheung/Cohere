//
//  HomeViewController.swift
//  Cohere
//
//  Created by Chiu Wing Cheung on 04/10/2021.
//

import UIKit


class HomeViewController: UIViewController {
    
//    @IBAction func addFriendClicked(_ sender: UIBarButtonItem) {
//        self.performSegue(withIdentifier: "AddFriendSegue", sender: self)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Load Home")
        
        // Hide back button after login page. need to unwrap optional tabBarController class
        tabBarController!.navigationItem.hidesBackButton = true
//        self.navigationItem.leftBarButtonItem = nil
//        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    
//        let addFriendIconImage = UIImage(systemName: "plus.circle")
//        navigationItem.rightBarButtonItem = UIBarButtonItem(
//            image: addFriendIconImage,
//            style: .plain,
//            target: self,
//            action: nil
////                #selector(addFriendPressed)
//        )
    }
//
//    @objc func addFriendPressed() {
//        let vc = UIViewController()
//        navigationController?.pushViewController(vc, animated: true)
//    }
 
    
}
