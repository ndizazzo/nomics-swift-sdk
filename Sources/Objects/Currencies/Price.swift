//
//  Price.swift
//  Nomics SDK
//
//  Created by Nick DiZazzo on 2019-01-09.
//  Copyright © 2019 NomicsSDK. All rights reserved.
//

import Foundation

public struct Price: Decodable {
    let currency: String
    let price: String
}
