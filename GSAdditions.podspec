Pod::Spec.new do |s|
  s.name         = 'GSAdditions'
  s.version      = '1.1.1'
  s.summary      = 'Objective-C GS categories for iOS and OS X.'
  s.homepage     = 'https://github.com/GyazSquare/GSAdditions'
  s.license      = { :type => 'MIT' }
  s.author       = 'GyazSquare'
  s.source       = { :git => 'https://github.com/GyazSquare/GSAdditions.git', :tag => '1.1.1' }
  s.requires_arc = true

  s.subspec 'FoundationGSAdditions' do |sp|
    sp.ios.deployment_target = '5.0'
    sp.osx.deployment_target = '10.6'
    sp.source_files = 'FoundationGSAdditions/*.{h,m}'
  end

  s.subspec 'UIKitGSAdditions' do |sp|
    sp.platform     = :ios, '5.0'
    sp.source_files = 'UIKitGSAdditions/*.{h,m}'
  end
end
