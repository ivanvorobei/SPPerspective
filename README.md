# SPPerspective

<a href="https://cdn.ivanvorobei.by/github/SPPerspective/Preview.mov">
<img 
align="left" 
src="https://github.com/ivanvorobei/SPPerspective/blob/main/Assets/Readme/Hello%20Preview.png" width="440"/>
</a>

### About

Animatable widgets from iOS 14. Same animation for transform and shadow. 

You can customise duration, perspective angle & shadow also. For visual edit use example app ([video preview](https://cdn.ivanvorobei.by/github/SPPerspective/Preview.mov)).

[![https://cdn.ivanvorobei.by/github/SPPerspective/Preview.mov](https://github.com/ivanvorobei/Assets/blob/master/Buttons/video-preview.svg)](https://cdn.ivanvorobei.by/github/SPPerspective/Preview.mov)

If you like the project, don't forget to `put star ★` and follow me on GitHub:

[![https://github.com/ivanvorobei](https://github.com/ivanvorobei/Assets/blob/master/Buttons/follow-me-on-github.svg)](https://github.com/ivanvorobei)

## Navigate

- [Requirements](#requirements)
- [Installation](#installation)
    - [Swift Package Manager](#swift-package-manager)
    - [CocoaPods](#cocoapods)
    - [Manually](#manually)
- [Quick Start](#quick-start)
- [Customise](#customise)
    - [Duration](#duration)
    - [Perspective](#perspective)
    - [Shadow](#shadow)
- [Other Projects](#other-projects)
- [Russian-specking Community](#russian-specking-community)

## Requirements

Swift `5.1`. Ready for use on iOS 12+

## Installation

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

To integrate `SPPerspective` into your Xcode project using Xcode 12, specify it in `File > Swift Packages > Add Package Dependency...`:

```ogdl
https://github.com/ivanvorobei/SPPerspective
```

### CocoaPods:

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate `SPPerspective` into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'SPPerspective'
```

### Manually

If you prefer not to use any of dependency managers, you can integrate `SPPerspective` into your project manually. Put `Source/SPPerspective` folder in your Xcode project. Make sure to enable `Copy items if needed` and `Create groups`.

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

<a href="https://cdn.ivanvorobei.by/github/SPPerspective/Preview.mov">
<img 
align="left" 
src="https://github.com/ivanvorobei/SPPerspective/blob/main/Assets/Readme/Example%20App%20Preview.png" width="300"/>
</a>

### Summary

You can customise duration, angle, shadow properties and other. All this customising by configuration file. Configuration can be animatable or static. Above you see  `.iOS14WidgetAnimatable` & `.iOS14WidgetStatic`, its also configurations wich already have good-usage values same as native widgets. 

For get fine configuration, better use example app ([video preview](https://cdn.ivanvorobei.by/github/SPPerspective/Preview.mov)). You can in real time see changes in configuration.

[![https://cdn.ivanvorobei.by/github/SPPerspective/Preview.mov](https://github.com/ivanvorobei/Assets/blob/master/Buttons/video-preview.svg)](https://cdn.ivanvorobei.by/github/SPPerspective/Preview.mov)

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

Both properties allow you configure transform for your view. If you don't know which values shoud using, check use example app ([video preview](https://cdn.ivanvorobei.by/github/SPPerspective/Preview.mov)). With sliders you can customize it in detail.

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

For get fine result, you shoud use this rule: `startVerticalOffset` < `cornerVerticalOffset` < `maximumVerticalOffset`. Visual transform available in example app ([video preview](https://cdn.ivanvorobei.by/github/SPPerspective/Preview.mov)), with it you get fine values. 

## Other Projects

#### [SPPermissions](https://github.com/ivanvorobei/SPPermissions)
Using for request and check state of permissions. Available native UI for request multiple permissions at the same time. Simple integration and usage like 2 lines code.

#### [SPAlert](https://github.com/ivanvorobei/SPAlert)
You can find this alerts in AppStore after feedback or after added song to library in Apple Music. Contains popular Done, Heart presets and many other. Done preset present with draw path animation like original. Also available simple present message without icon. Usage in one line code.

#### [SPDiffable](https://github.com/ivanvorobei/SPDiffable)
Simplifies working with animated changes in table and collections. Apple's diffable API required models for each object type. If you want use it in many place, you pass time to implement it and get over duplicates codes. This project help do it elegant with shared models and special cell providers. Support side bar iOS14 and already has native cell providers and views.

## Russian-specking Community

В телеграм-канале [Код Воробья](https://sparrowcode.by/telegram) пишу о iOS разработке и дизайне. Туториалы выклыдываю на [YouTube](https://sparrowcode.by/youtube):

[![Tutorials on YouTube](https://github.com/ivanvorobei/Assets/blob/master/Russian%20Community/youtube-preview.jpg)](https://sparrowcode.by/youtube)
