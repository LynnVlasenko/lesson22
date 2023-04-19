//
//  lesson22Tests.swift
//  lesson22Tests
//
//  Created by Volodymyr Rykhva on 28.08.2021.
//

import XCTest
@testable import lesson22

class CarTests: XCTestCase {
    
    //1. Given
    var testEngine: Engine?
    var carMock: Car?
    
    override func setUp() {
        super.setUp()
        // This method is called before the invocation of each test method in the class.
        testEngine = Engine(cylindersCount: 8)
        carMock = Car(engine: testEngine!, model: "test car")
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
    }
    
    //test for function ride(with speed: Int) in Car class. When speed < 0
    func testCarRideLess0() {
        // 2. When
        carMock?.ride(with: -2)
        // 3. Then
        XCTAssertEqual(carMock?.warning, .wrongSpeed)
    }
    
    //test for function ride(with speed: Int) in Car class. When speed > 200
    func testCarRideSpeedMore200() {
        // 2. When
        carMock?.ride(with: 250)
        // 3. Then
        XCTAssertEqual(carMock?.warning, .maxSpeedLimit)
        XCTAssertEqual(testEngine?.state, .ride)
        XCTAssertEqual(testEngine?.engineSpeed, 200)
    }
    
    //test for function ride(with speed: Int) in Car class. When else (speed from 0 to 200)
    func testCarRideFrom0To200() {
        // 2. When
        carMock?.ride(with: 50)
        // 3. Then
        XCTAssertEqual(testEngine?.engineSpeed, 50)
    }
}

//QUICK NIMBLE
