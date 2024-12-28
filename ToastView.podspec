Pod::Spec.new do |spec|

  # Basic metadata
  spec.name         = "ToastView"
  spec.version      = "0.0.1"
  spec.summary      = "A customizable and reusable toast view for iOS."

  spec.description  = <<-DESC
    ToastView is a lightweight and highly customizable toast view for iOS.
    It allows you to easily display transient notifications with images, 
    text, and styling options. Perfect for quick user feedback.
  DESC

  spec.homepage     = "https://github.com/AliHasnatTahir/ToastView"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Ali Hasnat Tahir" => "alihasnat861@gmail.com" }
  spec.social_media_url = "www.linkedin.com/in/ali-hasnat"

  # Platform and language support
  spec.platform     = :ios, "11.0"
  spec.swift_version = "5.0"

  # Source location
  spec.source       = { :git => "https://github.com/AliHasnatTahir/ToastView.git", :tag => "#{spec.version}" }

  # Source files and resources
  spec.source_files  = "Sources/**/*.{swift}"
  spec.exclude_files = "Sources/Exclude"

  # Dependencies
  # Add any dependencies here if required
  # e.g., spec.dependency "SomePod", "~> 1.0"

  # Resource files if any
  # spec.resources = "Resources/**/*.{xib,storyboard,png,jpeg,svg}"

  # Framework dependencies
  spec.frameworks = "UIKit"

  # Enable ARC
  spec.requires_arc = true

end
