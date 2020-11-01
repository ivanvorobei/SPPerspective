// The MIT License (MIT)
// Copyright © 2020 Ivan Vorobei (varabeis@icloud.com)
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

import UIKit

class ExampleAnimationController: UIViewController {
    
    let whiteView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        navigationItem.title = "SPPerspective"
        
        whiteView.layer.cornerRadius = 17
        whiteView.backgroundColor = .systemBackground
        view.addSubview(whiteView)
        
        // Animatable
        whiteView.applyPerspective(.iOS14WidgetAnimatable)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let minSideController = min(view.frame.width - view.layoutMargins.right - view.layoutMargins.left, view.frame.height - view.layoutMargins.top - view.layoutMargins.bottom)
        let side: CGFloat = min(minSideController * 0.8, 300)
        whiteView.frame = CGRect.init(x: 0, y: 140, width: side, height: side)
        whiteView.center = CGPoint.init(x: view.center.x, y: view.layoutMargins.top + (view.frame.height - view.layoutMargins.top - view.layoutMargins.bottom) / 2)
        
        if view.frame.width < view.frame.height {
            whiteView.center.y = whiteView.center.y - 40
        }
        
        whiteView.center.x = view.frame.width / 2
    }
}
