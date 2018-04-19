source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/Accengage/ios-pod-specs.git'

platform :ios, '9.0'
inhibit_all_warnings!

#pods for the app
def rx_pods
    pod 'RxSwift', '4.0.0'
    pod 'RxCocoa', '4.0.0'
    pod 'RxSwiftExt', '3.1.0'
    pod 'Moya/RxSwift', '10.0.1'
end


#publish to appstore target
target 'HelloWorld' do
    rx_pods

    #test target
    target 'HelloWorldTests' do
        inherit! :search_paths
    end
end

target 'HelloWorldKit' do
    rx_pods
    target 'HelloWorldKitTests' do
        inherit! :search_paths
    end
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '4.1.0'
        end
    end
end
