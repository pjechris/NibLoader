Pod::Spec.new do |s|
  s.name		= "NibLoader"
  s.version		= "0.1.0"
  s.source		= { :git => "https://github.com/pjechris/#{s.name}.git",
  		     	    :tag => s.version.to_s }

  s.summary          	= "Nested NIB/XIB with no pain"
  s.description         = "Load views from nib in one line; easily nest your nibs right into Interface Builder"
  s.homepage            = s.source[:git]
  s.license		= { :type => "MIT", :file => "LICENSE" }
  s.author              = 'pjechris'

  s.platform		= :ios, "6.0"
  s.source_files    	= 'Src/**/*.{h,m}'
  s.prefix_header_file  = "Src/#{s.name}.h"
  s.requires_arc 	= true

end
