//
//  AddNewFriendViewController.swift
//  Cohere
//
//  Created by Chiu Wing Cheung on 13/10/2021.
//

import UIKit
import CoreData
import Firebase

//protocol AddNewFriendViewControllerDelegate {
//    func popOverDismissed()
//}

class AddNewFriendViewController: UIViewController, UITableViewDelegate {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private var myUID: [NSDictionary] = []
    private var friendsUIDArray: [NSDictionary] = []
    private var pendingUsersUIDArray: [NSDictionary] = []
    private var firebaseUserArray: [[String: Any]] = []
    private var searchedText: String?
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        loadMe()
        loadFriendsUID()
        loadPendingUsersUID()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UserCell.self, forCellReuseIdentifier: Constants.userCellIdentifier)
    }
    
    func getMatchedUserDatafromFireBase(completion: @escaping () -> Void) {
        Constants.firebaseDB.collection("user").whereField("firstName", isEqualTo: searchedText!)
            .getDocuments { (querySnapshot, err) in

            if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
//                        print("\(document.documentID) => \(document.data())")
                        if document.data()["uid"] as! String != self.myUID[0]["uid"] as! String{
                            self.firebaseUserArray.append(document.data())
                        }
                    }
                }
            DispatchQueue.main.async {
                completion()
            }
        }
    }

    //MARK: Core Data Manipulation Method
    func loadMe(with request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest<NSFetchRequestResult>(entityName: "Me")) {

        request.propertiesToFetch = ["uid"]
        request.resultType = .dictionaryResultType
        
        do {
            myUID = try context.fetch(request) as! [NSDictionary]
        } catch {
            print("Error decoding array. \(error)")
        }
        
        print("Fetched data: \(myUID)")
    }
    
    func saveUser() {
        do {
            try context.save()
        } catch {
            print("Error decoding array. \(error)")
        }
//        tableView.reloadData()
        print("Saved User")
    }
    
    func loadPendingUsersUID(with request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")) {

        request.predicate = NSPredicate(format: "pendingConnection == true")
        request.propertiesToFetch = ["uid"]
        request.resultType = .dictionaryResultType
        
        do {
            pendingUsersUIDArray = try context.fetch(request) as! [NSDictionary]
        } catch {
            print("Error decoding array. \(error)")
        }
        
        print("Fetched data: \(pendingUsersUIDArray)")
    }

    func loadFriendsUID(with request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest<NSFetchRequestResult>(entityName: "Friends")) {

        request.propertiesToFetch = ["uid"]
        request.resultType = .dictionaryResultType
        
        do {
            friendsUIDArray = try context.fetch(request) as! [NSDictionary]
        } catch {
            print("Error decoding array. \(error)")
        }
        
        print("Fetched data: \(friendsUIDArray)")
    }
}

//MARK: Search Bar Delegate Methods
extension AddNewFriendViewController: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchedText = searchBar.text
        
        getMatchedUserDatafromFireBase() {
            print("Data:\(self.firebaseUserArray)")
            self.tableView.reloadData()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            firebaseUserArray = []
            tableView.register(UserCell.self, forCellReuseIdentifier: Constants.userCellIdentifier)
            tableView.reloadData()
            searchBar.resignFirstResponder()
        }
    }
}

// MARK: Table View Methods
extension AddNewFriendViewController: UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return firebaseUserArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.userCellIdentifier, for: indexPath) as! UserCell
        cell.delegate = self
        cell.userData = firebaseUserArray[indexPath.row]
        
//        print("Name: \(userData["firstname"]!) \(userData["lastname"]!)")
        cell.userNameLabel.text = "\(cell.userData!["firstName"]!) \(cell.userData!["lastName"]!)"
        cell.shouldConfigureAddFriendButton()
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension AddNewFriendViewController: UserCellDelegate {
    
    func getFriendsUID() -> [NSDictionary]{
        print("In getFriendsUID: \(friendsUIDArray)")
        return friendsUIDArray
    }
    
    func getPendingUsersUID() -> [NSDictionary]{
        print("In getFriendsUID: \(pendingUsersUIDArray)")
        return pendingUsersUIDArray
    }
    
    func sendConnectionInvite(userData: [String: String]) {
        let invitedUserData = Users(context: self.context)
        
        invitedUserData.uid = userData["uid"]!
        invitedUserData.firstName = userData["firstName"]!
        invitedUserData.lastName = userData["lastName"]!
        invitedUserData.emailAddress = userData["emailAddress"]!
        invitedUserData.pendingConnection = true
        
        self.saveUser()
    }
}
