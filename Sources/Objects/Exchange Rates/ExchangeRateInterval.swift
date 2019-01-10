//
//  ExchangeRateInterval.swift
//  Nomics SDK
//
//  Created by Nick DiZazzo on 2019-01-09.
//  Copyright © 2019 NomicsSDK. All rights reserved.
//

import Foundation

struct ExchangeRateInterval: Decodable {
    let currency: String
    let open: String
    let openTimestamp: String
    let close: String
    let closeTimestamp: String
}
