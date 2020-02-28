Pod::Spec.new do |spec|
  spec.name         = "Plug"
  spec.version      = "0.3.0"
  spec.summary      = "Plug is a lightweight, multiplatform plugin management tool written in pure Swift."
  spec.description = <<-DESC
  Plug is a lightweight, multiplatform plugin management tool written in pure Swift. It allows to define rules at which given plugins are available.
  DESC
  spec.homepage     = "https://github.com/lewandowskit93/Plug"
  spec.license      = { :type => "MIT", :file => "LICENSE.md" }
  spec.author       = { "Tomasz Lewandowski" => "tomasz.t.lewandowski@gmail.com" }
  spec.source       = { :git => "https://github.com/lewandowskit93/Plug.git", :tag => "#{spec.version}" }
  spec.source_files  = "Plug/**/*.swift"
  spec.swift_versions = "5.1"
  spec.ios.deployment_target = '8.0'
  spec.osx.deployment_target = '10.10'
  spec.tvos.deployment_target = '9.0'
  spec.watchos.deployment_target = '2.0'
end