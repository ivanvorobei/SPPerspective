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

/**
 SPPerspective: Config for animatable transform.
 */
public class SPPerspectiveAnimationConfig: SPPerspectiveConfig {
    
    /**
     SPPerspective: Animation of full cycle of rotation.
     
     In widgets iOS 14 using 16 seconds for cycle.
     If you use shadow with it animation,
     shadow automatically apply also it duration.
     */
    public var animationDuration: TimeInterval
    
    /**
     SPPerspective: Corner from start animation.
     By default random.
     */
    public var fromCorner: SPPerspectiveHighlightCorner = .random
    
    /**
     SPPerspective: Direction of animation.
     */
    public var direction: SPPerspectiveAnimationDirection = .random
    
    /**
     SPPerspective: Create animation config.
     
     - parameter duration: Duration of animation.
     - parameter distortion: Amount of distortion.
     - parameter angle: Amount of rotation.
     - parameter vectorStep: Distance of rotation from corners and basic state.
     - parameter shadow: Shadow configuration.
     */
    public init(duration: TimeInterval,
         distortion: CGFloat,
         angle: CGFloat,
         vectorStep: CGFloat,
         shadow: SPPerspectiveShadowConfig?) {
        
        self.animationDuration = duration
        super.init(distortion: distortion, angle: angle, vectorStep: vectorStep, shadow: shadow)
    }
}
#endif
