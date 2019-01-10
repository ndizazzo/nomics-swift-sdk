//
//  APIConfig.swift
//  Nomics SDK
//
//  Created by Nick DiZazzo on 2019-01-09.
//  Copyright © 2019 NomicsSDK. All rights reserved.
//

import Foundation

public struct APIConfig {
    enum Environment {
        case production

        var host: String {
            switch self {
            case .production: return "api.nomics.com"
            }
        }
    }

    var environment: Environment
    var key: String

    init(with key: String, for environment: Environment) {
        self.key = key
        self.environment = environment
    }
}
