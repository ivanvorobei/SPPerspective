import UIKit

class WhiteView: UIView {
    
    init() {
        super.init(frame: .zero)
        layer.cornerRadius = 17
        backgroundColor = .secondarySystemGroupedBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
