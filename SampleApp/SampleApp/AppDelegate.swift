//
//  AppDelegate.swift
//  SampleApp
//
//  Created by Nick DiZazzo on 2019-01-10.
//  Copyright © 2019 Nick DiZazzo. All rights reserved.
//

import UIKit
import NomicsSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let sdk = NomicsSDK(with: APIConfig(with: "2018-09-demo-dont-deploy-b69315e440beb145", for: .production))

    func applicationDidBecomeActive(_ application: UIApplication) {
        sdk.request(dataType: [Price].self, endpoint: Endpoint.Currency.prices, success: { data in
            print(data)
        }, error: { error in
            print(error)
        })

        sdk.request(dataType: [Currency].self, endpoint: Endpoint.Currency.currencies, success: { data in
            print(data)
        }, error: { error in
            print(error)
        })

        sdk.request(dataType: [Dashboard].self, endpoint: Endpoint.Market.dashboard, success: { data in
            print(data)
        }, error: { error in
            print(error)
        })
    }
}
