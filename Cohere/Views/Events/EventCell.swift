//
//  EventCell.swift
//  Cohere
//
//  Created by Chiu Wing Cheung on 10/10/2021.
//

import UIKit
import SwipeCellKit

//UITableViewCell
class EventCell: SwipeTableViewCell {

    static let identifier = Constants.eventCellIdentifier
    
    var eventNameTextLabel: UILabel! = {
        return UILabel()
    }()
    
    var eventStartTimeTextLabel: UILabel! = {
        return UILabel()
    }()
    
    var eventAddressView: UIView! = {
        return UIView()
    }()
    
    var eventAddressIconImage: UIImageView!

    var eventAddressTextLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("Create Event Cell")
        
        contentView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        contentView.addSubview(eventNameTextLabel)
        contentView.addSubview(eventStartTimeTextLabel)
        contentView.addSubview(eventAddressView)
        
        eventNameConfiguration()
        eventStartTimeConfiguration()
        eventAddressViewConfiguration()
        
    }

    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func eventNameConfiguration() {

        eventNameTextLabel.textColor = UIColor.systemOrange
        //        dayPickerTextLabel.text = "Start Time"

        eventNameTextLabel.translatesAutoresizingMaskIntoConstraints = false
        eventNameTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor , constant: 15).isActive = true
        eventNameTextLabel.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor, constant: -30).isActive = true
        eventNameTextLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
    }
    
    func eventStartTimeConfiguration() {

        eventStartTimeTextLabel.textColor = UIColor.lightGray

        eventStartTimeTextLabel.translatesAutoresizingMaskIntoConstraints = false
        eventStartTimeTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor , constant: 15).isActive = true
        eventStartTimeTextLabel.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor, constant: -30).isActive = true
        eventStartTimeTextLabel.topAnchor.constraint(equalTo: eventNameTextLabel.bottomAnchor, constant: 8).isActive = true
        
    }
    
    func eventAddressViewConfiguration() {
        
        eventAddressIconImage = UIImageView()
        eventAddressTextLabel = UILabel()

        eventAddressView.addSubview(eventAddressIconImage)
        eventAddressView.addSubview(eventAddressTextLabel)
        
//        eventAddressView.backgroundColor = Constants.Color.logoColor
        eventAddressView.translatesAutoresizingMaskIntoConstraints = false
        eventAddressView.leadingAnchor.constraint(equalTo: leadingAnchor , constant: 15).isActive = true
        eventAddressView.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor, constant: -30).isActive = true
        eventAddressView.topAnchor.constraint(equalTo: eventStartTimeTextLabel.bottomAnchor, constant: 8).isActive = true
        eventAddressView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        eventAddressView.layoutIfNeeded()
        
        eventAddressIconImage.image = Constants.addressIconImage
//        eventAddressIconImage.backgroundColor = Constants.Color.logoColor
        eventAddressIconImage.translatesAutoresizingMaskIntoConstraints = false
        eventAddressIconImage.leadingAnchor.constraint(equalTo: eventAddressView.leadingAnchor , constant: 0).isActive = true
        eventAddressIconImage.centerYAnchor.constraint(equalTo: eventAddressView.centerYAnchor).isActive = true
        eventAddressIconImage.heightAnchor.constraint(equalTo: eventAddressView.heightAnchor).isActive = true
        let iconImageScale = eventAddressView.bounds.size.height/Constants.addressIconImage!.size.height as CGFloat
        eventAddressIconImage.widthAnchor.constraint(equalToConstant: Constants.addressIconImage!.size.width * iconImageScale).isActive = true

        
        eventAddressTextLabel.textColor = UIColor.lightGray
        eventAddressTextLabel.translatesAutoresizingMaskIntoConstraints = false
//        eventAddressTextLabel.backgroundColor = Constants.Color.logoColor
        eventAddressTextLabel.leadingAnchor.constraint(equalTo: eventAddressIconImage.trailingAnchor , constant: 2).isActive = true
        eventAddressTextLabel.trailingAnchor.constraint(equalTo: eventAddressView.trailingAnchor , constant: 0).isActive = true
        eventAddressTextLabel.centerYAnchor.constraint(equalTo: eventAddressView.centerYAnchor).isActive = true
        eventAddressTextLabel.heightAnchor.constraint(equalTo: eventAddressView.heightAnchor).isActive = true
//
    }
    
//    func eventAddressIconImageConfiguration() {
//
//        eventAddressIconImage.image = Constants.addressIconImage
////        eventAddressIconImage.backgroundColor = Constants.Color.logoColor
//        eventAddressIconImage.translatesAutoresizingMaskIntoConstraints = false
//        eventAddressIconImage.leadingAnchor.constraint(equalTo: eventAddressView.leadingAnchor , constant: 0).isActive = true
//        eventAddressIconImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        eventAddressIconImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
//        eventAddressIconImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
//    }
//
//    func eventAddressConfiguration(eventAddressTextLabel: UITextField) {
//
//        eventAddressTextLabel.textColor = UIColor.lightGray
//
//        eventAddressTextLabel.translatesAutoresizingMaskIntoConstraints = false
//        eventAddressTextLabel.backgroundColor = Constants.Color.logoColor
//        eventAddressTextLabel.leadingAnchor.constraint(equalTo: eventAddressIconImage.leadingAnchor , constant: 2).isActive = true
//        eventAddressTextLabel.trailingAnchor.constraint(equalTo: eventAddressView.trailingAnchor , constant: 0).isActive = true
//        eventAddressTextLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        eventAddressTextLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
//    }
}
