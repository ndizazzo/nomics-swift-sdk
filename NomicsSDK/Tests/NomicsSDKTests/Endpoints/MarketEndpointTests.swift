//
//  MarketEndpointTests.swift
//  Nomics SDK
//
//  Created by Nick DiZazzo on 2019-01-27.
//  Copyright © 2019 NomicsSDK. All rights reserved.
//

import XCTest
@testable import NomicsSDK

final class MarketEndpointTests: XCTestCase {
    func testEndpointPathsAreCorrect() {
        XCTAssertEqual(Endpoint.Market.dashboard.path, "dashboard")
        XCTAssertEqual(Endpoint.Market.markets(nil, nil, nil).path, "markets")
        XCTAssertEqual(Endpoint.Market.marketPrices(nil).path, "markets/prices")
        XCTAssertEqual(Endpoint.Market.marketInterval(nil, nil, nil, nil).path, "markets/interval")
        XCTAssertEqual(Endpoint.Market.exchangeMarketPrices("", "").path, "exchange-markets/prices")
        XCTAssertEqual(Endpoint.Market.exchangeMarketInterval("", nil, "", "").path, "exchange-markets/interval")
        XCTAssertEqual(Endpoint.Market.marketCapHistory("", nil).path, "market-cap/history")
    }

    func testVersionReturnsCorrectValue() {
        XCTAssertEqual(Endpoint.Market.dashboard.version, .v1)
        XCTAssertEqual(Endpoint.Market.markets(nil, nil, nil).version, .v1)
        XCTAssertEqual(Endpoint.Market.marketPrices(nil).version, .v1)
        XCTAssertEqual(Endpoint.Market.marketInterval(nil, nil, nil, nil).version, .v1)
        XCTAssertEqual(Endpoint.Market.exchangeMarketPrices("", "").version, .v1)
        XCTAssertEqual(Endpoint.Market.exchangeMarketInterval("", nil, "", "").version, .v1)
        XCTAssertEqual(Endpoint.Market.marketCapHistory("", nil).version, .v1)
    }

    func testDashboardEndpointFormatsParamsCorrectly() {
        let full = Endpoint.Market.dashboard
        XCTAssertEqual(full.params.count, 0)
    }

    func testMarketsEndpointFormatsParamsCorrectly() {
        let full = Endpoint.Market.markets("first", "second", "third")
        XCTAssertEqual(full.params.count, 3)

        let baseParam = full.params[0]
        let exchangeParam = full.params[1]
        let quoteParam = full.params[2]

        XCTAssertEqual(exchangeParam.name, "exchange")
        XCTAssertEqual(exchangeParam.value, "first")
        XCTAssertEqual(baseParam.name, "base")
        XCTAssertEqual(baseParam.value, "second")
        XCTAssertEqual(quoteParam.name, "quote")
        XCTAssertEqual(quoteParam.value, "third")

        let missingExchange = Endpoint.Market.markets(nil, "second", "third")
        XCTAssertEqual(missingExchange.params.count, 2)

        let missingExchangeBase = Endpoint.Market.markets(nil, nil, "third")
        XCTAssertEqual(missingExchangeBase.params.count, 1)

        let missingAllParams = Endpoint.Market.markets(nil, nil, nil)
        XCTAssertEqual(missingAllParams.params.count, 0)
    }

    func testMarketPricesEndpointFormatsParamsCorrectly() {
        let full = Endpoint.Market.marketPrices("first")
        XCTAssertEqual(full.params.count, 1)
        XCTAssertEqual(full.params[0].name, "currency")
        XCTAssertEqual(full.params[0].value, "first")

        let none = Endpoint.Market.marketPrices(nil)
        XCTAssertEqual(none.params.count, 0)
    }

