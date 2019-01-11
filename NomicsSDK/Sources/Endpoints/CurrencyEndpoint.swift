//
//  CurrencyEndpoint.swift
//  Nomics SDK
//
//  Created by Nick DiZazzo on 2019-01-27.
//  Copyright © 2019 NomicsSDK. All rights reserved.
//

import Foundation

extension Endpoint {
    public enum Currency: APIEndpoint {
        case prices
        case currencies
        case currenciesInterval(String, String?)
        case currenciesSparkline(String, String?)
        case suppliesInterval(String, String?)
        case allTimeHighs
        
        public var path: String {
            switch self {
            case .prices: return "prices"
            case .currencies: return "currencies"
            case .allTimeHighs: return "currencies/highs"
            case .currenciesInterval(_, _): return "currencies/interval"
            case .currenciesSparkline(_, _): return "currencies/sparkline"
            case .suppliesInterval(_, _): return "supplies/interval"
            }
        }
        
        public var params: [URLQueryItem] {
            switch self {
            case .currenciesInterval(let start, let end),
                 .currenciesSparkline(let start, let end),
                 .suppliesInterval(let start, let end):
                return ParameterBuilder()
                    .add("start", value: start)
                    .add("end", value: end)
            default:
                return []
            }
        }
        
        public var version: Endpoint.Version {
            return .v1
        }
    }
}
