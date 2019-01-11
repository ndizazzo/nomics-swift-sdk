//
//  VolumeEndpointTests.swift
//  Nomics SDK
//
//  Created by Nick DiZazzo on 2019-01-27.
//  Copyright © 2019 NomicsSDK. All rights reserved.
//

import XCTest
@testable import NomicsSDK

final class VolumeEndpointTests: XCTestCase {
    func testEndpointPathsAreCorrect() {
        XCTAssertEqual(Endpoint.Volume.globalVolumeHistory(nil, nil).path, "volume/history")
    }

    func testVersionReturnsCorrectValue() {
        XCTAssertEqual(Endpoint.Volume.globalVolumeHistory(nil, nil).version, .v1)
    }

    func testMarketsEndpointFormatsParamsCorrectly() {
        let full = Endpoint.Volume.globalVolumeHistory("first", "second")
        XCTAssertEqual(full.params.count, 2)
        XCTAssertEqual(full.params[0].name, "start")
        XCTAssertEqual(full.params[0].value, "first")
        XCTAssertEqual(full.params[1].name, "end")
        XCTAssertEqual(full.params[1].value, "second")

        let missingStart = Endpoint.Volume.globalVolumeHistory(nil, "second")
        XCTAssertEqual(missingStart.params.count, 1)
        XCTAssertEqual(missingStart.params[0].name, "end")
        XCTAssertEqual(missingStart.params[0].value, "second")

        let missingExchangeBase = Endpoint.Volume.globalVolumeHistory(nil, nil)
        XCTAssertEqual(missingExchangeBase.params.count, 0)
    }
}
