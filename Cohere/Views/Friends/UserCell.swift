//
//  UserCell.swift
//  Cohere
//
//  Created by Chiu Wing Cheung on 15/10/2021.
//

import UIKit
protocol UserCellDelegate {
    func getFriendsUID() -> [NSDictionary]
    func getPendingUsersUID() -> [NSDictionary]
    func sendConnectionInvite(userData: [String: String])
}

class UserCell: UITableViewCell {

    let identifier = Constants.userCellIdentifier
    var delegate: UserCellDelegate?
    var userData: [String: Any]?
    
    var userPicImageView: UIImageView! = UIImageView()
    var userNameLabel: UILabel! = UILabel()
    var userConnectionStatusImageView: UIImageView! = UIImageView()
    var isFriendImageView: UIImageView! = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("Create UserCell")
        
        selectionStyle = .none
        
        contentView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        contentView.addSubview(userPicImageView)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(userConnectionStatusImageView)
        
        configureUserPicImageView()
        configureUserNameLabel()
        configureUserConnectionStatusImageView()
    }

    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUserPicImageView() {
        userPicImageView.image = Constants.defaultProfilePicImage!
        userPicImageView.tintColor = Constants.Color.logoColor
        
        userPicImageView.translatesAutoresizingMaskIntoConstraints = false
        userPicImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        userPicImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        
        userPicImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -10).isActive = true
        userPicImageView.widthAnchor.constraint(equalTo: userPicImageView.heightAnchor).isActive = true
        
    }
    
    func configureUserNameLabel() {
        userNameLabel.textColor = UIColor.label
        
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        userNameLabel.leadingAnchor.constraint(equalTo: userPicImageView.trailingAnchor, constant: 10).isActive = true
        userNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        userNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func shouldConfigureAddFriendButton() -> Bool {
        let friendsUID = delegate?.getFriendsUID()
        let pendingUsersUID = delegate?.getPendingUsersUID()
        
        for uid in friendsUID! {
//            print("\(String(describing: uid["uid"]!))")
//            print("\(String(describing: userData!["uid"]!))")
            if String(describing: userData!["uid"])  == String(describing: uid["uid"]) {
                configureIsFriendImageView()
                print("Is a friend: \(String(describing: uid["uid"]!))")
                return false
            }
        }
        
        for uid in pendingUsersUID! {
            if String(describing: userData!["uid"])  == String(describing: uid["uid"]) {
                configurePendingConnection()
                print("Is a pending connection: \(String(describing: uid["uid"]!))")
                return false
            }
        }
        
        print("Is not a connection")
        configureAddUserButton()
        return true
    }
    
    func configureUserConnectionStatusImageView() {
        userConnectionStatusImageView.translatesAutoresizingMaskIntoConstraints = false
        userConnectionStatusImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        userConnectionStatusImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        userConnectionStatusImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -30).isActive = true
        userConnectionStatusImageView.widthAnchor.constraint(equalTo: userConnectionStatusImageView.heightAnchor).isActive = true
    }
    
    func configureAddUserButton() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        userConnectionStatusImageView.isUserInteractionEnabled = true
        userConnectionStatusImageView.addGestureRecognizer(tapGestureRecognizer)
        
        userConnectionStatusImageView.image = Constants.Button.AddFriendButton.addFriendIconImage
        userConnectionStatusImageView.tintColor = Constants.Color.logoColor
        
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
//        usersArray
        delegate?.sendConnectionInvite(userData: self.userData as! [String: String])
        configurePendingConnection()
    }
    
    func configurePendingConnection(){
        userConnectionStatusImageView.image = Constants.Button.AddFriendButton.pendingFriendInviteIconImage
        userConnectionStatusImageView.tintColor = Constants.Color.secondaryLogoColor
        userConnectionStatusImageView.isUserInteractionEnabled = false
    }
    
    func configureIsFriendImageView() {
        userConnectionStatusImageView.image = Constants.Button.AddFriendButton.isFriendPicImage
        userConnectionStatusImageView.tintColor = UIColor.systemGreen
    }
}
