Pod::Spec.new do |s|

  s.name          = "SPPerspective"
  s.version       = "1.0.0"
  s.summary       = "Animatable 3D Transform for views. Very similar to iOS 14 widgets."
  s.homepage      = "https://github.com/IvanVorobei/SPPerspective"
  s.source        = { :git => "https://github.com/IvanVorobei/SPPerspective.git", :tag => s.version }
  s.license       = { :type => "MIT", :file => "LICENSE" }
  
  s.author        = { "Ivan Vorobei" => "varabeis@icloud.com" }
  
  s.swift_version = ['5.1']
  s.ios.deployment_target = "12.0"

  s.source = { :git => 'https://github.com/ivanvorobei/SPPerspective.git', :tag => s.version }
  s.source_files  = "Source/SPPerspective/**/*.swift"

end
