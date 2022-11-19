//
//  WorkdayBuilder.swift
//  NineTillFiveTests
//
//  Created by Björn Viehmann on 14.11.22.
//

import Foundation
import XCTest

@testable import NineTillFive

class WorkdayBuilderTest: XCTestCase {
    
    private let breaks30Minutes = TimePart(hours: 0, minutes: 30)
    private let workingHours8 = TimePart(hours: 8, minutes: 0)
    
    private var startedAt8InTheMorning: Date {
        return getGregorianDateFrom(year: 2022, month: 1, day: 1, hour: 8, minute: 0)
    }
        
    func testSetsStartAtPropertyDirectly() {
        let sut = createSUT()
        let expectedDate = getGregorianDateFrom(year: 2022, month: 1, day: 1, hour: 8, minute: 0)
        
        sut.startedAt = getGregorianDateFrom(year: 2022, month: 1, day: 1, hour: 8, minute: 0)
        
        XCTAssertEqual(sut.startedAt, expectedDate)
    }
    
    func testSetsWorkingHoursProperyDirectly() {
        let sut = createSUT()
        let expectedWorkigHours = TimePart(hours: 8, minutes: 0)
        
        sut.workingHours = TimePart(hours: 8, minutes: 0)
        
        XCTAssertEqual(sut.workingHours, expectedWorkigHours)
    }
    
    func testsSetsBreaksDurationPropertyDirectly() {
        let sut = createSUT()
        let expectedBreaksDuration = TimePart(hours: 0, minutes: 30)
        
        sut.breaksDuration = TimePart(hours: 0, minutes: 30)
        
        XCTAssertEqual(sut.breaksDuration, expectedBreaksDuration)
    }
    
    func testBuildsAndReturnsWorkdayWhenAllPropertiesAreSet() {
        let sut = createSUT()
        
        sut.breaksDuration = breaks30Minutes
        sut.workingHours = workingHours8
        sut.startedAt = startedAt8InTheMorning
        
        let buildWorday = sut.build()
        
        XCTAssertEqual(buildWorday!.startedAt, startedAt8InTheMorning)
        XCTAssertEqual(buildWorday!.workingHours, workingHours8)
        XCTAssertEqual(buildWorday!.breaksDuration, breaks30Minutes)
    }
    
    
    private func createSUT() -> ConcreteWorkdayBuilder {
        return ConcreteWorkdayBuilder()
    }
    
    
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
}
