//
//  EventDetailViewController.swift
//  Cohere
//
//  Created by Chiu Wing Cheung on 10/10/2021.
//

import UIKit

class EventDetailViewController: UIViewController  {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Unhide back button after login page.
        tabBarController!.navigationItem.hidesBackButton = false
    }
    
}
