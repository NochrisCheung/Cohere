//
//  K.swift
//  Cohere
//
//  Created by Chiu Wing Cheung on 05/10/2021.
//

import Foundation
import UIKit
import Firebase

struct Constants {
    static let appName = "Cohere"
    
    //MARK: Event View
    static let eventCellIdentifier = "EventResuableCell"
    static let addressIconImage = UIImage(systemName: "mappin")

    //MARK: New Event View
    static let newEventNameCellIdentifier = "NewEventNameReusableCell"
    static let dayPickerCellIdentifier = "DayPickerResuableCell"
    static let newEventAddressCellIdentifier = "NewEventAddressReusableCell"
    static let submitButtonCellIdentifier = "submitButtonReusableCell"
    
    //MARK: Friend View
    static let friendCellIdentifier = "FriendReusableCell"
    
    //MARK: New Friend View
    static let userCellIdentifier = "UserReusableCell"
    
    //MARK: Profile View
    static let profileCellIdentifier = "ProfileReusableCell"
    static let logOutCellIdentifier = "LogOutResuableCell"
//    static let profileCellNibName = "ProfileCell"

    
    static let defaultProfilePicImage = UIImage(systemName: "person.crop.circle.fill")
    
    
    
    static let firebaseDB = Firestore.firestore()
        
    struct Color {
        static let logoColor = UIColor(red:  255/255, green: 149/255, blue: 0/255, alpha: 1)
        static let secondaryLogoColor = UIColor(red: 255/255, green: 225/255, blue: 182/255, alpha: 1)
        static let backgroundColor = UIColor(red: 255/255, green: 251/255, blue: 247/255, alpha: 1)
    }
    
    struct Button {
        
        struct LogOutButton {
            static let title = "Log Out"
        }
        struct AddEventViewButton {
            static let addEventIconImage = UIImage(systemName: "plus.circle")
        }
        struct AddFriendViewButton {
            static let addFriendIconImage = UIImage(systemName: "person.crop.circle.badge.plus")
        }
        struct AddFriendButton {
            static let addFriendIconImage = UIImage(systemName: "person.crop.circle.badge.plus")
            static let pendingFriendInviteIconImage = UIImage(systemName: "person.crop.circle.badge.clock")
            static let isFriendPicImage = UIImage(systemName: "person.crop.circle.badge.checkmark")
        }
    }
    
    struct DefaultsKey {
        static let emailAddressKey = "AccountEmail"
    }
        
}
