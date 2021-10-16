//
//  FriendsViewController.swift
//  Cohere
//
//  Created by Chiu Wing Cheung on 13/10/2021.
//

import UIKit
import CoreData
import Firebase
//import SwipeCellKit

class FriendsViewController: UIViewController, UITableViewDelegate{
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var friendArray = [Friends]()
    
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
    
        loadFriend()
        print("Counting friends \(friendArray.count)")
        if friendArray.count > 0 {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(FriendCell.self, forCellReuseIdentifier: Constants.friendCellIdentifier)
        }
        
        Constants.firebaseDB.collection("friend").document("pOWy2H4HFufM1GaWbWq208aBhI03")
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                guard let data = document.data() else {
                    print("Document data was empty.")
                    return
                }
                print("Current data: \(data)")
                self.updateFriend(with: data["friendsUID"] as! [String])
            }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Friend viewDidAppear")
        tabBarController!.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: Constants.Button.AddFriendViewButton.addFriendIconImage,
            style: .plain,
            target: self,
            action: #selector(addNewFriendPressed)
        )
    }

    @objc func addNewFriendPressed() {
        self.performSegue(withIdentifier: "AddNewFriendSegue", sender: self)
    }
    
    //MARK: Core Data Methods
    
    func saveFriend() {
//        context.mergePolicy = NSMergePolicy(merge: NSMergePolicyType.mergeByPropertyObjectTrumpMergePolicyType)
        print("Saving Friend")
        do{
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
        tableView.reloadData()
    }
    
    
    func loadFriend(with request: NSFetchRequest<Friends> = Friends.fetchRequest()) {
        do {
            friendArray = try context.fetch(request)
        } catch {
            print("Error decoding array. \(error)")
        }
        tableView.reloadData()
    }
    
    func updateFriend(with remoteFriendsUIDArray: [String]) {
        loadFriend()
//        for uid in newFriendData["friendsUID"]{
        var friendDataRow : Int = 0
        var localFriendsUIDArray : [String] = []

        for friend in friendArray{
            localFriendsUIDArray.append(friend.uid!)
        }
        
        for uid in localFriendsUIDArray{
            print("Checking local friend array")
            if (remoteFriendsUIDArray).contains(uid) == false {
                //friend removed
                self.deleteFriend(friendDataRow: friendDataRow)
            }
            friendDataRow = friendDataRow + 1
        }
        
        for uid in remoteFriendsUIDArray{
            print("Checking remote friend array")
            if (localFriendsUIDArray).contains(uid) == false {
                //friend added
                print("Local friend array missing data")
                self.addFriend(newFriendUID: uid)
            }
        }
    }
    
    func deleteFriend(friendDataRow: Int) {
        context.delete(friendArray[friendDataRow])
        friendArray.remove(at: friendDataRow)
        
        saveFriend()
        print("Friend Deleted")
    }
    
    func addFriend(newFriendUID: String){
        print("Adding Friend")
        let newFriend = Friends(context: self.context)
        
        newFriend.firstName = "Lily"
        newFriend.lastName = "Lin"
        newFriend.emailAddress = "l@ll.com"
        newFriend.uid = newFriendUID
        
        saveFriend()
        loadFriend()
        print("Friend Added")
    }
}

// MARK: Table View Methods
extension FriendsViewController: UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //hard code 2 row for now: profile and logout
        return friendArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.friendCellIdentifier, for: indexPath) as! FriendCell
        let friend = friendArray[indexPath.row]

        cell.friendNameLabel.text = "\(friend.firstName!) \(friend.lastName!)"
//            cell.profileEmailLabel.text = "\(profile.emailAddress!)"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

//        let cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)

    }
}
