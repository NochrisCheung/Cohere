//
//  HomeViewController.swift
//  Cohere
//
//  Created by Chiu Wing Cheung on 04/10/2021.
//

import UIKit


class HomeViewController: UIViewController, UITableViewDelegate  {
    
    let conext = Constants.context
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Load Home")
        
        // Hide back button after login page.
        tabBarController!.navigationItem.hidesBackButton = true
        
        tabBarController!.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: Constants.Button.AddEventButton.addEventIconImage,
            style: .plain,
            target: self,
            action: #selector(addNewEventPressed)
        )
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(EventCell.self, forCellReuseIdentifier: Constants.eventCellIdentifier)

    }

    @objc func addNewEventPressed() {
        self.performSegue(withIdentifier: "AddNewEventSegue", sender: self)
    }
 
}

// MARK: Create event table cells programmatically
extension HomeViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //hard code 1 row for now: profile and logout
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.eventCellIdentifier, for: indexPath) as! EventCell

        cell.eventNameTextLabel.text = DummyEventRecord.eventName
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "dd MMM yy HH:mm"
        cell.eventStartTimeTextLabel.text = timeFormatter.string(from: DummyEventRecord.eventStartTime!)
        
        for subview in cell.eventAddressView.subviews {
            if let labelView = subview as? UILabel {
                labelView.text = DummyEventRecord.eventAddress!
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        //Open Event Detail View when clicked
        performSegue(withIdentifier: "GetEventDetailSegue", sender: self)
        
    }

}
