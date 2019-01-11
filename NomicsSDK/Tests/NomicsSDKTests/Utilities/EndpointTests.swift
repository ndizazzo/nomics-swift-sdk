//
//  EndpointTests.swift
//  Nomics SDK
//
//  Created by Nick DiZazzo on 2019-01-14.
//  Copyright © 2019 NomicsSDK. All rights reserved.
//

import XCTest
@testable import NomicsSDK

final class EndpointTests: XCTestCase {
    func testEndpointConstructsPathStringCorrectly() {
        let config = APIConfig(with: "test", for: .production)
        let endpoint = Endpoint(config: config, endpoint: Endpoint.Currency.prices)
        XCTAssertEqual(endpoint?._orig.pathString, "/v1/prices")
    }
}

final class ParameterBuilderTests: XCTestCase {
    func testParameterBuilderStartsWithEmptyArray() {
        XCTAssertEqual(ParameterBuilder().items.count, 0)
    }

    func testParameterBuilderAddsItem() {
        let builder = ParameterBuilder()
        _ = builder.add("test", value: "first")

        XCTAssertEqual(builder.items.count, 1)
        XCTAssertEqual(builder.items[0], URLQueryItem(name: "test", value: "first"))
    }
}
