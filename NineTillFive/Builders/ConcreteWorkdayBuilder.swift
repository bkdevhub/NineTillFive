//
//  ConcreteWorkdayBuilder.swift
//  NineTillFive
//
//  Created by Björn Viehmann on 14.11.22.
//

import Foundation

class ConcreteWorkdayBuilder : WorkdayBuilder {
    var startedAt: Date?
    
    var workingHours: TimePart?
    
    var breaksDuration: TimePart?
        
    func build() -> Workday? {
    
        if let startedAt = startedAt, let workingHours = workingHours, let breaksDuration = breaksDuration {
            return Workday(startedAt: startedAt, workingHours: workingHours, breaksDuration: breaksDuration)
        }
        
        return nil
    }
}
