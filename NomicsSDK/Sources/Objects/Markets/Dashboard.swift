//
//  Dashboard.swift
//  Nomics SDK
//
//  Created by Nick DiZazzo on 2019-01-11.
//  Copyright © 2019 NomicsSDK. All rights reserved.
//

import Foundation

public struct Dashboard: NomicsResource {
    let currency: String
    let dayOpen: String
    let dayVolume: String
    let dayOpenVolume: String?

    let weekOpen: String
    let weekVolume: String
    let weekOpenVolume: String?

    let monthOpen: String
    let monthVolume: String
    let monthOpenVolume: String?

    let yearOpen: String
    let yearVolume: String
    let yearOpenVolume: String?

    let close: String
    let high: String?
    let highTimestamp: String?
    let highExchange: String?
    let highQuoteCurrency: String?

    let availableSupply: String?
    let maxSupply: String?
}
