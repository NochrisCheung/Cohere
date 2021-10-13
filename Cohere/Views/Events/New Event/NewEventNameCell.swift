//
//  NewEventCell.swift
//  Cohere
//
//  Created by Chiu Wing Cheung on 08/10/2021.
//

import UIKit

class NewEventNameCell: UITableViewCell {
    
    static let identifier = Constants.newEventNameCellIdentifier
    
    var eventTextField: UITextField! = UITextField()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("Create NewEventNameCell")
        selectionStyle = .none
        
        contentView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        contentView.addSubview(eventTextField!)
        configureEventTextField()
    }

    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureEventTextField() {
        eventTextField.textColor = UIColor.systemOrange
        eventTextField.placeholder = "New Event Name"
        eventTextField.translatesAutoresizingMaskIntoConstraints = false
        eventTextField.leadingAnchor.constraint(equalTo: leadingAnchor , constant: 15).isActive = true
        eventTextField.trailingAnchor.constraint(equalTo: trailingAnchor , constant: -15).isActive = true
        eventTextField.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
