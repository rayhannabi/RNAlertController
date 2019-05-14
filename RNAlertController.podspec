
Pod::Spec.new do |spec|

  spec.name         = "RNAlertController"
  spec.version      = "0.2.0"
  spec.summary      = "Custom Alert Controller for iOS"

  spec.description  = <<-DESC
                    A custom alert controller for iOS written purely in Swift
                   DESC

  spec.homepage     = "https://github.com/rayhannabi/RNAlertController"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.authors            = { "Rayhan Nabi" => "rayhanjanam@gmail.com" }
  spec.social_media_url   = "https://twitter.com/RayhanJanam"

  spec.platform     = :ios
  spec.ios.deployment_target = '9.0'
  spec.source       = { :git => "https://github.com/rayhannabi/RNAlertController.git", 
                        :tag => "#{spec.version}" }

  spec.source_files  = "RNAlertController/**/*.swift"
  spec.framework = "UIKit"
  spec.requires_arc = true
  spec.swift_version = "5.0"

end
