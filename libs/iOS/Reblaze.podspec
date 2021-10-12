Pod::Spec.new do |s|
  s.name             = 'Reblaze'
  s.version          = '2.0'
  s.summary          = 'Mobile SDK for Bot control and Web API protection.'
  s.description      = 'Reblaze is a cloud-based platform that provides a comprehensive, dynamic, machine-intelligent security and control solution for web platforms.'

  s.license          = 'Commercial'
  s.authors 	     = { 'Reblaze' => 'mobile-sdk-dev@reblaze.com' }
  s.homepage         = 'https://www.reblaze.com/'
  s.source           = { :path => '.' }

  s.vendored_frameworks = 'ReblazeSDK.xcframework'
  s.platform = :ios
  s.swift_version = '5.0'
  s.ios.deployment_target = '10.0'
  s.frameworks = 'UIKit'
end
