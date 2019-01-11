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
        return "/\(version.rawValue)/\(path)"
    }
}

public struct Endpoint {
    let url: URL
    let _orig: APIEndpoint

    public init?(config: APIConfig, endpoint: APIEndpoint) {
        _orig = endpoint
        
        var params = endpoint.params
        params.append(URLQueryItem(name: "key", value: config.key))

        var components = URLComponents()
        components.scheme = "https"
        components.host = config.environment.host
        components.path = endpoint.pathString
        components.queryItems = params

        guard let url = components.url else { return nil }

        self.url = url
    }

    public enum Version: String {
        case v1
    }
}

final class ParameterBuilder {
    var items: [URLQueryItem] = []

    init(existingItems: [URLQueryItem] = []) {
        items.append(contentsOf: existingItems)
    }

    func add(_ param: String, value: String?) -> [URLQueryItem] {
        items = items.add(param, value: value)
        return items
    }
}

extension Array where Element == URLQueryItem {
    func add(_ param: String, value: String?) -> [Element] {
        var newItems = self

        guard let item = value else { return self }
        newItems.append(URLQueryItem(name: param, value: item))

        return newItems
    }
}
