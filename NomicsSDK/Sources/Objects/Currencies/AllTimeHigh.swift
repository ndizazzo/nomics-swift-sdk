//
//  AllTimeHigh.swift
//  Nomics SDK
//
//  Created by Nick DiZazzo on 2019-01-10.
//  Copyright © 2019 NomicsSDK. All rights reserved.
//

import Foundation

public struct AllTimeHigh: NomicsResource {
    let currency: String
    let price: String
    let timestamp: String
    let exchange: String
    let quote: String
}
