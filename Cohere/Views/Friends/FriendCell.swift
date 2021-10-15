//
//  FriendCell.swift
//  Cohere
//
//  Created by Chiu Wing Cheung on 13/10/2021.
//

import UIKit

class FriendCell: UITableViewCell {

    let identifier = Constants.friendCellIdentifier
    
    var friendPicImageView: UIImageView! = UIImageView()
    var friendNameLabel: UILabel! = UILabel()
    var addFriendButton: UIImageView! = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("Create FriendCell")
        
        contentView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        contentView.addSubview(friendPicImageView)
        contentView.addSubview(friendNameLabel)
        
        configurefriendPicImageView()
        configurefriendNameLabel()
    }

    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurefriendPicImageView() {
        friendPicImageView.image = Constants.defaultProfilePicImage!
        friendPicImageView.tintColor = Constants.Color.logoColor
        
        friendPicImageView.translatesAutoresizingMaskIntoConstraints = false
        friendPicImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        friendPicImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        
        friendPicImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -10).isActive = true
        friendPicImageView.widthAnchor.constraint(equalTo: friendPicImageView.heightAnchor).isActive = true
        
    }
    
    func configurefriendNameLabel() {
        friendNameLabel.textColor = UIColor.label
        
        friendNameLabel.translatesAutoresizingMaskIntoConstraints = false
        friendNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        friendNameLabel.leadingAnchor.constraint(equalTo: friendPicImageView.trailingAnchor, constant: 10).isActive = true
        friendNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        friendNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
