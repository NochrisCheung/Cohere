//
//  HomeViewController.swift
//  Cohere
//
//  Created by Chiu Wing Cheung on 04/10/2021.
//

import UIKit
import CoreData

class HomeViewController: UIViewController, UITableViewDelegate  {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var eventArray = [Event]()
    
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
        
        loadEvent()
        print("Counting eventing \(eventArray.count)")
        if eventArray.count > 0 {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(EventCell.self, forCellReuseIdentifier: Constants.eventCellIdentifier)
        }
        
    }

    @objc func addNewEventPressed() {
        self.performSegue(withIdentifier: "AddNewEventSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddNewEventSegue" {
            (segue.destination as! AddNewEventViewController).delegate  = self
        }
    }
    
    func loadEvent(with request: NSFetchRequest<Event> = Event.fetchRequest()) {
        
        do {
            eventArray = try context.fetch(request)
        } catch {
            print("Error decoding array. \(error)")
        }
        
        tableView.reloadData()
    }
 
}

// MARK: Create event table cells programmatically
extension HomeViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //hard code 1 row for now: profile and logout
        return eventArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.eventCellIdentifier, for: indexPath) as! EventCell

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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        //Open Event Detail View when clicked
        performSegue(withIdentifier: "GetEventDetailSegue", sender: self)
        
    }

}

//MARK: Delegate method

extension HomeViewController: AddNewEventViewControllerDelegate {
    
    func popOverDismissed() {
        print("Run popOverDismissed")
        self.loadEvent()
    }
    
}
