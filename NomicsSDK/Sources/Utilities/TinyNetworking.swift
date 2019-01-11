//
//  TinyNetworking.swift
//  Nomics SDK
//
//  Created by objc.io on 2019-01-11.
//  Original: https://talk.objc.io/episodes/S01E133-tiny-networking-library-revisited

import Foundation

enum HttpMethod<Body> {
    case get
    case post(Body)
}

extension HttpMethod {
    var method: String {
        switch self {
        case .get: return "GET"
        case .post: return "POST"
        }
    }
}

struct Resource<DataType> {
    var urlRequest: URLRequest
    let parse: (Data) -> DataType?
}

extension Resource {
    func map<ResultType>(_ transform: @escaping (DataType) -> ResultType) -> Resource<ResultType> {
        return Resource<ResultType>(urlRequest: urlRequest) { self.parse($0).map(transform) }
    }
}

extension Resource where DataType: NomicsResource {
    init(get endpoint: Endpoint) {
        self.urlRequest = URLRequest(url: endpoint.url)
        self.parse = { data in
            Coders.shared.decoder.keyDecodingStrategy = .convertFromSnakeCase
            if let result = try? Coders.shared.decoder.decode(DataType.self, from: data) {
                return result
            }

            Coders.shared.decoder.keyDecodingStrategy = .useDefaultKeys
            return try? Coders.shared.decoder.decode(DataType.self, from: data)
        }
    }

    init<Body: Encodable>(endpoint: Endpoint, method: HttpMethod<Body>) {
        urlRequest = URLRequest(url: endpoint.url)
        urlRequest.httpMethod = method.method
        switch method {
        case .get:
            break
        case .post(let body):
            self.urlRequest.httpBody = try? Coders.shared.encoder.encode(body)
        }

        self.parse = { data in
            try? Coders.shared.decoder.decode(DataType.self, from: data)
        }
    }
}

extension URLSession {
    func load<DataType>(_ resource: Resource<DataType>, completion: @escaping (DataType?, Error?) -> ()) {
        dataTask(with: resource.urlRequest) { data, _, error in
            completion(data.flatMap(resource.parse), error)
        }.resume()
    }
}

final class Coders {
    static let shared = Coders()

    let decoder = JSONDecoder()
    let encoder = JSONEncoder()

    private init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        encoder.keyEncodingStrategy = .convertToSnakeCase
    }
}
