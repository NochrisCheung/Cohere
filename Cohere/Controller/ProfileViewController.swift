//
//  ProfileViewController.swift
//  Cohere
//
//  Created by Chiu Wing Cheung on 05/10/2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
}

//extension ProfileViewController: UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        //hard code 2 row for now: profile and logout
//        return 2   <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//
//
//
//}
