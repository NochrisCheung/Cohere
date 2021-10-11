//
//  ProfileCell.swift
//  Cohere
//
//  Created by Chiu Wing Cheung on 06/10/2021.
//

import UIKit
import Firebase

class ProfileCell: UITableViewCell {

    let identifier = Constants.profileCellIdentifier
    
    var profilePicImageView: UIImageView! = {
        return UIImageView()
    }()
    
    var profileNameLabel: UILabel! = {
        return UILabel()
    }()
    var profileEmailLabel: UILabel! = {
        return UILabel()
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("Create ProfileCell")
        
        contentView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        contentView.addSubview(profilePicImageView)
        contentView.addSubview(profileNameLabel)
        contentView.addSubview(profileEmailLabel)
        
        configureprofilePicImageView()
        configureprofileNameLabel()
        configureprofileEmailLabel()
    }

    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureprofilePicImageView() {
//        profilePicImageView.backgroundColor = Constants.Color.logoColor
        profilePicImageView.image = Constants.defaultProfilePicImage!
        profilePicImageView.tintColor = Constants.Color.secondaryLogoColor
        
        profilePicImageView.translatesAutoresizingMaskIntoConstraints = false
        profilePicImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        profilePicImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        
        profilePicImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -10).isActive = true
        profilePicImageView.widthAnchor.constraint(equalTo: profilePicImageView.heightAnchor).isActive = true
        
        
    }
    
    func configureprofileNameLabel() {
        profileNameLabel.textColor = UIColor.systemGray
        profileNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
//        profileNameLabel.text = UserDefaults.standard.string(forKey: Constants.DefaultsKey.emailAddressKey)
        // hard code name for now
        profileNameLabel.text = "Chris Cheung"
        
        profileNameLabel.translatesAutoresizingMaskIntoConstraints = false
        profileNameLabel.leadingAnchor.constraint(equalTo: profilePicImageView.trailingAnchor, constant: 15).isActive = true
        profileNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
//        profileNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
//        profileNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        profileNameLabel.bottomAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        profileNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
    
    func configureprofileEmailLabel() {
        profileEmailLabel.textColor = UIColor.lightGray
        profileEmailLabel.text = UserDefaults.standard.string(forKey: Constants.DefaultsKey.emailAddressKey)
        
        profileEmailLabel.translatesAutoresizingMaskIntoConstraints = false
        profileEmailLabel.leadingAnchor.constraint(equalTo: profilePicImageView.trailingAnchor, constant: 15).isActive = true
        profileEmailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
//        profileEmailLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
//        profileEmailLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 20).isActive = true
        profileEmailLabel.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        profileEmailLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
    
}
