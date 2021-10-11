//
//  DummyEventRecord.swift
//  Cohere
//
//  Created by Chiu Wing Cheung on 10/10/2021.
//

import Foundation

struct DummyEventRecord{
    
    static let eventName: String? = "Example Event"
    
    static let eventStartTime: Date? = {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        return date
    }()
    
    static let eventEndTime : Date? = {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        return date
    }()
    
    static let eventAddress : String? = "Example Address"
    
}
