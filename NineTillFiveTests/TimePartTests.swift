//
//  Time.swift
//  NineTillFiveTests
//
//  Created by Björn Viehmann on 14.11.22.
//

import Foundation

@testable import NineTillFive
import XCTest

class TimePartTests: XCTestCase {
    
    func testInitWithHoursAndMinutes() {
        
        let sut = TimePart(hours: 8, minutes: 30)
        
        XCTAssertEqual(sut.hours, 8)
        XCTAssertEqual(sut.minutes, 30)
    }
    
    func testConvertsSelfIntoMinutes() {
        let sut = TimePart(hours: 8, minutes: 30)
        
        let expectedMinutes = 510
        let returnedMinutes = sut.convertSelfIntoMinutes()
        
        XCTAssertEqual(returnedMinutes, expectedMinutes)
    }
    
    func testReturnsOnlyMinutesWhenHoursNotSet() {
        let sut = TimePart(hours: 0, minutes: 3)
        
        let expectedReturnString = "3 min."
        
        let actualReturnString = "\(sut)"
        
        XCTAssertEqual(actualReturnString, expectedReturnString)
    }
    
    func testReturnsHoursMinutesWhenHoursPropertyIsSet() {
        let sut = TimePart(hours: 8, minutes: 3)
        
        let expectedReturnString = "8h : 3m"
        
        let actualReturnString = "\(sut)"
        
        XCTAssertEqual(actualReturnString, expectedReturnString)
    }
       
    

}
