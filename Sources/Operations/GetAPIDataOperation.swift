//
//  GetAPIDataOperation.swift
//  Nomics SDK
//
//  Created by Nick DiZazzo on 2019-01-09.
//  Copyright © 2019 NomicsSDK. All rights reserved.
//

import Foundation

final class GetAPIDataOperation: AsyncOperation {
    let endpoint: Endpoint

    init(with endpoint: Endpoint) {
        self.endpoint = endpoint
    }

    override func main() {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)

        var request = URLRequest(url: endpoint.url)
        request.httpMethod = "GET"

        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if let error = error {
                print("URL Session Task Failed: %@", error.localizedDescription);
            }
            else {
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
            }
        })

        task.resume()
        session.finishTasksAndInvalidate()
    }
}
