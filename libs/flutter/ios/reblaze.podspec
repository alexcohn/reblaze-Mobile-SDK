Pod::Spec.new do |s|
  s.name                = 'reblaze'
  s.version             = '2.0'
  s.summary             = 'Flutter Wrapper for Reblaze Mobile SDK.'
  s.description         = 'Reblaze is a cloud-based platform that provides a comprehensive, dynamic, machine-intelligent security and control solution for web platforms.'

  s.license             = { :type => 'MIT' }
  s.authors 	        = { 'Reblaze' => 'mobile-sdk-dev@reblaze.com' }
  s.homepage            = 'https://www.reblaze.com/'
  s.source              = { :path => '.' }
  s.vendored_frameworks = 'ReblazeSDK.xcframework'
  s.source_files        = 'Classes/ReblazeFlutterPlugin.m'
  s.public_header_files = 'Classes/ReblazeFlutterPlugin.h'
  s.platform            = :ios, '10.0'
  s.dependency            'Flutter'
  s.prepare_command = <<-CMD
    ln -sf ../../../libs/iOS/ReblazeSDK.xcframework .
  CMD

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }

end