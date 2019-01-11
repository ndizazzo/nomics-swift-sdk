//
//  ExchangeRateInterval.swift
//  Nomics SDK
//
//  Created by Nick DiZazzo on 2019-01-09.
//  Copyright © 2019 NomicsSDK. All rights reserved.
//

import Foundation

public struct ExchangeRateInterval: NomicsResource {
    let currency: String
    let open: String
    let openTimestamp: String
    let close: String
    let closeTimestamp: String
}
