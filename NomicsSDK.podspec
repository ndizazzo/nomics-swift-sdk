Pod::Spec.new do |s|
  s.name         = "NomicsSDK"
  s.version      = "1.0"
  s.summary      = "Swift SDK for the Nomics.com API"
  s.description  = <<-DESC
    NomicsSDK makes it easy to pull crypto market data from the Nomics.com API. 
    The SDK is lightweight to ensure you don't need to include a lot of dependencies for your crypto projects.
  DESC
  s.homepage     = "https://github.com/ndizazzo/nomics-swift-sdk"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Nick DiZazzo" => "nick.dizazzo@gmail.com" }
  s.ios.deployment_target = "11.0"
  s.osx.deployment_target = "10.10"
  s.watchos.deployment_target = "4.0"
  s.tvos.deployment_target = "11.0"
  s.source       = { :git => "https://github.com/ndizazzo/nomics-swift-sdk.git", :tag => s.version.to_s }
  s.source_files  = "NomicsSDK/Sources/**/*.swift"
  s.frameworks  = "Foundation"
end
