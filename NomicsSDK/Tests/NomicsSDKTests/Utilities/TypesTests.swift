//
//  TypesTests.swift
//  Nomics SDK Tests
//
//  Created by Nick DiZazzo on 2019-01-27.
//  Copyright © 2019 NomicsSDK. All rights reserved.
//

import XCTest
@testable import NomicsSDK

import XCTest

final class TypesTests: XCTestCase {
    func testCandleIntervalTitleReturnsCorrectValue() {
        XCTAssertEqual(CandleInterval.oneDay.title, "Inception")
        XCTAssertEqual(CandleInterval.fourHour.title, "120 days")
        XCTAssertEqual(CandleInterval.oneHour.title, "30 days")
        XCTAssertEqual(CandleInterval.halfHour.title, "14 days")
        XCTAssertEqual(CandleInterval.fiveMin.title, "3 days")
        XCTAssertEqual(CandleInterval.oneMin.title, "24 hours")
    }

    func testCandleIntervalCodeReturnsCorrectValue() {
        XCTAssertEqual(CandleInterval.oneDay.code, "1d")
        XCTAssertEqual(CandleInterval.fourHour.code, "4h")
        XCTAssertEqual(CandleInterval.oneHour.code, "1h")
        XCTAssertEqual(CandleInterval.halfHour.code, "30m")
        XCTAssertEqual(CandleInterval.fiveMin.code, "5m")
        XCTAssertEqual(CandleInterval.oneMin.code, "1m")
    }
}