    func testMarketIntervalEndpointFormatsParamsCorrectly() {
        let full = Endpoint.Market.marketInterval("first", 2, "third", "fourth")
        XCTAssertEqual(full.params.count, 4)
        XCTAssertEqual(full.params[0].name, "currency")
        XCTAssertEqual(full.params[0].value, "first")
        XCTAssertEqual(full.params[1].name, "hours")
        XCTAssertEqual(full.params[1].value, "2")
        XCTAssertEqual(full.params[2].name, "start")
        XCTAssertEqual(full.params[2].value, "third")
        XCTAssertEqual(full.params[3].name, "end")
        XCTAssertEqual(full.params[3].value, "fourth")

        let missingFirst = Endpoint.Market.marketInterval(nil, 2, "third", "fourth")
        XCTAssertEqual(missingFirst.params.count, 3)
        XCTAssertEqual(missingFirst.params[0].name, "hours")
        XCTAssertEqual(missingFirst.params[0].value, "2")
        XCTAssertEqual(missingFirst.params[1].name, "start")
        XCTAssertEqual(missingFirst.params[1].value, "third")
        XCTAssertEqual(missingFirst.params[2].name, "end")
        XCTAssertEqual(missingFirst.params[2].value, "fourth")

        let missingFirstSecond = Endpoint.Market.marketInterval(nil, nil, "third", "fourth")
        XCTAssertEqual(missingFirstSecond.params.count, 2)
        XCTAssertEqual(missingFirstSecond.params[0].name, "start")
        XCTAssertEqual(missingFirstSecond.params[0].value, "third")
        XCTAssertEqual(missingFirstSecond.params[1].name, "end")
        XCTAssertEqual(missingFirstSecond.params[1].value, "fourth")

        let missingThree = Endpoint.Market.marketInterval(nil, nil, nil, "fourth")
        XCTAssertEqual(missingThree.params.count, 1)
        XCTAssertEqual(missingThree.params[0].name, "end")
        XCTAssertEqual(missingThree.params[0].value, "fourth")

        let missingAll = Endpoint.Market.marketInterval(nil, nil, nil, nil)
        XCTAssertEqual(missingAll.params.count, 0)
    }

    func testMarketCapHistoryEndpointFormatsParamsCorrectly() {
        let full = Endpoint.Market.marketCapHistory("first", "second")
        XCTAssertEqual(full.params.count, 2)
        XCTAssertEqual(full.params[0].name, "start")
        XCTAssertEqual(full.params[0].value, "first")
        XCTAssertEqual(full.params[1].name, "end")
        XCTAssertEqual(full.params[1].value, "second")

        let missingEnd = Endpoint.Market.marketCapHistory("first", nil)
        XCTAssertEqual(missingEnd.params.count, 1)
        XCTAssertEqual(missingEnd.params[0].name, "start")
        XCTAssertEqual(missingEnd.params[0].value, "first")
    }

    func testExchangeMarketPricesEndpointFormatsParamsCorrectly() {
        let full = Endpoint.Market.exchangeMarketPrices("first", "second")
        XCTAssertEqual(full.params.count, 2)
        XCTAssertEqual(full.params[0].name, "currency")
        XCTAssertEqual(full.params[0].value, "first")
        XCTAssertEqual(full.params[1].name, "exchange")
        XCTAssertEqual(full.params[1].value, "second")

        let missingFirst = Endpoint.Market.exchangeMarketPrices(nil, "second")
        XCTAssertEqual(missingFirst.params.count, 1)
        XCTAssertEqual(missingFirst.params[0].name, "exchange")
        XCTAssertEqual(missingFirst.params[0].value, "second")

        let missingAll = Endpoint.Market.exchangeMarketPrices(nil, nil)
        XCTAssertEqual(missingAll.params.count, 0)
    }

    func testExchangeMarketIntervalEndpointFormatsParamsCorrectly() {
        let full = Endpoint.Market.exchangeMarketInterval("first", "second", "third", "fourth")
        XCTAssertEqual(full.params.count, 4)
        XCTAssertEqual(full.params[0].name, "currency")
        XCTAssertEqual(full.params[0].value, "first")
        XCTAssertEqual(full.params[1].name, "exchange")
        XCTAssertEqual(full.params[1].value, "second")
        XCTAssertEqual(full.params[2].name, "start")
        XCTAssertEqual(full.params[2].value, "third")
        XCTAssertEqual(full.params[3].name, "end")
        XCTAssertEqual(full.params[3].value, "fourth")

        let missingExchange = Endpoint.Market.marketInterval("first", nil, "third", "fourth")
        XCTAssertEqual(missingExchange.params.count, 3)
        XCTAssertEqual(missingExchange.params[0].name, "currency")
        XCTAssertEqual(missingExchange.params[0].value, "first")
        XCTAssertEqual(missingExchange.params[1].name, "start")
        XCTAssertEqual(missingExchange.params[1].value, "third")
        XCTAssertEqual(missingExchange.params[2].name, "end")
        XCTAssertEqual(missingExchange.params[2].value, "fourth")

        let missingExchangeEnd = Endpoint.Market.marketInterval("first", nil, "third", nil)
        XCTAssertEqual(missingExchangeEnd.params.count, 2)
        XCTAssertEqual(missingExchangeEnd.params[0].name, "currency")
        XCTAssertEqual(missingExchangeEnd.params[0].value, "first")
        XCTAssertEqual(missingExchangeEnd.params[1].name, "start")
        XCTAssertEqual(missingExchangeEnd.params[1].value, "third")
    }
}
