#
# Be sure to run `pod lib lint log4cxx.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "log4cxx"
  s.version          = "0.10.0"
  s.summary          = "Logging Library for ROSiOS"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
This is a log4cxx framework for ROSiOS
                       DESC

  s.homepage         = "https://github.com/ros-ios/log4cxx"
  s.license          = 'log4cxx'
  s.author           = { "Furushchev" => "furushchev@jsk.imi.i.u-tokyo.ac.jp" }
  s.source           = { :git => "https://github.com/ros-ios/log4cxx.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.ios.source_files = "Pod/include/**/*.{h,hpp,ipp}"
  s.ios.header_mappings_dir = "Pod/include"
  s.ios.public_header_files = "Pod/include/**/*.{h,hpp,ipp}"

  s.ios.preserve_paths = "Pod/include/**/*.{h,hpp,ipp}", "Pod/lib/liblog4cxx.a"
  s.ios.vendored_libraries = "Pod/lib/liblog4cxx.a"

end
