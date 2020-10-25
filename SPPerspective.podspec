Pod::Spec.new do |s|

  s.name = 'SPPerspective'
  s.version = '1.0.6'
  s.summary = 'Animatable 3D Transform for views like iOS 14 widgets.'
  s.homepage = 'https://github.com/ivanvorobei/SPPerspective'
  s.license = { :type => "MIT", :file => "LICENSE" }
  
  s.author = { "Ivan Vorobei" => "varabeis@icloud.com" }
  s.social_media_url = 'https://ivanvorobei.by/'
  
  s.swift_version = '5.1'
  s.ios.deployment_target = '12.0'

  s.source = { :git => 'https://github.com/ivanvorobei/SPPerspective.git', :tag => s.version }
  s.source_files = 'Source/SPPerspective/**/*.swift'

end
