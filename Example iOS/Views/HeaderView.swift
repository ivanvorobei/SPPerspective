import UIKit
import SparrowKit

class HeaderView: SPView {
    
    let whiteView = WhiteView()
    
    override func commonInit() {
        super.commonInit()
        backgroundColor = .clear
        addSubview(whiteView)
        frame.setHeight(400)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let minSide = min(frame.width, frame.height) * 0.7
        whiteView.frame = CGRect.init(x: 0, y: 0, width: minSide, height: minSide)
        whiteView.setToCenter()
        whiteView.center.y = whiteView.center.y * 0.94
    }
}
