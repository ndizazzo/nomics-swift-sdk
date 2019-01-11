//
//  APIConfig.swift
//  Nomics SDK
//
//  Created by Nick DiZazzo on 2019-01-09.
//  Copyright © 2019 NomicsSDK. All rights reserved.
//

import Foundation

public struct APIConfig: Equatable {
    public enum Environment {
        case production
        case custom(String)

        var host: String {
            switch self {
            case .production: return "api.nomics.com"
            case .custom(let host): return host
            }
        }
    }

    var environment: Environment
    var key: String

    public init(with key: String, for environment: Environment) {
        self.key = key
        self.environment = environment
    }

    public static func == (lhs: APIConfig, rhs: APIConfig) -> Bool {
        return lhs.environment.host == rhs.environment.host && lhs.key == rhs.key
    }
}
