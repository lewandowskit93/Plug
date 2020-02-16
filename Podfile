# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
project 'Plug.xcodeproj'
 
use_frameworks!

target 'Example' do
  platform :ios, '13.0'
  pod 'SwiftLint'
end

target 'Plug_macOS' do
  platform :macos, '10.10'
  pod 'SwiftLint'

  # Pods for Plug

  target 'PlugTests_macOS' do
    # Pods for testing
  	inherit! :search_paths
  end

end

target 'Plug_iOS' do
  platform :ios, '8.0'
  pod 'SwiftLint'

  # Pods for Plug

  target 'PlugTests_iOS' do
    # Pods for testing
    inherit! :search_paths
  end

end

target 'Plug_tvOS' do
  platform :tvos, '9.0'
  pod 'SwiftLint'

  # Pods for Plug

  target 'PlugTests_tvOS' do
    # Pods for testing
    inherit! :search_paths
  end

end

target 'Plug_watchOS' do
  platform :watchos, '2.0'
  pod 'SwiftLint'

  # Pods for Plug
end
