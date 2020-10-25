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

public struct SPPerspectiveShadowConfig {
    
    /**
     Blur radius of shadow.
     */
    var blurRadius: CGFloat
    
    /**
     Shadow opacity.
     */
    var opacity: CGFloat
    
    /**
     Color of shadow.
     */
    var color: UIColor
    
    /**
     Shadow is dynamic.
     This property configure most horizontal offset.
     */
    var maximumHorizontalOffset: CGFloat
    
    /**
     Shadow is dynamic.
     Initial vertical offset.
     */
    var startVerticalOffset: CGFloat
    
    /**
     Shadow is dynamic.
     Side vertical offset.
     
     For best shoud use smaller value of `maximumHorizontalOffset`.
     */
    var cornerVerticalOffset: CGFloat
    
    /**
     Shadow is dynamic.
     This property configure most vertical offset when card up down side.
     */
    var maximumVerticalOffset: CGFloat
}
