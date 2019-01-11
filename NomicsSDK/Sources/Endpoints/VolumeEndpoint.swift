//
//  VolumeEndpoint.swift
//  Nomics SDK
//
//  Created by Nick DiZazzo on 2019-01-27.
//  Copyright © 2019 NomicsSDK. All rights reserved.
//

import Foundation

extension Endpoint {
    public enum Volume: APIEndpoint {
        case globalVolumeHistory(String?, String?)
        
        public var path: String {
            return "volume/history"
        }
        
        public var params: [URLQueryItem] {
            switch self {
            case .globalVolumeHistory(let start, let end):
                return ParameterBuilder()
                    .add("start", value: start)
                    .add("end", value: end)
            }
        }
        
        public var version: Endpoint.Version {
            return .v1
        }
    }
}
