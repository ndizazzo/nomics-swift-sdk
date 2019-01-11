//
//  APIConfigTests.swift
//  Nomics SDK Tests
//
//  Created by Nick DiZazzo on 2019-01-14.
//  Copyright © 2019 NomicsSDK. All rights reserved.
//

import XCTest
@testable import NomicsSDK

final class APIConfigTests: XCTestCase {
    func testAPIConfigHostReturnsCorrectValue() {
        XCTAssertEqual(APIConfig.Environment.production.host, "api.nomics.com")
        XCTAssertEqual(APIConfig.Environment.custom("myhost.com").host, "myhost.com")
    }
}
