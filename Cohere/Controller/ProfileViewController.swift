//
//  ProfileViewController.swift
//  Cohere
//
//  Created by Chiu Wing Cheung on 05/10/2021.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.profileCellNibName, bundle: nil), forCellReuseIdentifier: K.profileCellIdentifer)
//        tableView.delegate = self
    }
}

// MARK: Create profile table cells programmatically
extension ProfileViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //hard code 2 row for now: profile and logout
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: K.profileCellIdentifer, for: indexPath) as! ProfileCell
        
        if indexPath.row != self.tableView.numberOfSections{
            cell.cellButton?.setTitle("Personal Profile", for: .normal)
            cell.cellButton?.contentHorizontalAlignment = .left
        }else {
            //Make the last cell the log out button
            cell.cellButton?.setTitle(K.Button.LogOutButton.title, for: .normal)
        }
        
        cell.selectionDelegate = self
        return cell
    }

}

extension ProfileViewController: ProfileCellSelectionDelegate {
    
    func popToRootView() {
        
        do {
            try Auth.auth().signOut()
            print("Pressed Log Out And Trying Pop To Root View Controller")
            self.tabBarController!.navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: $@", signOutError)
        }
        
    }
    
}
