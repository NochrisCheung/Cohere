//
//  HomeViewController.swift
//  Cohere
//
//  Created by Chiu Wing Cheung on 04/10/2021.
//

import UIKit
import CoreData
import SwipeCellKit

class HomeViewController: UIViewController, UITableViewDelegate{
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var eventArray = [Events]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Load Home")
        
        // Hide back button after login page.
        tabBarController!.navigationItem.hidesBackButton = true

        tabBarController!.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: Constants.Button.AddEventViewButton.addEventIconImage,
            style: .plain,
            target: self,
            action: #selector(addNewEventPressed)
        )
        
        loadEvent()
        print("Counting eventing \(eventArray.count)")
        if eventArray.count > 0 {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(EventCell.self, forCellReuseIdentifier: Constants.eventCellIdentifier)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Home viewDidAppear")
        tabBarController!.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: Constants.Button.AddEventViewButton.addEventIconImage,
            style: .plain,
            target: self,
            action: #selector(addNewEventPressed)
        )
    }
    

    @objc func addNewEventPressed() {
        self.performSegue(withIdentifier: "AddNewEventSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddNewEventSegue" {
            (segue.destination as! AddNewEventViewController).delegate  = self
        }
    }
    
    func saveEvent() {
        do{
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
        tableView.reloadData()
    }
    
    
    func loadEvent(with request: NSFetchRequest<Events> = Events.fetchRequest()) {
        do {
            eventArray = try context.fetch(request)
        } catch {
            print("Error decoding array. \(error)")
        }
//        tableView.reloadData()
    }
    
    func deleteEvent(indexPath: IndexPath) {
        
        context.delete(eventArray[indexPath.row])
        eventArray.remove(at: indexPath.row)
        saveEvent()
//        tableView.reloadData()
        print("Event Deleted")
    }
}

// MARK: Table View Methods
extension HomeViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //hard code 1 row for now: profile and logout
        return eventArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.eventCellIdentifier, for: indexPath) as! EventCell
        cell.delegate = self
        
        cell.eventNameTextLabel.text = eventArray[indexPath.row].name
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "dd MMM yy HH:mm"
        cell.eventStartTimeTextLabel.text = timeFormatter.string(from: eventArray[indexPath.row].startTime!)
        
        for subview in cell.eventAddressView.subviews {
            if let labelView = subview as? UILabel {
                labelView.text = eventArray[indexPath.row].address!
            }
        }
        
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! SwipeTableViewCell
//        cell.delegate = self
//        return cell
//    }
//
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        //Open Event Detail View when clicked
        performSegue(withIdentifier: "GetEventDetailSegue", sender: self)
    }
}

//MARK: Add New Event View Delegate Methods

extension HomeViewController: AddNewEventViewControllerDelegate {
    
    func popOverDismissed() {
        loadEvent()
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
        print("Run popOverDismissed")
    }
}

//MARK: Swipe Cell Delegate Methods
extension HomeViewController: SwipeTableViewCellDelegate{
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }

        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            // handle action by updating model with deletion
            self.deleteEvent(indexPath: indexPath)
        }

        // customize the action appearance
        deleteAction.image = UIImage(named: "DeleteIcon")

        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .none
        options.transitionStyle = .border
        return options
    }
    
}
