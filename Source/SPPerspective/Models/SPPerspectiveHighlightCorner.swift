// The MIT License (MIT)
// Copyright © 2020 Ivan Varabei (varabeis@icloud.com)
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
// SOFTWARE. IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit

/**
Highlight some side or corner.
 */
public enum SPPerspectiveHighlightCorner: CaseIterable {
    
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
     Ordered by clockwise.
     */
    static var clockwise: [SPPerspectiveHighlightCorner] {
        return [.topMedium, .topRight, .mediumRight, .bottomRight, .bottomMedium, .bottomLeft, .mediumLeft, .topLeft]
    }
    
    /**
     Ordered by clockwise with start specific side or corner.
     */
    static func clockwise(from corner: SPPerspectiveHighlightCorner) -> [SPPerspectiveHighlightCorner] {
        var clockwise = self.clockwise
        if let splitIndex = clockwise.firstIndex(of: corner) {
            let prefix = clockwise.prefix(upTo: splitIndex)
            clockwise.removeFirst(prefix.count)
            clockwise = clockwise + prefix
        }
        return clockwise
    }
}
