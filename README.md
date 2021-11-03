# SPPerspective

<a href="https://opensource.ivanvorobei.by/spperspective/preview">
<img 
align="left" 
src="https://github.com/ivanvorobei/SPPerspective/blob/main/Assets/Readme/animated-preview.gif" width="350"/>
</a>

### About

Animatable widgets from iOS 14. Same animation for transform and shadow. 

Customisable duration, perspective and shadow also. For visual edit use example app, check video preview:

[![https://opensource.ivanvorobei.by/spperspective/preview](https://github.com/ivanvorobei/Readme/blob/main/Buttons/video-preview.svg)](https://opensource.ivanvorobei.by/spperspective/preview)

If you like the project, don't forget to `put star ★`<br>Check out my other libraries:

<p float="left">
    <a href="https://opensource.ivanvorobei.by">
        <img src="https://github.com/ivanvorobei/Readme/blob/main/Buttons/more-libraries.svg">
    </a>
</p>

## Navigate

- [Installation](#installation)
    - [Swift Package Manager](#swift-package-manager)
    - [CocoaPods](#cocoapods)
    - [Manually](#manually)
- [Quick Start](#quick-start)
- [Customise](#customise)
    - [Duration](#duration)
    - [Perspective](#perspective)
    - [Shadow](#shadow)
- [Сontribution](#сontribution)
- [Other Projects](#other-projects)
- [Russian Community](#russian-community)

## Installation

Ready for use on iOS 12+. Works with Swift 5+. Required Xcode 12.0 and higher.

<img align="right" src="https://github.com/ivanvorobei/SPPerspective/blob/main/Assets/Readme/spm-install-preview.png" width="520"/>

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

Once you have your Swift package set up, adding as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/ivanvorobei/SPPerspective.git", .upToNextMajor(from: "1.4.1"))
]
```

### CocoaPods:

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'SPPerspective'
```

### Manually

If you prefer not to use any of dependency managers, you can integrate manually. Put `Sources/SPPerspective` folder in your Xcode project. Make sure to enable `Copy items if needed` and `Create groups`.

## Quick Start

For apply animation for your view, use this code: 

```swift
view.applyPerspective(.iOS14WidgetAnimatable)
````

Use this, if need apply non-animation transform:

```swift
view.applyPerspective(.iOS14WidgetStatic)
```

## Customise

<a href="https://opensource.ivanvorobei.by/spperspective/preview">
<img 
align="left" 
src="https://github.com/ivanvorobei/SPPerspective/blob/main/Assets/Readme/example-app-preview.png" width="300"/>
</a>

### Summary

You can customise duration, angle, shadow properties and other. All this customising by configuration file. Configuration can be animatable or static. Above you see  `.iOS14WidgetAnimatable` & `.iOS14WidgetStatic`, its also configurations wich already have good-usage values same as native widgets. 

For get fine configuration, better use example app ([video preview](https://opensource.ivanvorobei.by/spperspective/preview)). You can in real time see changes in configuration.

[![https://opensource.ivanvorobei.by/spperspective/preview](https://github.com/ivanvorobei/Readme/blob/main/Buttons/video-preview.svg)](https://opensource.ivanvorobei.by/spperspective/preview)

Next more details about customise.

### Duration

When you init new animation configuration, you can set duration:

```swift
let animationConfig = SPPerspectiveAnimationConfig(duration: 16, distortion: 600, angle: 10, vectorStep: 3.14, shadow: nil)
view.applyPerspective(animationConfig)
```

If need change duration for default config, using this:

```swift
let animationConfig = SPPerspectiveConfig.iOS14WidgetAnimatable
animationConfig.animationDuration = 8
view.applyPerspective(animationConfig)
```

### Perspective

Angle is how much the view will rotate. For change it call `angle` in config:

```swift
animationConfig.angle = 10
```

Also you can customise distortion of perspective. Using this:

```swift
animationConfig.distortionPerspective = 600
```

Both properties allow you configure transform for your view. If you don't know which values shoud using, check use example app ([video preview](https://opensource.ivanvorobei.by/spperspective/preview)). With sliders you can customize it in detail.

### Shadow

Shadow also using configuration. Static and animation configs contains shadow property.

#### Blur, Opacity & Color

It simple. For change blur, opacity and color call this in configuration.

```swift
animationConfig.shadowConfig?.blurRadius = 5
animationConfig.shadowConfig?.opacity = 0.3
animationConfig.shadowConfig?.color = .black
```

#### Translations

Translation help customise position of shadow for any state of transform. For example you can want do more vertical translation for show deep transform.

Transform adaptive for each higlight corner. For example `startVerticalOffset` using when highlight top-center side. For bottom corners available `cornerVerticalOffset`. For bottom-center side shoud change `maximumVerticalOffset` . Horizontal trnalation customising by `maximumHorizontalOffset`. 

```swift
animationConfig.shadowConfig?.startVerticalOffset = 8
animationConfig.shadowConfig?.cornerVerticalOffset = 18
animationConfig.shadowConfig?.maximumVerticalOffset = 21
animationConfig.shadowConfig?.maximumHorizontalOffset = 12
```

For get fine result, you shoud use this rule: `startVerticalOffset` < `cornerVerticalOffset` < `maximumVerticalOffset`. Visual transform available in example app ([video preview](https://opensource.ivanvorobei.by/spperspective/preview)), with it you get fine values. 

## Сontribution

My English is very bad. You can see this once you read the documentation. I would really like to have clean and nice documentation. If you see gramatical errors and can help fix the Readme, please contact me hello@ivanvorobei.by or make a Pull Request. Thank you in advance!

## Other Projects

I love being helpful. Here I have provided a list of libraries that I keep up to date. For see `video previews` of libraries without install open [opensource.ivanvorobei.by](https://opensource.ivanvorobei.by) website.<br>
I have libraries with native interface and managing permissions. Also available pack of useful extensions for boost your development process.

<p float="left">
    <a href="https://opensource.ivanvorobei.by">
        <img src="https://github.com/ivanvorobei/Readme/blob/main/Buttons/more-libraries.svg">
    </a>
        <a href="https://xcodeshop.ivanvorobei.by">
        <img src="https://github.com/ivanvorobei/Readme/blob/main/Buttons/xcode-shop.svg">
    </a>
</p>

## Russian Community

Подписывайся в телеграмм-канал, если хочешь получать уведомления о новых туториалах.<br>
Со сложными и непонятными задачами помогут в чате.

<p float="left">
    <a href="https://tutorials.ivanvorobei.by/telegram/channel">
        <img src="https://github.com/ivanvorobei/Readme/blob/main/Buttons/open-telegram-channel.svg">
    </a>
    <a href="https://tutorials.ivanvorobei.by/telegram/chat">
        <img src="https://github.com/ivanvorobei/Readme/blob/main/Buttons/russian-community-chat.svg">
    </a>
</p>

Видео-туториалы выклыдываю на [YouTube](https://tutorials.ivanvorobei.by/youtube):

[![Tutorials on YouTube](https://cdn.ivanvorobei.by/github/readme/youtube-preview.jpg)](https://tutorials.ivanvorobei.by/youtube)
