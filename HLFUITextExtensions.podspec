Pod::Spec.new do |s|
    s.name             = 'HLFUITextExtensions'
    s.version          = '0.1.0'
    s.summary          = 'UIKit convenience extensions for text styling.'
    s.description      = 'Supports UILabel, UITextField, and UITextView.'
    s.homepage         = 'https://github.com/hlfcoding/UITextExtensions'
    s.screenshots      = 'https://user-images.githubusercontent.com/100884/27258670-9f75ec7a-53b5-11e7-8866-b8dff74393ff.png'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Peng Wang' => 'peng@pengxwang.com' }
    s.source           = { :git => 'https://github.com/hlfcoding/UITextExtensions.git', :tag => s.version.to_s }
    s.social_media_url = 'https://twitter.com/hlfcoding'

    s.ios.deployment_target = '10.3'
    s.source_files = 'HLFUITextExtensions/Classes/**/*'
    s.frameworks = 'UIKit'
end
