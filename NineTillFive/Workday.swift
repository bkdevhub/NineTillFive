//
//  Workday.swift
//  NineTillFive
//
//  Created by Björn Viehmann on 05.10.22.
//

import Foundation

class Workday {
    let startedAt: Date
    var workingHours: TimePart
    var breaksDuration: TimePart
    var currentTime: Date
    
    var remainingTimeUntilEnd: TimePart {
        let differenceInMinutes = (endsAt.timeIntervalSinceReferenceDate - currentTime.timeIntervalSinceReferenceDate) / 60
        
        if(differenceInMinutes < 0) {
            return TimePart(hours: 0, minutes: 0)
        } else {
            let hours = Int(floor(differenceInMinutes / 60))
            let minutes = Int(((differenceInMinutes / 60) - Double(hours)) * 60)

            return TimePart(hours: hours, minutes: minutes)
        }
    }
       
    var endsAt: Date {
        let calendar = Calendar(identifier: .gregorian)
        
        let calculatedEndDate = calendar.date(byAdding: .minute , value: breaksDuration.convertSelfIntoMinutes(), to: startedAt)
        
        return calendar.date(byAdding: .minute, value: workingHours.convertSelfIntoMinutes(), to: calculatedEndDate!)!
    }

    init(startedAt: Date, workingHours: TimePart, breaksDuration: TimePart) {
        self.startedAt = startedAt
        self.workingHours = workingHours
        self.breaksDuration = breaksDuration
        self.currentTime = Date()
    }
        
}
