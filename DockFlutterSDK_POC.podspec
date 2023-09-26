#
#  Be sure to run `pod spec lint PayKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

    spec.name            = "DockFlutterSDK_POC"
    spec.version         = "1.0.0-alpha.06"
    spec.summary         = "Dock Flutter SDK POC"

    spec.homepage     = 'https://github.com/merci-app/mcikit-podspec'
    spec.license      = { :type => 'MIT', :file => 'LICENSE' }
    spec.authors      = { 'Rodrigo Brauwers' => 'rbrauwers @ dock dot tech' }
    spec.source       = { :git => 'https://github.com/merci-app/flutter-poc', :tag => '1.0.0-alpha.06' }

    spec.ios.deployment_target = '11.0'
    spec.vendored_frameworks   = [
        'App.xcframework',
        'Flutter.xcframework'
    ]

end