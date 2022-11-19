//
//  WorkdayBuilder.swift
//  NineTillFive
//
//  Created by Björn Viehmann on 14.11.22.
//

import Foundation

protocol WorkdayBuilder {
    
    var startedAt: Date? { get set }
    var workingHours: TimePart? { get set }
    var breaksDuration: TimePart? { get set }
    
    func build() -> Workday?
}
