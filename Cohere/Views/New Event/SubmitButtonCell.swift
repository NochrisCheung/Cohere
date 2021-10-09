//
//  SubmitButtonCell.swift
//  Cohere
//
//  Created by Chiu Wing Cheung on 09/10/2021.
//

import UIKit

class SubmitButtonCell: UITableViewCell {

    static let identifier = Constants.submitButtonCellIdentifier
//    var eventTextField: UITextField?
    var submitButton : UIButton!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("Create NewEventNameCell")
        
        selectionStyle = .none
        separatorInset = UIEdgeInsets(top: 0, left: CGFloat.greatestFiniteMagnitude, bottom: 0, right: 0)

        
        submitButton = UIButton()
        
        contentView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        contentView.addSubview(submitButton)
        configureButtonField()
    }

    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureButtonField() {
        submitButton.backgroundColor = Constants.Color.logoColor
        submitButton.setTitleColor(UIColor.white, for: .normal)
        submitButton.setTitle("Submit", for: .normal)
        
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.layer.cornerRadius = 5
        submitButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        submitButton.widthAnchor.constraint(equalToConstant: 260).isActive = true
//        submitButton.leadingAnchor.constraint(equalTo: leadingAnchor , constant: 15).isActive = true
//        submitButton.trailingAnchor.constraint(equalTo: trailingAnchor , constant: -15).isActive = true
        submitButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        submitButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
}
