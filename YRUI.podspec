#
# Be sure to run `pod lib lint YRUI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YRUI'
  s.version          = '0.1.0'
  s.summary          = '盈软YRUI库'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/cuiChangYunSmile@icloud.com/YRUI'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'CCYSmile' => 'CCYSmile' }
  s.source           = { :git => 'https://github.com/cuiChangYunSmile@icloud.com/YRUI.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'YRUI/Classes/**/*'
  
  # s.resource_bundles = {
  #   'YRUI' => ['YRUI/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'QMUIKit', '3.1.2'
  s.dependency 'NerdyUI', '1.2.1'
  s.dependency 'CWLateralSlide', '1.6.4'
  s.dependency 'BRPickerView', '2.2.1'
  s.dependency 'MJRefresh', '3.1.15.7'
  s.dependency 'MGSwipeTableCell', '1.6.8'
  s.dependency 'MJExtension', '3.0.15.1'
  s.dependency 'AFNetworking', '3.2.1'
end
