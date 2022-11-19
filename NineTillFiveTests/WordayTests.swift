//
//  WordayTests.swift
//  NineTillFiveTests
//
//  Created by Björn Viehmann on 06.10.22.
//

import Foundation
import XCTest

@testable import NineTillFive

class WorkdayTests: XCTestCase {
    
    private let workingHours8 = TimePart(hours: 8, minutes: 0)
    private let breaksDuration30Minutes = TimePart(hours: 0, minutes: 30)
        
    func testWorkdayInitializesWithGivenDate() {
        var dateComponents = DateComponents()
        dateComponents.day = 1
        dateComponents.month = 1
        dateComponents.year = 2022
        dateComponents.hour = 8
        dateComponents.minute = 0
        dateComponents.second = 0
        dateComponents.timeZone = TimeZone(abbreviation: "CEST")
        
        let calendar = Calendar(identifier: .gregorian)
        
        let dateForComparison = getGregorianDateFrom(year: 2022, month: 1, day: 1, hour: 8, minute: 0)
        
        let givenDate = calendar.date(from: dateComponents)!
        let workday = Workday(startedAt: givenDate, workingHours: workingHours8, breaksDuration: breaksDuration30Minutes)
        
        XCTAssertEqual(workday.startedAt, dateForComparison)
    }
    
    func testWorkdayInitializesWithGivenWorkingHours() {
        let sut = createSUT(workingHours: workingHours8, breaksDuration: breaksDuration30Minutes)
        
        let eightHours = 8
        let zeroMinutes = 0
        
        XCTAssertEqual(sut.workingHours.hours, eightHours)
        XCTAssertEqual(sut.workingHours.minutes, zeroMinutes)
    }
    
    func testWorkdayInitializesWithGivenBreaksInMinutes() {
        let thirtyMinuteBreak = 30
        let sut = createSUT(workingHours: workingHours8, breaksDuration: breaksDuration30Minutes)
        
        XCTAssertEqual(sut.breaksDuration.convertSelfIntoMinutes(), thirtyMinuteBreak)
    }
    
    func testCalculatesCorrectEndOfWorkday() {
        let sut = createSUT(workingHours: workingHours8, breaksDuration: breaksDuration30Minutes)

        let expectedEndOfWorkday = getGregorianDateFrom(year: 2022, month: 1, day: 1, hour: 16, minute: 30)
        
        XCTAssertEqual(sut.endsAt, expectedEndOfWorkday)
    }
    
    func testCalculatesRemaindTimeUntilEndOfWorkday() {
        // started at 9 o'clock
        let startedAt9 = getGregorianDateFrom(year: 2022, month: 1, day: 1, hour: 9, minute: 0)
        let sut = createSUT(workingHours: workingHours8, breaksDuration: breaksDuration30Minutes, startedAt: startedAt9)

        let expectedRemainingTime = TimePart(hours: 4, minutes: 30)
        
        sut.currentTime = getGregorianDateFrom(year: 2022, month: 1, day: 1, hour: 13, minute: 0)
        
        XCTAssertEqual(sut.remainingTimeUntilEnd, expectedRemainingTime)
    }
    
    func testReturnsRemaingTimeOfZeroWhenEndOfWorkdayWasAlreadyReached() {
        let startedAt9 = getGregorianDateFrom(year: 2022, month: 1, day: 1, hour: 9, minute: 0)
        let sut = createSUT(workingHours: workingHours8, breaksDuration: breaksDuration30Minutes, startedAt: startedAt9)

        let expectedRemainingTime = TimePart(hours: 0, minutes: 0)
        
        sut.currentTime = getGregorianDateFrom(year: 2022, month: 1, day: 1, hour: 23, minute: 0)
        
        XCTAssertEqual(sut.remainingTimeUntilEnd, expectedRemainingTime)
    }
    
    // MARK: helper functions
    
    func getGregorianDateFrom(year: Int, month: Int, day: Int, hour: Int, minute: Int) -> Date {
        var dateComponents = DateComponents()
        
        dateComponents.day = day
        dateComponents.month = month
        dateComponents.year = year
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.second = 0
        dateComponents.timeZone = TimeZone(abbreviation: "CEST")
        
        let calendar = Calendar(identifier: .gregorian)
        return calendar.date(from: dateComponents)!
    }
    
    
    func createSUT(workingHours: TimePart, breaksDuration: TimePart, startedAt: Date? = nil) -> Workday {
        
        var started: Date
        
        if startedAt == nil {
            started = getGregorianDateFrom(year: 2022, month: 1, day: 1, hour: 8, minute: 0)
        } else {
            started = startedAt!
        }
        
        return Workday(startedAt: started, workingHours: workingHours, breaksDuration: breaksDuration)
   }
}
