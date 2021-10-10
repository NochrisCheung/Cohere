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
        return 5
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
            cell.dayPickerTextLabel.text = "Start Date"
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.dayPickerCellIdentifier, for: indexPath) as! DayPickerCell
            cell.dayPickerTextLabel.text = "End Date"
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.newEventAddressCellIdentifier, for: indexPath) as! NewEventAddressCell
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.submitButtonCellIdentifier, for: indexPath) as! SubmitButtonCell
            cell.delegate = self
            return cell
        default:
            let cell = UITableViewCell()
            return cell
        }
    }

}

// MARK: SubmitButtonDelegate

extension AddNewEventViewController: SubmitButtonCellDelegate{
    
    func submitData(_ sender: SubmitButtonCell){
        
        let cells = self.tableView.visibleCells
//        var newEvent = EventRecord(eventName: nil, eventStartTime: nil, eventEndTime: nil, eventAddress: nil)
        var newEvent = EventRecord()
        
        for cell in cells {
            let identifier = cell.reuseIdentifier
            
            switch identifier {
            case Constants.newEventNameCellIdentifier:
                let thisCell = cell as! NewEventNameCell
                newEvent.eventName = thisCell.eventTextField.text
                print(newEvent.eventName!)
            case Constants.dayPickerCellIdentifier:
                let thisCell = cell as! DayPickerCell
                if thisCell.dayPickerTextLabel.text == "Start Date" {
                    newEvent.eventStartTime = thisCell.selectedDateTime
                } else {
                    newEvent.eventEndTime = thisCell.selectedDateTime
                }
                if thisCell.selectedDateTime != nil {
                    print(DateFormatter().string(from: thisCell.selectedDateTime!))
                }
            case Constants.newEventAddressCellIdentifier:
                let thisCell = cell as! NewEventAddressCell
                newEvent.eventAddress = thisCell.eventTextField.text
                print(newEvent.eventAddress!)
            default:
                print("nothing")
            }
        }
        
        self.dismiss(animated: true, completion: nil)
    }
}

