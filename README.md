# TextExtensions

[![Version](https://img.shields.io/cocoapods/v/HLFUITextExtensions.svg?style=flat)](http://cocoapods.org/pods/HLFUITextExtensions)
[![License](https://img.shields.io/cocoapods/l/HLFUITextExtensions.svg?style=flat)](http://cocoapods.org/pods/HLFUITextExtensions)
[![Platform](https://img.shields.io/cocoapods/p/HLFUITextExtensions.svg?style=flat)](http://cocoapods.org/pods/HLFUITextExtensions)

> :label: &nbsp; UIKit convenience extensions for text styling in code.

<img src="https://user-images.githubusercontent.com/100884/27258670-9f75ec7a-53b5-11e7-8866-b8dff74393ff.png" width="320" />

## Example

```swift
let label = UILabel()
label.font = .preferredFont(forTextStyle: .title1)
label.numberOfLines = 0
label.textAlignment = .center
label.textColor = .darkText
label.hlf_updateText("Hello, playground. You are looking okay.")

label.hlf_setKerning(-0.5)
label.hlf_setLineHeight(label.hlf_pointsByEms(1.1))
// ...
label.hlf_updateText("Hello, playground. You are looking good.")

let width = label.hlf_pointsByEms(9)
label.frame.size.width = width
label.sizeToFit()
// ...
```

Compare the above with the (less flexible) below:

```swift
let label = UILabel()
label.numberOfLines = 0

var attributes = [String : Any]()
let font = UIFont.preferredFont(forTextStyle: .title1)
attributes[NSFontAttributeName] = font
attributes[NSForegroundColorAttributeName] = UIColor.darkText
attributes[NSKernAttributeName] = -0.5
let paragraphStyle = NSMutableParagraphStyle()
paragraphStyle.alignment = NSTextAlignment.center
paragraphStyle.maximumLineHeight = round(1.1 * font.pointSize)
attributes[NSParagraphStyleAttributeName] = paragraphStyle
label.attributedText = NSAttributedString(
  string: "Hello, playground. You are looking okay.", attributes: attributes
)
// ...
label.attributedText = NSAttributedString(
  string: "Hello, playground. You are looking good.", attributes: attributes
)

let width = round(9 * font.pointSize)
label.frame.size.width = width
label.sizeToFit()
// ...
```

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

Swift 3+

## Installation

TextExtensions is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "HLFUITextExtensions"
```

## Author

Peng Wang, peng@pengxwang.com

## License

TextExtensions is available under the MIT license. See the LICENSE file for more info.
