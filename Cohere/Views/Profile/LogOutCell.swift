//
//  LogOutCell.swift
//  Cohere
//
//  Created by Chiu Wing Cheung on 11/10/2021.
//

import UIKit

class LogOutCell: UITableViewCell {

    let identifier = Constants.logOutCellIdentifier
    
    var logOutCellLabel: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("Create ProfileCell")
        logOutCellLabel = UILabel()
        
        contentView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        contentView.addSubview(logOutCellLabel)
        configureLabel()
    }

    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLabel() {
        logOutCellLabel.textColor = UIColor.systemOrange
        
        logOutCellLabel.translatesAutoresizingMaskIntoConstraints = false
        logOutCellLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        logOutCellLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
}
