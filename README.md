# Nomics.com Swift SDK

[![Build](https://img.shields.io/bitrise/30597b457ab7bd4f/master.svg?token=3b4pL-WeARU9m5K2YEdX9A)](https://app.bitrise.io/app/30597b457ab7bd4f)
[![Version](https://img.shields.io/cocoapods/v/NomicsSDK.svg?style=flat)](http://cocoadocs.org/docsets/NomicsSDK)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/github/license/ndizazzo/nomics-swift-sdk.svg)](https://github.com/ndizazzo/nomics-swift-sdk/blob/master/LICENSE)
[![Platform](https://img.shields.io/cocoapods/p/NomicsSDK.svg)](http://cocoadocs.org/docsets/nomics-swift-sdk)
![Swift](https://img.shields.io/badge/%20in-swift%204.2-orange.svg)

## Table of Contents

* [Description](#description)
* [Key features](#key-features)
* [Usage](#usage)
* [Installation](#installation)
* [Author](#authors)
* [Contributing](#contributing)
* [License](#license)

## Description

**NomicsSDK** is a simple API interface for crypto projects using the [Nomics.com API](https://nomics.com) written in Swift. 

## Key features

- [x] Usable in iOS, tvOS, watchOS and macOS
- [x] Simple API interface through enumerations
- [x] Type-safe API parameters
- [X] Easily extensible
- [x] Unit test coverage & great documentation

## Usage

### General

Implementing and using the SDK is straightforward. To get started, simply include it by using your favourite package manager below. Or, you can install it manually.

```swift
import NomicsSDK
```

Then, create a `APIConfig` configuration object and instantiate the SDK with it:

```swift
let config = APIConfig(with: "2018-09-demo-dont-deploy-b69315e440beb145", for: .production)
let sdk = NomicsSDK(with: config)
```

After that, you can use request endpoints as you wish:
```swift
sdk.request(dataType: [Price].self, 
            endpoint: Endpoint.Currency.prices, 
            success: { data in
                // Data is an array of price objects
            }, error: { error in
                // Can be a decoding error, or a request error
            })
```

In order to make the generic request and decoding mechanism aware of what type of data will be passed into the callback, you need to provide the data type in the request method invocation. 


Generally, you'll only be concerned with two different types of calls:

```swift
[Price].self
``` 

and 

```swift
Price.self
```

The former is when you want the SDK to decode an array of `Price` objects, and the latter is a single object. You can know which to use by checking out the [endpoint documentation at nomics.com](https://docs.nomics.com) for detailed endpoint documentation.

## Installation

### Cocoapods

**NomicsSDK** is available through [CocoaPods](http://cocoapods.org). To install, simply add the following line to your Podfile:

```ruby
pod 'NomicsSDK'
```

### Carthage

**NomicsSDK** is also available through [Carthage](https://github.com/Carthage/Carthage).
To install, just write in your Cartfile:

```ruby
github "ndizazzo/nomics-swift-sdk"
```

### Swift Package Manager

**NomicsSDK** supports SPM! Add this line to your `Package.swift` file:

```swift
.Package(url: "https://github.com/ndizazzo/nomics-swift-sdk.git", from: "1.0.0")
```

## Authors

- [Nomics.com](https://nomics.com) provide the API this SDK interfaces with.
- The [TinyNetworking](https://talk.objc.io/episodes/S01E133-tiny-networking-library-revisited) class is inspired by the efforts of the team at [objc.io](https://www.objc.io). Please refer the source file for additional context, as well as check out their work!
- [Nick DiZazzo](https://nickdizazzo.com) made this with ❤️

## Contributing

If you'd like to contribute to this project, check the simple [CONTRIBUTING](https://github.com/ndizazzo/nomics-swift-sdk/blob/master/CONTRIBUTING.md) guidelines for more info.

## License

**NomicsSDK** is available under the MIT license. See the [LICENSE](https://github.com/ndizazzo/nomics-swift-sdk/blob/master/LICENSE.md) file for more info.
