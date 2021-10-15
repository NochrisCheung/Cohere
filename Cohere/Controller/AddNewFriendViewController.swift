//
//  AddNewFriendViewController.swift
//  Cohere
//
//  Created by Chiu Wing Cheung on 13/10/2021.
//

import UIKit
import CoreData
import Firebase

protocol AddNewFriendViewControllerDelegate {
    func popOverDismissed()
//    func checkIsFriend()
}

class AddNewFriendViewController: UIViewController, UITableViewDelegate {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private var userArray = [Users]()
    private var databaseUserArray: [[String: Any]] = []
    private var searchedText: String?
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        

    }
    
    func getMatchedUserDatafromFireBase(completion: @escaping () -> Void) {
        Constants.firebaseDB.collection("user").whereField("firstname", isEqualTo: searchedText!)
            .getDocuments { (querySnapshot, err) in
                let dispatchTime = DispatchTime.now() + 2
                DispatchQueue.global(qos: .background).asyncAfter(deadline: dispatchTime) {
                    if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        for document in querySnapshot!.documents {
                            print("\(document.documentID) => \(document.data())")
                            self.databaseUserArray.append(document.data())
                        }
                    }
                    DispatchQueue.main.async {
                        completion()
                    }
                }
        }
    }
    
    //MARK: Core Data Manipulation Method
    
    func saveEvent() {

        do {
            try context.save()
        } catch {
            print("Error decoding array. \(error)")
        }

    }

    func loadUser(with request: NSFetchRequest<Users> = Users.fetchRequest()) {
        do {
            userArray = try context.fetch(request)
        } catch {
            print("Error decoding array. \(error)")
        }
    }
}

//MARK: Search Bar Delegate Methods
extension AddNewFriendViewController: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchedText = searchBar.text
        
        getMatchedUserDatafromFireBase() {
            print("Data:\(self.databaseUserArray)")
            self.loadUser()
        
            if self.databaseUserArray.count > 0 {
                self.tableView.dataSource = self
                self.tableView.delegate = self
                self.tableView.register(UserCell.self, forCellReuseIdentifier: Constants.userCellIdentifier)
            }

            self.tableView.reloadData()
        }
    }
}
//    func passSubmitCriteria(newEvent: EventRecord) -> Bool {
//
//        print(String(describing: newEvent.name))
//        print(String(describing: newEvent.startTime))
//        print(String(describing: newEvent.endTime))
//        print(String(describing: newEvent.address))
//
//        if newEvent.name == "" || newEvent.startTime == nil || newEvent.endTime == nil || newEvent.address == "" {
//            //need to display this error message
//            print("Please fill in all the essential event information")
//            return false
//        } else if newEvent.startTime! >= newEvent.endTime! {
//            //need to eventually move to auto-prevent
//            print("Please make sure end time is set after start time")
//            return false
//        } else {
//            return true
//        }
//    }
//
//}
//
//// MARK: Table View Methods
extension AddNewFriendViewController: UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //hard code 2 row for now: profile and logout
        return databaseUserArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.userCellIdentifier, for: indexPath) as! UserCell

        if indexPath.row <= databaseUserArray.count {
//            let account = userArray[indexPath.row]
            let userData = databaseUserArray[indexPath.row]
            print("Name: \(userData["firstname"]!) \(userData["lastname"]!)")
            cell.userNameLabel.text = "\(userData["firstname"]!) \(userData["lastname"]!)"
////            cell.profileEmailLabel.text = "\(profile.emailAddress!)"
            return cell
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

//        let cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)

    }
}

//



//
//// MARK: Submit Button Delegate
//
//extension AddNewEventViewController: SubmitButtonCellDelegate{
//    //need to change to some more dynamic interface
//    func submitData(){
//
//        var newEventRecord = EventRecord()
//        let cells = self.tableView.visibleCells
//
//        for cell in cells {
//            let identifier = cell.reuseIdentifier
//
//            switch identifier {
//            case Constants.newEventNameCellIdentifier:
//                let thisCell = cell as! NewEventNameCell
//                //need to show error message if no text
//                newEventRecord.name = thisCell.eventTextField.text
//                print("event name: \(String(describing: newEventRecord.name))")
//            case Constants.dayPickerCellIdentifier:
//                let thisCell = cell as! DayPickerCell
//                if thisCell.dayPickerTextLabel.text == "Start Date" {
//                    newEventRecord.startTime = thisCell.selectedDateTime
//                    print("start time: \(String(describing: newEventRecord.startTime))")
//                } else {
//                    newEventRecord.endTime = thisCell.selectedDateTime
//                    print("end time: \(String(describing: newEventRecord.endTime))")
//                }
//            case Constants.newEventAddressCellIdentifier:
//                let thisCell = cell as! NewEventAddressCell
//                //need to show error message if no text
//                newEventRecord.address = thisCell.eventTextField.text
//                print("event Address: \(String(describing: newEventRecord.address))")
//            default:
//                print("nothing")
//            }
//        }
//
//        if self.passSubmitCriteria(newEvent: newEventRecord) {
//
//            let newEventData = Event(context: self.context)
//            newEventData.name = newEventRecord.name
//            newEventData.startTime = newEventRecord.startTime
//            newEventData.endTime = newEventRecord.endTime
//            newEventData.address = newEventRecord.address
//
//            self.saveEvent()
//            delegate?.popOverDismissed()
//            self.dismiss(animated: true, completion: nil)
//        }
//    }
//}

