Pod::Spec.new do |s|
    s.name             = 'HLFUITextExtensions'
    s.version          = '0.0.1'
    s.summary          = 'UIKit convenience extensions for text styling.'
    s.description      = 'TODO: Add long description of the pod here.'
    s.homepage         = 'https://github.com/hlfcoding/UITextExtensions'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Peng Wang' => 'peng@pengxwang.com' }
    s.source           = { :git => 'https://github.com/hlfcoding/UITextExtensions.git', :tag => s.version.to_s }
    s.social_media_url = 'https://twitter.com/hlfcoding'

    s.ios.deployment_target = '10.3'
    s.source_files = 'HLFUITextExtensions/Classes/**/*'
    s.frameworks = 'UIKit'
end
