# SPPerspective

<img align="left" src="https://github.com/ivanvorobei/SPPerspective/blob/main/Assets/Readme/Preview%20-%201.0.png" width="450"/>

### About

Animatable widgets from iOS 14. 3D transform and dynamic shadow. [Video preview](https://cdn.ivanvorobei.by/github/SPPerspective/Preview.mov). Also you can configure transform and shadow as you need.
It first release, and if you have any troubles, please, create issue.

If you like the project, don't forget to `put star ★` and follow me on GitHub:

[![https://github.com/ivanvorobei](https://github.com/ivanvorobei/Assets/blob/master/Buttons/follow-me-on-github.svg)](https://github.com/ivanvorobei)

## Navigate

- [Requirements](#requirements)
- [Installation](#installation)
    - [Swift Package Manager](#swift-package-manager)
    - [CocoaPods](#cocoapods)
    - [Manually](#manually)
- [Usage](#usage)
    - [Widgets iOS 14](#widgets-ios-14)
    - [Configuration](#configuration)
    - [Duration](#duration)
- [Other Projects](#other-projects)
- [Russian Community](#russian-community)

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

## Usage

All transform working on idea of configs.

### Widgets iOS 14

Availalbe ready use static and animatable configs which mimicrate to iOS 14 widgets animtaion:

```swift
// Animatable
whiteView.applyPerspective(.iOS14WidgetAnimatable)

// Static
whiteView.applyPerspective(.iOS14WidgetStatic)
```

### Configuration

For apply tranform you shoud create and pass configuration file. Available static and animatable configuration:

```swift
// Static config, using for not animatable transform
let staticConfig = SPPerspectiveStaticConfig(...)

// Animatable config, using for animatable loop transform
let animatableConfig = SPPerspectiveAnimationConfig(...)

// Apply config to view:
whiteView.applyPerspective(animatableConfig)
```

In configuration you shoud pass tranform values and can configure shadow.

### Duration

You can customize even ready-use config. For change duration shoud do it:

```swift
let config = SPPerspectiveConfig.iOS14WidgetAnimatable
config.duration = 4
whiteView.applyPerspective(config)
```

## Other Projects

#### [SPPermissions](https://github.com/ivanvorobei/SPPermissions)
Using for request permissions. Available native controllers with clean UI.  You can check state of any permission. Simple integration and usage like 2 lines code.

#### [SPAlert](https://github.com/ivanvorobei/SPAlert)
Mimic to native popup. You can find this alerts in AppStore after feedback or after added song to library in Apple Music. Contains popular Done, Heart presets and many other. Done preset present with draw path animation like original. Also available simple present message without icon. Usage in one line code.

#### [SPDiffable](https://github.com/ivanvorobei/SPDiffable)
Apple's diffable API required models for each object type. If you want use it in many place, you pass time to implement it and get over duplicates codes. This project help do it elegant with shared models and special cell providers. Support side bar iOS14 and already has native cell providers.

## Russian Community

Присоединяйтесь в телеграм канал [Код Воробья](https://sparrowcode.by/telegram), там найдете заметки о iOS разработке и дизайне. Ещё туториалы выклыдываю на [YouTube](https://sparrowcode.by/youtube):

[![Tutorials on YouTube](https://github.com/ivanvorobei/Assets/blob/master/Russian%20Community/youtube-preview.jpg)](https://sparrowcode.by/youtube)
