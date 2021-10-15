//
//  UserCell.swift
//  Cohere
//
//  Created by Chiu Wing Cheung on 15/10/2021.
//

import UIKit

class UserCell: UITableViewCell {

    let identifier = Constants.userCellIdentifier
    
    var userPicImageView: UIImageView! = UIImageView()
    var userNameLabel: UILabel! = UILabel()
    var addUserButton: UIImageView! = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("Create UserCell")
        
        selectionStyle = .none
        
        contentView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        contentView.addSubview(userPicImageView)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(addUserButton)
        
        configureUserPicImageView()
        configureUserNameLabel()
        configureAddUserButton()
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
    
    func configureAddUserButton() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        addUserButton.isUserInteractionEnabled = true
        addUserButton.addGestureRecognizer(tapGestureRecognizer)
        
        addUserButton.image = Constants.Button.AddFriendButton.addFriendIconImage
        
        addUserButton.translatesAutoresizingMaskIntoConstraints = false
        addUserButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        addUserButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        addUserButton.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -30).isActive = true
        addUserButton.widthAnchor.constraint(equalTo: addUserButton.heightAnchor).isActive = true
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        addUserButton.tintColor = Constants.Color.secondaryLogoColor
        addUserButton.isUserInteractionEnabled = false
        // Need to work on send invite
        //        delegate?.submitData()
    }
}
