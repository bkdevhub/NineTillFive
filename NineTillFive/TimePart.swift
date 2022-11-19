//
//  Time.swift
//  NineTillFive
//
//  Created by Björn Viehmann on 14.11.22.
//

import Foundation

struct TimePart : Equatable, CustomStringConvertible {

    let hours: Int
    let minutes: Int

    var description: String {
        if(self.hours == 0) {
            return "\(minutes) min."
        }
        
        return "\(self.hours)h : \(minutes)m"
    }
    
    func convertSelfIntoMinutes() -> Int {
        return (hours*60) + minutes
    }
}
