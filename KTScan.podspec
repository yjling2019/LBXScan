Pod::Spec.new do |s|
    s.name         = 'KTScan'
    s.version      = '2.5.2'
    s.summary      = 'ios scan wrapper, fork from LBXScan'
    s.homepage     = 'https://github.com/yjling2019/LBXScan'
    s.license      = 'MIT'
    s.authors      = {'lbxia' => 'yjling2019@gmail.com'}
    s.platform     = :ios, '8.0'
    s.source       = {:git => 'https://github.com/yjling2019/LBXScan.git', :tag => s.version}
    s.requires_arc = true
    s.prefix_header_contents = '#import <Foundation/Foundation.h>'

    s.default_subspec = 'All'

    s.subspec 'Types' do |type|
    type.source_files = 'LBXScan/*.{h,m}'
    end

    s.subspec 'All' do |all|
      all.source_files = 'LBXScan/LBXNative/*.{h,m}','LBXScan/LBXZXing/**/*.{h,m}','LBXScan/UI/*.{h,m}'
      all.libraries = 'iconv','z'
      all.resource     = 'LBXScan/UI/CodeScan.bundle'
      all.dependency 'KTScan/Types','~> 2.2'
      all.ios.frameworks = 'AVFoundation', 'CoreGraphics', 'CoreMedia', 'CoreVideo', 'ImageIO', 'QuartzCore'
      all.prefix_header_contents = '#import "LBXScanNative.h"','#import "ZXingWrapper.h"','#import "LBXScanView.h"'
    end

    s.subspec 'LBXNative' do |lbxNative|
      lbxNative.source_files = 'LBXScan/LBXNative/*.{h,m}'
      lbxNative.ios.frameworks = 'AVFoundation'
      lbxNative.prefix_header_contents = '#import "LBXScanNative.h"'
      lbxNative.dependency 'KTScan/Types','~> 2.2'
    end

    s.subspec 'LBXZXing' do |lbxZXing|
      lbxZXing.source_files = 'LBXScan/LBXZXing/**/*.{h,m}'
      lbxZXing.ios.frameworks = 'AVFoundation', 'CoreGraphics', 'CoreMedia', 'CoreVideo', 'ImageIO', 'QuartzCore'
      lbxZXing.prefix_header_contents = '#import "ZXingWrapper.h"'
      lbxZXing.dependency 'KTScan/Types','~> 2.2'
    end
  
    s.subspec 'UI' do |ui|
      ui.source_files = 'LBXScan/UI/*.{h,m}'
      ui.resource     = 'LBXScan/UI/CodeScan.bundle'
      ui.prefix_header_contents = '#import "LBXScanView.h"'
      ui.dependency 'KTScan/Types','~> 2.2'
    end

end
