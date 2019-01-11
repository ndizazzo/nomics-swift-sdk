//
//  MarketEndpoint.swift
//  Nomics SDK
//
//  Created by Nick DiZazzo on 2019-01-27.
//  Copyright © 2019 NomicsSDK. All rights reserved.
//

import Foundation

extension Endpoint {
    public enum Market: APIEndpoint {
        case dashboard
        case markets(String?, String?, String?)
        case marketPrices(String?)
        case marketCapHistory(String, String?)
        case marketInterval(String?, Int?, String?, String?)
        case exchangeMarketPrices(String?, String?)
        case exchangeMarketInterval(String, String?, String, String?)

        public var path: String {
            switch self {
            case .dashboard: return "dashboard"
            case .markets(_, _, _): return "markets"
            case .marketPrices(_): return "markets/prices"
            case .marketInterval(_, _, _, _): return "markets/interval"
            case .exchangeMarketPrices(_): return "exchange-markets/prices"
            case .exchangeMarketInterval(_, _, _, _): return "exchange-markets/interval"
            case .marketCapHistory(_, _): return "market-cap/history"
            }
        }

        public var params: [URLQueryItem] {
            switch self {
            case .markets(let exchange, let base, let quote):
                return ParameterBuilder()
                    .add("base", value: base)
                    .add("exchange", value: exchange)
                    .add("quote", value: quote)
            case .marketPrices(let currency):
                return ParameterBuilder()
                    .add("currency", value: currency)
            case .marketInterval(let currency, let hours, let start, let end):
                let hoursString = (hours != nil) ? String(hours!) : nil
                return ParameterBuilder()
                    .add("currency", value: currency)
                    .add("hours", value: hoursString)
                    .add("start", value: start)
                    .add("end", value: end)
            case .exchangeMarketPrices(let currency, let exchange):
                return ParameterBuilder()
                    .add("currency", value: currency)
                    .add("exchange", value: exchange)
            case .exchangeMarketInterval(let currency, let exchange, let start, let end):
                return ParameterBuilder()
                    .add("currency", value: currency)
                    .add("exchange", value: exchange)
                    .add("start", value: start)
                    .add("end", value: end)
            case .marketCapHistory(let start, let end):
                return ParameterBuilder()
                    .add("start", value: start)
                    .add("end", value: end)
            case .dashboard:
                return []
            }
        }

        public var version: Endpoint.Version {
            return .v1
        }
    }
}
