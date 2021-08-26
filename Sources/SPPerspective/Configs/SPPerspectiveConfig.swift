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

public class SPPerspectiveConfig {
    
    /**
     SPPerspective: Distortion if perspective when rotation view.
     
     Using for show 3D effect,
     but with large values get bad results.
     
     # Range
     This value using as `1.0 / yourValue`.
     The higher the value, the less distortion.
     Recomended using values around `400...1200`.
     */
    public var distortionPerspective: CGFloat
    
    /**
     SPPerspective: Angle of rotation. Passing value in degress, not radians.
     
     In iOS 14 widgets using similar to 10 degress.
     Not same as distortion.
     */
    public var angle: CGFloat
    
    /**
     SPPerspective: Diffrence between 3D vector states.
     
     In iOS 14 widgets using similar to 3.14.
     Better leave it and change angle or distortion.
     */
    public var vectorStep: CGFloat
    
    /**
     SPPerspective: Configuration for shadow.
     Pass nil if no need doing shadow.
     */
    public var shadowConfig: SPPerspectiveShadowConfig?
    
    init(distortion: CGFloat, angle: CGFloat, vectorStep: CGFloat, shadow: SPPerspectiveShadowConfig?) {
        self.distortionPerspective = distortion
        self.angle = angle
        self.vectorStep = vectorStep
        self.shadowConfig = shadow
    }
}
#endif
