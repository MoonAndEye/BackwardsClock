//
//  DateUtilityTests.swift
//  Tests iOS
//
//  Created by cm0679 on 2022/5/29.
//

import XCTest

class DateUtilityTests: XCTestCase {

    private var dateUtility: DateUtility?
    
    private let date = Date(timeIntervalSince1970: 1653824023)
    
    override func setUpWithError() throws {
        super.setUp()
        dateUtility = DateUtility()
    }

    override func tearDownWithError() throws {
        dateUtility = nil
        super.tearDown()
    }

    func test_getSecound() {
        
        let second = dateUtility?.getSecond(from: date.timeIntervalSince1970)
        XCTAssertEqual(second, 43)
    }
    
    func test_getMinute() {
        
        let minute = dateUtility?.getMinute(from: date.timeIntervalSince1970)
        XCTAssertEqual(minute, 33)
    }
    
    func test_getHour() {
        let hour = dateUtility?.getHour(from: date.timeIntervalSince1970)
        XCTAssertEqual(hour, 19)
    }
}
