//
//  DateProvider.swift
//  NineTillFive
//
//  Created by Björn Viehmann on 06.10.22.
//

import Foundation

struct DateProvider: DateProviding {
    func getCurrentDate() -> Date {
        return Date()
    }
}
