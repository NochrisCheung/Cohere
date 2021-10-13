//
//  FriendsViewController.swift
//  Cohere
//
//  Created by Chiu Wing Cheung on 13/10/2021.
//

import UIKit
import CoreData
import SwipeCellKit

class FriendsViewController: UIViewController, UITableViewDelegate{
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var friendArray = [Friend]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Load Friends View")
        
        // Hide back button after login page.
        tabBarController!.navigationItem.hidesBackButton = true
        
        tabBarController!.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: Constants.Button.AddFriendButton.addFriendIconImage,
            style: .plain,
            target: self,
            action: #selector(addNewFriendPressed)
        )
        
//        loadEvent()
//        print("Counting friends \(eventArray.count)")
//        if friendArray.count > 0 {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(FriendCell.self, forCellReuseIdentifier: Constants.friendCellIdentifier)
        }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Friend viewDidAppear")
        tabBarController!.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: Constants.Button.AddFriendButton.addFriendIconImage,
            style: .plain,
            target: self,
            action: #selector(addNewFriendPressed)
        )
    }
//
    @objc func addNewFriendPressed() {
//        self.performSegue(withIdentifier: "AddNewEventSegue", sender: self)
    }
}
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "AddNewEventSegue" {
//            (segue.destination as! AddNewEventViewController).delegate  = self
//        }
//    }
//    
//    func saveEvent() {
//        do{
//            try context.save()
//        } catch {
//            print("Error saving context \(error)")
//        }
//        tableView.reloadData()
//    }
//    
//    
//    func loadEvent(with request: NSFetchRequest<Event> = Event.fetchRequest()) {
//        do {
//            eventArray = try context.fetch(request)
//        } catch {
//            print("Error decoding array. \(error)")
//        }
////        tableView.reloadData()
//    }
//    
//    func deleteEvent(indexPath: IndexPath) {
//        
//        context.delete(eventArray[indexPath.row])
//        eventArray.remove(at: indexPath.row)
//        saveEvent()
////        tableView.reloadData()
//        print("Event Deleted")
//    }
//}

// MARK: Table View Methods
extension FriendsViewController: UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //hard code 2 row for now: profile and logout
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.friendCellIdentifier, for: indexPath) as! FriendCell
//        let friend = userProfile[indexPath.row]

//            cell.friendNameLabel.text = "\(profile.forename!) \(profile.surname!)"
//            cell.profileEmailLabel.text = "\(profile.emailAddress!)"
        //hard code as placeholder for account information
//            cell.profileCellLabel.text = "Personal Profile"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

//        let cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)

    }
}
