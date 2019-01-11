//
//  NomicsSDK.swift
//  NomicsSDK
//
//  Created by Nick DiZazzo on 2019-01-09.
//  Copyright © 2019 NomicsSDK. All rights reserved.
//

import Foundation

public protocol NomicsResource: Codable { }
extension Array: NomicsResource where Element: NomicsResource { }

extension NomicsSDK {
    enum Errors: Error {
        case invalidEndpoint
        case dataDecodingError
    }
}

public final class NomicsSDK {
    let config: APIConfig
    let urlSession: URLSession

    public init(with config: APIConfig, session: URLSession? = nil) {
        self.config = config
        self.urlSession = session ?? URLSession.shared
    }

    public func request<DataType: NomicsResource>(dataType: DataType.Type,
                                  endpoint: APIEndpoint,
                                  success: @escaping (DataType) -> Void,
                                  error: ((Error) -> Void)? = nil) {
        let controller = DataController<DataType>()

        let _ = try? controller.request(endpoint,
                                        config: config,
                                        session: urlSession,
                                        successCompletion: success,
                                        errorCompletion: error)
    }
}
