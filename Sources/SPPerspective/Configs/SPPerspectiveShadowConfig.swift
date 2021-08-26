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
 SPPerspective: Config for shadow.
 */
public struct SPPerspectiveShadowConfig {
    
    /**
     SPPerspective: Blur radius of shadow.
     */
    public var blurRadius: CGFloat
    
    /**
     SPPerspective: Shadow opacity.
     */
    public var opacity: CGFloat
    
    /**
     SPPerspective: Color of shadow.
     */
    public var color: UIColor
    
    /**
     SPPerspective: Shadow is dynamic.
     This property configure most horizontal offset.
     */
    public var maximumHorizontalOffset: CGFloat
    
    /**
     SPPerspective: Shadow is dynamic.
     Initial vertical offset.
     */
    public var startVerticalOffset: CGFloat
    
    /**
     SPPerspective: Shadow is dynamic.
     Side vertical offset.
     
     For best shoud use smaller value of `maximumHorizontalOffset`.
     */
    public var cornerVerticalOffset: CGFloat
    
    /**
     SPPerspective: Shadow is dynamic.
     This property configure most vertical offset when card up down side.
     */
    public var maximumVerticalOffset: CGFloat
    
    /**
     SPPerspective: Calculation medium between start and mediun of vertical offset.
     */
    public var startCornerVerticalMedian: CGFloat {
        return cornerVerticalOffset - (cornerVerticalOffset - startVerticalOffset) / 2
    }

    /**
     SPPerspective: Create a new SPPerspectiveShadowConfig.
     
     - parameter blurRadius: Blur radius of the shadow
     - parameter opacity: Shadow opacity
     - parameter color: Shadow color
     - parameter maximumHorizontalOffset: Maximum value for horizontal shadow offset
     - parameter startVerticalOffset: Initial vertical offset
     - parameter cornerVerticalOffset: Vertical offset for side (should be smaller than `maximumHorizontalOffset`
     - parameter maximumVerticalOffset: Maximum value for vertical offset when card is up side down
    */
    public init(blurRadius: CGFloat, opacity: CGFloat, color: UIColor, maximumHorizontalOffset: CGFloat, startVerticalOffset: CGFloat, cornerVerticalOffset: CGFloat, maximumVerticalOffset: CGFloat) {
        self.blurRadius = blurRadius
        self.opacity = opacity
        self.color = color
        self.maximumHorizontalOffset = maximumHorizontalOffset
        self.startVerticalOffset = startVerticalOffset
        self.cornerVerticalOffset = cornerVerticalOffset
        self.maximumVerticalOffset = maximumVerticalOffset
    }
}
#endif
