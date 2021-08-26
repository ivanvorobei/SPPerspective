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
 SPPerspective: Config for static transform.
 */
public class SPPerspectiveStaticConfig: SPPerspectiveConfig {
    
    /**
     SPPerspective: Corner which higlight with launch.
     By default random.
     */
    public var corner: SPPerspectiveHighlightCorner = .random
    
    /**
     SPPerspective: Create animation config.
     
     - parameter corner: Higlight corner.
     - parameter distortion: Amount of distortion.
     - parameter angle: Amount of rotation.
     - parameter vectorStep: Distance of rotation from corners and basic state.
     - parameter shadow: Shadow configuration.
     */
    public init(corner: SPPerspectiveHighlightCorner,
         distortion: CGFloat,
         angle: CGFloat,
         vectorStep: CGFloat,
         shadow: SPPerspectiveShadowConfig?) {
        
        self.corner = corner
        super.init(distortion: distortion, angle: angle, vectorStep: vectorStep, shadow: shadow)
    }
}
#endif
