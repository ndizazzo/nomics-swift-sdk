//
//  Endpoints.swift
//  Nomics SDK
//
//  Created by Nick DiZazzo on 2019-01-09.
//  Copyright © 2019 NomicsSDK. All rights reserved.
//

import Foundation

public protocol APIEndpoint {
    var pathString: String { get }
    var path: String { get }
    var version: Endpoint.Version { get }
    var params: [URLQueryItem] { get }
}

extension APIEndpoint {
    public var pathString: String {
        return "\(version.rawValue)\(path)"
    }
}

public struct Endpoint {
    let url: URL

    init?(config: APIConfig, endpoint: APIEndpoint) {
        var params = endpoint.params
        params.append(URLQueryItem(name: "key", value: config.key))

        var components = URLComponents()
        components.scheme = "https"
        components.host = config.environment.host
        components.path = endpoint.pathString
        components.queryItems = params

        url = components.url!
    }
}

extension Endpoint {
    public enum Version: String {
        case v1
    }

    public enum ExchangeRate: APIEndpoint {
        case exchangeRates
        case exchangeRatesHistory(String, String, String?)
        case exchangeRatesInterval(String, String?)

        public var path: String {
            return ""
        }

        public var params: [URLQueryItem] {
            return []
        }

        public var version: Endpoint.Version {
            return .v1
        }
    }

    public enum Currency: APIEndpoint {
        case prices
        case currencies
        case currenciesInterval(String, String?)
        case currenciesSparkline(String, String?)
        case suppliesInterval(String, String?)
        case allTimeHighs

        public var path: String {
            switch self {
            case .prices: return "/prices"
            case .currencies: return "/currencies"
            case .allTimeHighs: return "/currencies/highs"
            case .currenciesInterval(_, _): return "/currencies/interval"
            case .currenciesSparkline(_, _): return "/currencies/sparkline"
            case .suppliesInterval(_, _): return "/supplies/interval"
            }
        }

        public var params: [URLQueryItem] {
            switch self {
            case .currenciesInterval(let start, let end),
                 .currenciesSparkline(let start, let end),
                 .suppliesInterval(let start, let end):
                return [
                    URLQueryItem(name: "start", value: start),
                    URLQueryItem(name: "end", value: end)
                ]
            default:
                return []
            }
        }

        public var version: Endpoint.Version {
            return .v1
        }
    }

    public enum Market: APIEndpoint {
        case markets(String?, String?, String?)
        case exchangeMarketPrices(String)
        case exchangeMarketInterval(String, String?)
        case marketCapHistory(String, String?)
        case marketInterval(String, Int?, String?, String?)
        case marketPrices(String)
        case dashboard

        public var path: String {
            return ""
        }

        public var params: [URLQueryItem] {
            return []
        }

        public var version: Endpoint.Version {
            return .v1
        }
    }

    public enum Candle: APIEndpoint {
        case aggregatedOHLCVCandles(CandleInterval, String, String, String)
        case exchangeOHLCVCandles(CandleInterval, String, String, String?, String?)

        public var path: String {
            return ""
        }

        public var params: [URLQueryItem] {
            return []
        }

        public var version: Endpoint.Version {
            return .v1
        }
    }

    public enum Volume: APIEndpoint {
        case globalVolumeHistory(String, String)

        public var path: String {
            return ""
        }

        public var params: [URLQueryItem] {
            return []
        }

        public var version: Endpoint.Version {
            return .v1
        }
    }
}
