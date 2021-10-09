//
//  AddNewEventViewController.swift
//  Cohere
//
//  Created by Chiu Wing Cheung on 07/10/2021.
//

import UIKit

class AddNewEventViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(NewEventNameCell.self, forCellReuseIdentifier: Constants.newEventNameCellIdentifier)
        tableView.register(DayPickerCell.self, forCellReuseIdentifier: Constants.dayPickerCellIdentifier)
        tableView.register(NewEventAddressCell.self, forCellReuseIdentifier: Constants.newEventAddressCellIdentifier)
        tableView.register(SubmitButtonCell.self, forCellReuseIdentifier: Constants.submitButtonCellIdentifier)
    }
}

// MARK: Create addNewEvent table cells programmatically
extension AddNewEventViewController: UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //hard code 2 row for now: profile and logout
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        switch indexPath.row {
        case 0:
            //New event name as first row
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.newEventNameCellIdentifier, for: indexPath) as! NewEventNameCell
            return cell
            //Day picker as second row
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.dayPickerCellIdentifier, for: indexPath) as! DayPickerCell
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.newEventAddressCellIdentifier, for: indexPath) as! NewEventAddressCell
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.submitButtonCellIdentifier, for: indexPath) as! SubmitButtonCell
            return cell
        default:
            let cell = UITableViewCell()
            return cell
        }
    }

}

