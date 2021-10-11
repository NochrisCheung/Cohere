//
//  ProfileViewController.swift
//  Cohere
//
//  Created by Chiu Wing Cheung on 05/10/2021.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide back button after login page.
        tabBarController!.navigationItem.hidesBackButton = true
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ProfileCell.self, forCellReuseIdentifier: Constants.profileCellIdentifier)
        tableView.register(LogOutCell.self, forCellReuseIdentifier: Constants.logOutCellIdentifier)

    }
    
    func logOut() {
        
        do {
            try Auth.auth().signOut()
            print("Pressed Log Out And Trying Pop To Root View Controller")
            self.tabBarController!.navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: $@", signOutError)
        }
    }
}

// MARK: Create profile table cells programmatically
extension ProfileViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //hard code 2 row for now: profile and logout
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        if indexPath.row < self.tableView.numberOfSections{
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.profileCellIdentifier, for: indexPath) as! ProfileCell

            //hard code as placeholder for account information
//            cell.profileCellLabel.text = "Personal Profile"
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.logOutCellIdentifier, for: indexPath) as! LogOutCell
            //Make the last cell the log out button
            cell.logOutCellLabel.text = Constants.Button.LogOutButton.title
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        
        //  Pop to root view if log out button is clicked
        if (cell as? LogOutCell) != nil {
            self.logOut()
        }
        
    }

}

