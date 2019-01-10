//
//  MarketPrice.swift
//  Nomics SDK
//
//  Created by Nick DiZazzo on 2019-01-10.
//  Copyright © 2019 NomicsSDK. All rights reserved.
//

import Foundation

struct MarketPrice: Decodable {
    let exchange: String
    let quote: String
    let price: String
    let timestamp: String
}
