//
//  ExchangeMarketPrice.swift
//  Nomics SDK
//
//  Created by Nick DiZazzo on 2019-01-10.
//  Copyright © 2019 NomicsSDK. All rights reserved.
//

import Foundation

struct ExchangeMarketPrice: NomicsResource {
    let exchange: String
    let base: String
    let quote: String
    let priceQuote: String
    let timestamp: String
}
