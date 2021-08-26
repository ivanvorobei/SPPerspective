// The MIT License (MIT)
// Copyright © 2020 Ivan Vorobei (hello@ivanvorobei.by)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#if canImport(UIKit) && (os(iOS))
import UIKit

public extension SPPerspectiveConfig {
    
    /**
     SPPerspective: Mimicrate iOS 14 widget animatable tranform config.
     Values can update in future.
     */
    static var iOS14WidgetAnimatable: SPPerspectiveAnimationConfig {
        let config = SPPerspectiveAnimationConfig(
            duration: 16,
            distortion: iOS14WidgetDistortion,
            angle: iOS14WidgetAngle,
            vectorStep: iOS14WidgetVectorStep,
            shadow: SPPerspectiveShadowConfig(
                blurRadius: iOS14WidgetShadowBlurRadius,
                opacity: iOS14WidgetShadowOpacity,
                color: UIColor.black,
                maximumHorizontalOffset: iOS14WidgetShadowMaximumHorizontalOffset,
                startVerticalOffset: iOS14WidgetShadowStartVerticalOffset,
                cornerVerticalOffset: iOS14WidgetShadowCornerVerticalOffset,
                maximumVerticalOffset: iOS14WidgetShadowMaximumVerticalOffset
            )
        )
        return config
    }
    
    /**
     SPPerspective: Mimicarte iOS 14 widget static tranfrom config.
     Values can update in future.
     */
    static var iOS14WidgetStatic: SPPerspectiveStaticConfig {
        let config = SPPerspectiveStaticConfig(
            corner: .random,
            distortion: iOS14WidgetDistortion,
            angle: iOS14WidgetAngle,
            vectorStep: iOS14WidgetVectorStep,
            shadow: SPPerspectiveShadowConfig(
                blurRadius: iOS14WidgetShadowBlurRadius,
                opacity: iOS14WidgetShadowOpacity,
                color: UIColor.black,
                maximumHorizontalOffset: iOS14WidgetShadowMaximumHorizontalOffset,
                startVerticalOffset: iOS14WidgetShadowStartVerticalOffset,
                cornerVerticalOffset: iOS14WidgetShadowCornerVerticalOffset,
                maximumVerticalOffset: iOS14WidgetShadowMaximumVerticalOffset
            )
        )
        return config
    }
    
    // MARK: - Default Values
    
    fileprivate static var iOS14WidgetDistortion: CGFloat { return 600 }
    fileprivate static var iOS14WidgetAngle: CGFloat { return 10 }
    fileprivate static var iOS14WidgetVectorStep: CGFloat { return 3.14 }
    fileprivate static var iOS14WidgetShadowBlurRadius: CGFloat { return 19 }
    fileprivate static var iOS14WidgetShadowOpacity: CGFloat { return 0.25 }
    fileprivate static var iOS14WidgetShadowStartVerticalOffset: CGFloat { return 8 }
    fileprivate static var iOS14WidgetShadowCornerVerticalOffset: CGFloat { return 18 }
    fileprivate static var iOS14WidgetShadowMaximumVerticalOffset: CGFloat { return 21 }
    fileprivate static var iOS14WidgetShadowMaximumHorizontalOffset: CGFloat { return 12 }
    
}
#endif
