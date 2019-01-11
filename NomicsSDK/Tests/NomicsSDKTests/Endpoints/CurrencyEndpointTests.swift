//
//  CurrencyEndpointTests.swift
//  Nomics SDK
//
//  Created by Nick DiZazzo on 2019-01-27.
//  Copyright © 2019 NomicsSDK. All rights reserved.
//

import XCTest
@testable import NomicsSDK

final class CurrencyEndpointTests: XCTestCase {
    func testEndpointPathsAreCorrect() {
        XCTAssertEqual(Endpoint.Currency.prices.path, "prices")
        XCTAssertEqual(Endpoint.Currency.currencies.path, "currencies")
        XCTAssertEqual(Endpoint.Currency.currenciesInterval("", nil).path, "currencies/interval")
        XCTAssertEqual(Endpoint.Currency.currenciesSparkline("", nil).path, "currencies/sparkline")
        XCTAssertEqual(Endpoint.Currency.suppliesInterval("", nil).path, "supplies/interval")
        XCTAssertEqual(Endpoint.Currency.allTimeHighs.path, "currencies/highs")
    }

    func testVersionReturnsCorrectValue() {
        XCTAssertEqual(Endpoint.Currency.prices.version, .v1)
        XCTAssertEqual(Endpoint.Currency.currencies.version, .v1)
        XCTAssertEqual(Endpoint.Currency.currenciesInterval("", nil).version, .v1)
        XCTAssertEqual(Endpoint.Currency.currenciesSparkline("", nil).version, .v1)
        XCTAssertEqual(Endpoint.Currency.suppliesInterval("", nil).version, .v1)
        XCTAssertEqual(Endpoint.Currency.allTimeHighs.version, .v1)
    }

    func testPricesEndpointFormatsParamsCorrectly() {
        let full = Endpoint.Currency.prices
        XCTAssertEqual(full.params.count, 0)
    }

    func testCurrenciesEndpointFormatsParamsCorrectly() {
        let full = Endpoint.Currency.currencies
        XCTAssertEqual(full.params.count, 0)
    }

    func testCurrenciesIntervalEndpointFormatsParamsCorrectly() {
        let full = Endpoint.Currency.currenciesInterval("first", "second")
        XCTAssertEqual(full.params.count, 2)
        XCTAssertEqual(full.params[0].name, "start")
        XCTAssertEqual(full.params[0].value, "first")
        XCTAssertEqual(full.params[1].name, "end")
        XCTAssertEqual(full.params[1].value, "second")

        let missingEnd = Endpoint.Currency.currenciesInterval("first", nil)
        XCTAssertEqual(missingEnd.params.count, 1)
        XCTAssertEqual(missingEnd.params[0].name, "start")
        XCTAssertEqual(missingEnd.params[0].value, "first")
    }

    func testCurrenciesSparklineEndpointFormatsParamsCorrectly() {
        let full = Endpoint.Currency.currenciesSparkline("first", "second")
        XCTAssertEqual(full.params.count, 2)
        XCTAssertEqual(full.params[0].name, "start")
        XCTAssertEqual(full.params[0].value, "first")
        XCTAssertEqual(full.params[1].name, "end")
        XCTAssertEqual(full.params[1].value, "second")

        let missingEnd = Endpoint.Currency.currenciesSparkline("first", nil)
        XCTAssertEqual(missingEnd.params.count, 1)
        XCTAssertEqual(missingEnd.params[0].name, "start")
        XCTAssertEqual(missingEnd.params[0].value, "first")
    }

    func testSuppliesIntervalEndpointFormatsParamsCorrectly() {
        let full = Endpoint.Currency.suppliesInterval("first", "second")
        XCTAssertEqual(full.params.count, 2)
        XCTAssertEqual(full.params[0].name, "start")
        XCTAssertEqual(full.params[0].value, "first")
        XCTAssertEqual(full.params[1].name, "end")
        XCTAssertEqual(full.params[1].value, "second")

        let missingEnd = Endpoint.Currency.suppliesInterval("first", nil)
        XCTAssertEqual(missingEnd.params.count, 1)
        XCTAssertEqual(missingEnd.params[0].name, "start")
        XCTAssertEqual(missingEnd.params[0].value, "first")
    }

    func testAllTimeHighsEndpointFormatsParamsCorrectly() {
        let full = Endpoint.Currency.allTimeHighs
        XCTAssertEqual(full.params.count, 0)
    }
}
