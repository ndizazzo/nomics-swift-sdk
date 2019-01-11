//
//  Market.swift
//  Nomics SDK
//
//  Created by Nick DiZazzo on 2019-01-10.
//  Copyright © 2019 NomicsSDK. All rights reserved.
//

import Foundation

public struct Market: NomicsResource {
    let exchange: String
    let market: String
    let base: String
    let quote: String
}
