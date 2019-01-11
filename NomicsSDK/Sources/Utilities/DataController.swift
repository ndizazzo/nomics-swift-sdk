//
//  DataController.swift
//  Nomics SDK
//
//  Created by Nick DiZazzo on 2019-01-11.
//  Copyright © 2019 NomicsSDK. All rights reserved.
//

import Foundation

final class DataController<DataType: NomicsResource> {
    @discardableResult
    public func request(_ endpoint: APIEndpoint,
                        config: APIConfig,
                        session: URLSession,
                        successCompletion: @escaping (DataType) -> Void,
                        errorCompletion: ((Error) -> Void)?) throws -> DataType? {
        guard let epObject = Endpoint(config: config, endpoint: endpoint) else {
            throw NomicsSDK.Errors.invalidEndpoint
        }

        let resource = Resource<DataType>(get: epObject)

        session.load(resource) { data, error in
            if let data = data {
                successCompletion(data)
            } else if let error = error {
                errorCompletion?(error)
            } else {
                errorCompletion?(NomicsSDK.Errors.dataDecodingError)
            }
        }

        return nil
    }
}
