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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("Create FriendCell")
        
        contentView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        contentView.addSubview(friendPicImageView)
        contentView.addSubview(friendNameLabel)
//        contentView.addSubview(friendEmailLabel)
        
        configurefriendPicImageView()
        configurefriendNameLabel()
//        configurefriendEmailLabel()
    }

    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurefriendPicImageView() {
//        friendPicImageView.backgroundColor = Constants.Color.logoColor
        friendPicImageView.image = Constants.defaultProfilePicImage!
        friendPicImageView.tintColor = Constants.Color.secondaryLogoColor
        
        friendPicImageView.translatesAutoresizingMaskIntoConstraints = false
        friendPicImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        friendPicImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        
        friendPicImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -10).isActive = true
        friendPicImageView.widthAnchor.constraint(equalTo: friendPicImageView.heightAnchor).isActive = true
        
        
    }
    
    func configurefriendNameLabel() {
        friendNameLabel.textColor = UIColor.systemGray
        friendNameLabel.font = UIFont.boldSystemFont(ofSize: 16)

        // hard code name for now
        friendNameLabel.text = "Chris Cheung"
        
        friendNameLabel.translatesAutoresizingMaskIntoConstraints = false
        friendNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        friendNameLabel.leadingAnchor.constraint(equalTo: friendPicImageView.trailingAnchor, constant: 10).isActive = true
        friendNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
//        friendNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
//        friendNameLabel.bottomAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        friendNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
