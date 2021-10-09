//
//  ProfileCell.swift
//  Cohere
//
//  Created by Chiu Wing Cheung on 06/10/2021.
//

import UIKit
import Firebase

class ProfileCell: UITableViewCell {

    static let identifier = Constants.profileCellIdentifier
    
    var profileCellLabel: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("Create ProfileCell")
        profileCellLabel = UILabel()
        
        contentView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        contentView.addSubview(profileCellLabel)
        configureLabel()
    }

    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLabel() {
        profileCellLabel.textColor = UIColor.systemOrange
        
        profileCellLabel.translatesAutoresizingMaskIntoConstraints = false
        profileCellLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profileCellLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
}
