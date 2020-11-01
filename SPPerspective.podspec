Pod::Spec.new do |s|

  s.name = 'SPPerspective'
  s.version = '1.1'
  s.summary = 'Animatable widgets from iOS 14. 3D transform and dynamic shadow.'
  s.homepage = 'https://github.com/ivanvorobei/SPPerspective'
  s.license = { :type => "MIT", :file => "LICENSE" }
  
  s.author = { "Ivan Vorobei" => "varabeis@icloud.com" }
  s.social_media_url = 'https://ivanvorobei.by/'
  
  s.swift_version = '5.1'
  s.ios.deployment_target = '12.0'

  s.source = { :git => 'https://github.com/ivanvorobei/SPPerspective.git', :tag => s.version }
  s.source_files = 'Source/SPPerspective/**/*.swift'

end
