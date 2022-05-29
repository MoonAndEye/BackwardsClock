//
//  AngleUtilityTests.swift
//  Tests iOS
//
//  Created by cm0679 on 2022/5/29.
//

import XCTest

class AngleUtilityTests: XCTestCase {
    
    private var angleUtility: AngleUtility?
    
    private let date = Date(timeIntervalSince1970: 1653824023)

    override func setUpWithError() throws {
        super.setUp()
        angleUtility = AngleUtility()
    }

    override func tearDownWithError() throws {
        angleUtility = nil
        super.tearDown()
    }
    
    func test_43SecondAngle() {
        
        let radius = angleUtility?.getSecondHandRadius(from: date.timeIntervalSince1970) ?? 0
        let answer = Double(43) / Double(60) * Double.pi * 2
        print("angle: \(radius)")
        print("answer: \(answer)")
        XCTAssertEqual(radius, answer, accuracy: 0.1)
    }
    
    func test_33MinuteAngle() {

        let radius = angleUtility?.getMinuteHandRadius(from: date.timeIntervalSince1970) ?? 0
        let answer = Double(33) / Double(60) * Double.pi * 2
        print("angle: \(radius)")
        print("answer: \(answer)")
        XCTAssertEqual(radius, answer, accuracy: 0.1)
    }
    
    func test_19_33HourAngle() {
        
        let radius = angleUtility?.getHourHandRadius(from: date.timeIntervalSince1970) ?? 0
        
        print("angle: \(radius)")
        XCTAssertEqual(radius, 3.9531707557671565, accuracy: 0.1)
    }
}
