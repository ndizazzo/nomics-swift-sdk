//
//  ExchangeRateEndpointTests.swift
//  Nomics SDK
//
//  Created by Nick DiZazzo on 2019-01-27.
//  Copyright © 2019 NomicsSDK. All rights reserved.
//

import XCTest
@testable import NomicsSDK

final class ExchangeRateEndpointTests: XCTestCase {
    func testEndpointPathsAreCorrect() {
        XCTAssertEqual(Endpoint.ExchangeRate.exchangeRates.path, "exchange-rates")
        XCTAssertEqual(Endpoint.ExchangeRate.exchangeRatesHistory("", "", nil).path, "exchange-rates/history")
        XCTAssertEqual(Endpoint.ExchangeRate.exchangeRatesInterval("", nil).path, "exchange-rates/interval")
    }

    func testVersionReturnsCorrectValue() {
        XCTAssertEqual(Endpoint.ExchangeRate.exchangeRates.version, .v1)
        XCTAssertEqual(Endpoint.ExchangeRate.exchangeRatesHistory("", "", nil).version, .v1)
        XCTAssertEqual(Endpoint.ExchangeRate.exchangeRatesInterval("", nil).version, .v1)
    }

    func testExchangeRatesEndpointFormatsParamsCorrectly() {
        let full = Endpoint.ExchangeRate.exchangeRates
        XCTAssertEqual(full.params.count, 0)
    }

    func testExchangeRatesHistoryFormatsParamsCorrectly() {
        let full = Endpoint.ExchangeRate.exchangeRatesHistory("first", "second", "third")
        XCTAssertEqual(full.params.count, 3)
        XCTAssertEqual(full.params[0].name, "currency")
        XCTAssertEqual(full.params[0].value, "first")
        XCTAssertEqual(full.params[1].name, "start")
        XCTAssertEqual(full.params[1].value, "second")
        XCTAssertEqual(full.params[2].name, "end")
        XCTAssertEqual(full.params[2].value, "third")

        let missingEnd = Endpoint.ExchangeRate.exchangeRatesHistory("first", "second", nil)
        XCTAssertEqual(missingEnd.params.count, 2)
        XCTAssertEqual(missingEnd.params[0].name, "currency")
        XCTAssertEqual(missingEnd.params[0].value, "first")
        XCTAssertEqual(missingEnd.params[1].name, "start")
        XCTAssertEqual(missingEnd.params[1].value, "second")
    }

    func testMarketRatesIntervalEndpointFormatsParamsCorrectly() {
        let full = Endpoint.ExchangeRate.exchangeRatesInterval("first", "second")
        XCTAssertEqual(full.params.count, 2)
        XCTAssertEqual(full.params[0].name, "start")
        XCTAssertEqual(full.params[0].value, "first")
        XCTAssertEqual(full.params[1].name, "end")
        XCTAssertEqual(full.params[1].value, "second")

        let missingEnd = Endpoint.ExchangeRate.exchangeRatesInterval("first", nil)
        XCTAssertEqual(missingEnd.params.count, 1)
        XCTAssertEqual(missingEnd.params[0].name, "start")
        XCTAssertEqual(missingEnd.params[0].value, "first")
    }
}
