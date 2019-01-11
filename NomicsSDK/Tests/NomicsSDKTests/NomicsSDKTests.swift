//
//  NomicsSDKTests.swift
//  Nomics SDK Tests
//
//  Created by Nick DiZazzo on 2019-01-27.
//  Copyright © 2019 NomicsSDK. All rights reserved.
//

import XCTest
@testable import NomicsSDK

final class NomicsSDKTests: XCTestCase {
    func testSDKCanBeInitialized() {
        let config = APIConfig(with: "test", for: .production)
        let customSession = URLSession(configuration: URLSessionConfiguration.ephemeral)
        let sdk = NomicsSDK(with: config, session: customSession)

        XCTAssertEqual(sdk.config, config)
        XCTAssertEqual(sdk.urlSession, customSession)
    }
}
