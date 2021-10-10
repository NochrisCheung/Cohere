//
//  K.swift
//  Cohere
//
//  Created by Chiu Wing Cheung on 05/10/2021.
//

import Foundation
import UIKit

struct Constants {
    static let appName = "Cohere"
    static let profileCellIdentifier = "ProfileReusableCell"
    static let profileCellNibName = "ProfileCell"
    
    static let newEventNameCellIdentifier = "NewEventNameReusableCell"
    static let dayPickerCellIdentifier = "DayPickerResuableCell"
    static let newEventAddressCellIdentifier = "NewEventAddressReusableCell"
    static let submitButtonCellIdentifier = "submitButtonReusableCell"
    
    struct Color {
        static let logoColor = UIColor(red:  255/255, green: 149/255, blue: 0/255, alpha: 1)
        static let secondaryLogoColor = UIColor(red: 255/255, green: 225/255, blue: 182/255, alpha: 1)
        static let backgroundColor = UIColor(red: 255/255, green: 251/255, blue: 247/255, alpha: 1)
    }
    
    struct Button {
        
        struct LogOutButton {
            static let title = "Log Out"
            
        }
    }
}
