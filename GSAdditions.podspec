Pod::Spec.new do |s|
  s.name         = 'GSAdditions'
  s.version      = '2.0.2'
  s.author       = 'GyazSquare'
  s.license      = { :type => 'MIT' }
  s.homepage     = 'https://github.com/GyazSquare/GSAdditions'
  s.source       = { :git => 'https://github.com/GyazSquare/GSAdditions.git', :tag => '2.0.2' }
  s.summary      = 'Objective-C GS categories for iOS, OS X, watchOS and tvOS.'
  s.ios.deployment_target = '5.0'
  s.requires_arc = true

  s.subspec 'FoundationGSAdditions' do |sp|
    sp.osx.deployment_target = '10.6'
    sp.tvos.deployment_target = '9.0'
    sp.watchos.deployment_target = '2.0'
    sp.source_files = 'FoundationGSAdditions/*.{h,m}'
  end

  s.subspec 'UIKitGSAdditions' do |sp|
    sp.tvos.deployment_target = '9.0'
    sp.source_files = 'UIKitGSAdditions/*.{h,m}'
  end
end
