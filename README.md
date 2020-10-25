# SPPerspective

<img align="left" src="https://github.com/ivanvorobei/SPPerspective/blob/main/Assets/Readme/Preview%20-%201.0.png" width="520"/>

### About

Animatable 3D Transform for views. Very similar to iOS 14 widgets. For using need call 1 line of code.  Also you can config values as you need. 
It first release, and if you have any troubles, please, create issue or contact with me via email: varabeis@icloud.com

If you like the project, don't forget to `put star ★` and follow me on GitHub:

[![https://github.com/ivanvorobei](https://github.com/ivanvorobei/Assets/blob/master/Buttons/follow-me-on-github.svg)](https://github.com/ivanvorobei)

## Navigate

- [Requirements](#requirements)
- [Installation](#installation)
    - [Swift Package Manager](#swift-package-manager)
    - [CocoaPods](#cocoapods)
    - [Manually](#manually)
- [Usage](#usage)
    - [widgets iOS 14](#widgets-ios-14)
    - [Custom](#custom-configuration)
- [Other Projects](#other-projects)
- [Russian Community](#russian-community)

## Requirements

Swift `+5.0`. Ready for use on iOS 12+

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

### Manually

If you prefer not to use any of dependency managers, you can integrate `SPPermissions` into your project manually. Put `Source/SPPerspective` folder in your Xcode project. Make sure to enable `Copy items if needed` and `Create groups`.

## Usage

### Widget iOS 14

You can set widgets style with one line code:

```swift
whiteView.applyPerspectiveAnimation(.iOS14Widget)
```
That all. It automatically added shadow and 3D transform animation.

### Custom Configuration

For deep customize need create config file. It object of `SPPerspectiveAnimationConfig`.

```swift
let config = SPPerspectiveAnimationConfig(
    animationDuration: 2,
    distortionPerspective: 600,
    angle: 10,
    vectorStep: 3.14,
    shadowConfig: nil
)
```

Also you can configure shadow. For it need pass `SPPerspectiveShadowConfig` to your  `SPPerspectiveAnimationConfig`.
You can read about each value in documentation.

## Other Projects

#### [SPPermissions](https://github.com/ivanvorobei/SPPermissions)
Allow request permissions with native dialog UI and interactive animations. Also you can request permissions without dialog. Check state any permission. You can start using this project with just two lines of code and easy customisation.

#### [SPAlert](https://github.com/ivanvorobei/SPAlert)
It is popup from Apple Music & Feedback in AppStore. Contains Done & Heart presets. Done present with draw path animation. I clone Apple's alerts as much as possible.
You can find this alerts in AppStore after feedback, after added song to library in Apple Music. I am also add alert without icon, as simple message.

#### [SparrowKit](https://github.com/ivanvorobei/SparrowKit)
Collection of native Swift extensions to boost your development. Have extensions for `UIView`, `UIViewController`, code layout, date formatting and many other. Support tvOS and watchOS.

#### [SPDiffable](https://github.com/ivanvorobei/SPDiffable)
Apple's diffable API requerid models for each object type. If you want use it in many place, you pass many time to implemenet and get over duplicates codes. This project help you do it elegant with shared models and special cell providers for one-usage models.

## Russian Community

Присоединяйтесь в телеграм канал [Код Воробья](https://t.me/sparrowcode), там найдете заметки о iOS разработке и дизайне.
Большие туториалы выклыдываю на [YouTube](https://www.youtube.com/channel/UCNUGzZfcOyX4YpP36VzeZ6A).

[![Tutorials on YouTube](https://github.com/ivanvorobei/Assets/blob/master/Russian%20Community/youtube-preview.jpg)](https://www.youtube.com/channel/UCNUGzZfcOyX4YpP36VzeZ6A)
