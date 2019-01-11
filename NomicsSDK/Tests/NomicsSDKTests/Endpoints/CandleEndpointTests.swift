//
//  CandleEndpointTests.swift
//  Nomics SDK
//
//  Created by Nick DiZazzo on 2019-01-27.
//  Copyright © 2019 NomicsSDK. All rights reserved.
//

import XCTest
@testable import NomicsSDK

final class CandleEndpointTests: XCTestCase {
    func testEndpointPathsAreCorrect() {
        XCTAssertEqual(Endpoint.Candle.aggregatedOHLCVCandles(.fiveMin, "", "", "").path, "candles")
        XCTAssertEqual(Endpoint.Candle.exchangeOHLCVCandles(.fiveMin, "", "", nil, nil).path, "exchange_candles")
    }

    func testVersionReturnsCorrectValue() {
        XCTAssertEqual(Endpoint.Candle.aggregatedOHLCVCandles(.fiveMin, "", "", "").version, .v1)
        XCTAssertEqual(Endpoint.Candle.exchangeOHLCVCandles(.fiveMin, "", "", nil, nil).version, .v1)
    }

    func testAggregatedCandlesEndpointFormatsParamsCorrectly() {
        let full = Endpoint.Candle.aggregatedOHLCVCandles(.fiveMin, "second", "third", "fourth")
        XCTAssertEqual(full.params.count, 4)
        XCTAssertEqual(full.params[0].name, "interval")
        XCTAssertEqual(full.params[0].value, "5m")
        XCTAssertEqual(full.params[1].name, "currency")
        XCTAssertEqual(full.params[1].value, "second")
        XCTAssertEqual(full.params[2].name, "start")
        XCTAssertEqual(full.params[2].value, "third")
        XCTAssertEqual(full.params[3].name, "end")
        XCTAssertEqual(full.params[3].value, "fourth")
    }

    func testExchangeCandlesFormatsParamsCorrectly() {
        let full = Endpoint.Candle.exchangeOHLCVCandles(.fiveMin, "second", "third", "fourth", "fifth")
        XCTAssertEqual(full.params.count, 5)
        XCTAssertEqual(full.params[0].name, "interval")
        XCTAssertEqual(full.params[0].value, "5m")
        XCTAssertEqual(full.params[1].name, "exchange")
        XCTAssertEqual(full.params[1].value, "second")
        XCTAssertEqual(full.params[2].name, "market")
        XCTAssertEqual(full.params[2].value, "third")
        XCTAssertEqual(full.params[3].name, "start")
        XCTAssertEqual(full.params[3].value, "fourth")
        XCTAssertEqual(full.params[4].name, "end")
        XCTAssertEqual(full.params[4].value, "fifth")

        let missingStartEnd = Endpoint.Candle.exchangeOHLCVCandles(.fiveMin, "second", "third", nil, nil)
        XCTAssertEqual(missingStartEnd.params.count, 3)
        XCTAssertEqual(missingStartEnd.params[0].name, "interval")
        XCTAssertEqual(missingStartEnd.params[0].value, "5m")
        XCTAssertEqual(missingStartEnd.params[1].name, "exchange")
        XCTAssertEqual(missingStartEnd.params[1].value, "second")
        XCTAssertEqual(missingStartEnd.params[2].name, "market")
        XCTAssertEqual(missingStartEnd.params[2].value, "third")
    }
}
