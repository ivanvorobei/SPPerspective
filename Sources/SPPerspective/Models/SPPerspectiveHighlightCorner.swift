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
SPPerspective: Highlight some side or corner.
 */
public enum SPPerspectiveHighlightCorner: String, CaseIterable {
    
    case topLeft
    case topMedium
    case topRight
    
    case mediumLeft
    case mediumRight
    
    case bottomLeft
    case bottomMedium
    case bottomRight
    
    /**
     Get random side or corner.
     */
    static var random: SPPerspectiveHighlightCorner {
        return allCases.randomElement()!
    }
    
    /**
     SPPerspective: Ordered by clockwise or reverse.
     
     - parameter corner: Animation will start from its corner. If nil using default value.
     - parameter direction: Direction of animation.
     */
    public static func order(from corner: SPPerspectiveHighlightCorner?, direction: SPPerspectiveAnimationDirection) -> [SPPerspectiveHighlightCorner] {
        var order: [SPPerspectiveHighlightCorner] = [.topMedium, .topRight, .mediumRight, .bottomRight, .bottomMedium, .bottomLeft, .mediumLeft, .topLeft]
        
        switch direction {
        case .forward:
            break
        case .reverse:
            order = order.reversed()
        }
        
        if let fromCorner = corner {
            if let splitIndex = order.firstIndex(of: fromCorner) {
                let prefix = order.prefix(upTo: splitIndex)
                order.removeFirst(prefix.count)
                order = order + prefix
            }
        }
        
        return order
    }
}
#endif
