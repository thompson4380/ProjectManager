# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'ProjectManager' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ProjectManager

  pod 'Firebase/Analytics'
  pod 'Firebase/Auth'
  pod 'Firebase/Firestore'
  pod 'FirebaseFirestoreSwift', '~> 7.0-beta'
  #   pod 'FirebaseFirestoreSwift'
  # https://stackoverflow.com/questions/64670022/firebasefirestoreswift-wont-install-cocoapods/64671117#64671117

  post_install do |installer|
      installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
          config.build_settings['EXCLUDED_ARCHS[sdk=iphonesimulator*]'] = 'arm64'
        end
      end
  end
  
  
  
end
