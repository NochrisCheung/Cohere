//
//  AddNewEventViewController.swift
//  Cohere
//
//  Created by Chiu Wing Cheung on 07/10/2021.
//

import UIKit

protocol AddNewEventViewControllerDelegate {
    func popOverDismissed()
}

class AddNewEventViewController: UIViewController, UITableViewDelegate {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var delegate : AddNewEventViewControllerDelegate?
    
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
    
    func saveEvent() {
     
        do {
            try context.save()
        } catch {
            print("Error decoding array. \(error)")
        }
        
    }
    
    func passSubmitCriteria(newEvent: EventRecord) -> Bool {
        
        print(newEvent.name)
        print(newEvent.startTime)
        print(newEvent.endTime)
        print(newEvent.address)
        
        if newEvent.name == "" || newEvent.startTime == nil || newEvent.endTime == nil || newEvent.address == "" {
            //need to display this error message
            print("Please fill in all the essential event information")
            return false
        } else if newEvent.startTime! >= newEvent.endTime! {
            //need to eventually move to auto-prevent
            print("Please make sure end time is set after start time")
            return false
        } else {
            return true
        }
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
    //need to change to some more dynamic interface
    //_ sender: SubmitButtonCel
    func submitData(){
        
        var newEventRecord = EventRecord()
        let cells = self.tableView.visibleCells
        
        for cell in cells {
            let identifier = cell.reuseIdentifier
            
            switch identifier {
            case Constants.newEventNameCellIdentifier:
                let thisCell = cell as! NewEventNameCell
                //need to show error message if no text
                newEventRecord.name = thisCell.eventTextField.text
                print("event name: \(String(describing: newEventRecord.name))")
            case Constants.dayPickerCellIdentifier:
                let thisCell = cell as! DayPickerCell
                if thisCell.dayPickerTextLabel.text == "Start Date" {
                    newEventRecord.startTime = thisCell.selectedDateTime
                    print("start time: \(String(describing: newEventRecord.startTime))")
                } else {
                    newEventRecord.endTime = thisCell.selectedDateTime
                    print("end time: \(String(describing: newEventRecord.endTime))")
                }
            case Constants.newEventAddressCellIdentifier:
                let thisCell = cell as! NewEventAddressCell
                //need to show error message if no text
                newEventRecord.address = thisCell.eventTextField.text
                print("event Address: \(String(describing: newEventRecord.address))")
            default:
                print("nothing")
            }
        }
        
        if self.passSubmitCriteria(newEvent: newEventRecord) {
        
            let newEventData = Event(context: self.context)
            newEventData.name = newEventRecord.name
            newEventData.startTime = newEventRecord.startTime
            newEventData.endTime = newEventRecord.endTime
            newEventData.address = newEventRecord.address
            
            self.saveEvent()
            delegate?.popOverDismissed()
            self.dismiss(animated: true, completion: nil)
            
        }
    }
}

