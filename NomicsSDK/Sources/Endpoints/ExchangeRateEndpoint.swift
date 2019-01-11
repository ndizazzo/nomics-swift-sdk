//
//  ExchangeRateEndpoint.swift
//  Nomics SDK
//
//  Created by Nick DiZazzo on 2019-01-27.
//  Copyright © 2019 NomicsSDK. All rights reserved.
//

import Foundation

extension Endpoint {
    public enum ExchangeRate: APIEndpoint {
        case exchangeRates
        case exchangeRatesHistory(String, String, String?)
        case exchangeRatesInterval(String, String?)
        
        public var path: String {
            switch self {
            case .exchangeRates: return "exchange-rates"
            case .exchangeRatesHistory: return "exchange-rates/history"
            case .exchangeRatesInterval: return "exchange-rates/interval"
            }
        }
        
        public var params: [URLQueryItem] {
            switch self {
            case .exchangeRatesHistory(let currency, let start, let end):
                return ParameterBuilder()
                    .add("currency", value: currency)
                    .add("start", value: start)
                    .add("end", value: end)
            case .exchangeRatesInterval(let start, let end):
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
