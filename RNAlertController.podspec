# RNAlertController Podspec File
#
# Created by Rayhan Nabi on 5/14/2019

Pod::Spec.new do |spec|

  spec.name                   = "RNAlertController"
  spec.version                = "0.7.2"
  spec.summary                = "Customizable Alert Framework for iOS"

  spec.description            = <<-DESC
                                A customizable UIAlertController alternative for iOS written in Swift
                                DESC

  spec.homepage               = "https://github.com/rayhannabi/RNAlertController"
  spec.license                = { 
                                  :type => "MIT", 
                                  :file => "LICENSE"
                                }
  spec.authors                = { 
                                  "Rayhan Nabi" => "rayhanjanam@gmail.com"
                                }
  spec.social_media_url       = "https://twitter.com/rayhan_nabi"

  spec.platform               = :ios
  spec.ios.deployment_target  = '9.0'
  spec.source                 = { 
                                  :git => "https://github.com/rayhannabi/RNAlertController.git", 
                                  :tag => "v#{spec.version}"
                                }
  spec.swift_version          = '5.0'
  spec.source_files           = "Sources/**/*.swift"
  spec.resources              = "Resources/**/*.xcassets"
  spec.framework              = "UIKit"
  spec.requires_arc           = true

end
