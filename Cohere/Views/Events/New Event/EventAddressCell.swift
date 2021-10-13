//
//  EventAddressCell.swift
//  Cohere
//
//  Created by Chiu Wing Cheung on 09/10/2021.
//

import UIKit

class NewEventAddressCell: UITableViewCell {

    static let identifier = Constants.newEventAddressCellIdentifier
    
    var eventTextField: UITextField! = UITextField()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("Create NewEventNameCell")
        selectionStyle = .none
        eventTextField = UITextField()
        
        contentView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        contentView.addSubview(eventTextField)
        configureEventTextField()
    }

    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureEventTextField() {
        eventTextField.textColor = UIColor.systemOrange
        eventTextField.placeholder = "Event Address"
        eventTextField.translatesAutoresizingMaskIntoConstraints = false
        eventTextField.leadingAnchor.constraint(equalTo: leadingAnchor , constant: 15).isActive = true
        eventTextField.trailingAnchor.constraint(equalTo: trailingAnchor , constant: -15).isActive = true
        eventTextField.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
