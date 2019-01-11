//
//  CandleEndpoint.swift
//  Nomics SDK
//
//  Created by Nick DiZazzo on 2019-01-27.
//  Copyright © 2019 NomicsSDK. All rights reserved.
//

import Foundation

extension Endpoint {
    public enum Candle: APIEndpoint {
        case aggregatedOHLCVCandles(CandleInterval, String, String, String)
        case exchangeOHLCVCandles(CandleInterval, String, String, String?, String?)

        public var path: String {
            switch self {
            case .aggregatedOHLCVCandles(_, _, _, _): return "candles"
            case .exchangeOHLCVCandles(_, _, _, _, _): return "exchange_candles"
            }
        }

        public var params: [URLQueryItem] {
            switch self {
            case .aggregatedOHLCVCandles(let interval, let currency, let start, let end):
                return ParameterBuilder()
                    .add("interval", value: interval.code)
                    .add("currency", value: currency)
                    .add("start", value: start)
                    .add("end", value: end)
            case .exchangeOHLCVCandles(let interval, let exchange, let market, let start, let end):
                return ParameterBuilder()
                    .add("interval", value: interval.code)
                    .add("exchange", value: exchange)
                    .add("market", value: market)
                    .add("start", value: start)
                    .add("end", value: end)
            }
        }

        public var version: Endpoint.Version {
            return .v1
        }
    }
}
