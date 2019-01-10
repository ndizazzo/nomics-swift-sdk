//
//  Types.swift
//  Nomics SDK
//
//  Created by Nick DiZazzo on 2019-01-09.
//  Copyright © 2019 NomicsSDK. All rights reserved.
//

import Foundation

public enum CandleInterval {
    case oneDay
    case fourHour
    case oneHour
    case halfHour
    case fiveMin
    case oneMin

    var title: String {
        switch self {
        case .oneDay: return "Inception"
        case .fourHour: return "120 days"
        case .oneHour: return "30 days"
        case .halfHour: return "14 days"
        case .fiveMin: return "3 days"
        case .oneMin: return "24 hours"
        }
    }

    var code: String {
        switch self {
        case .oneDay: return "1d"
        case .fourHour: return "4h"
        case .oneHour: return "1h"
        case .halfHour: return "30m"
        case .fiveMin: return "5m"
        case .oneMin: return "1m"
        }
    }
}
