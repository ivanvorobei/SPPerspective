import UIKit
import SparrowKit

class SliderTableViewCell: SPTableViewCell {
    
    static let reuseIdentifier: String = "SliderTableViewCell"
    
    lazy var titleLabel: SPLabel = {
        let label = SPLabel(text: "Title", style: .body)
        label.numberOfLines = 1
        contentView.addSubview(label)
        return label
    }()
    
    lazy var valueLabel: SPLabel = {
        let label = SPLabel(text: "Value", style: .body)
        label.numberOfLines = 1
        label.textColor = .secondaryLabel
        contentView.addSubview(label)
        return label
    }()
    
    var sliderAction: UIAction? = nil {
        willSet {
            if let sliderAction = self.sliderAction {
                self.slider.removeAction(sliderAction, for: .valueChanged)
            }
        }
        didSet {
            if let sliderAction = self.sliderAction {
                slider.addAction(sliderAction, for: .valueChanged)
            }
        }
    }
    
    lazy var slider: SPSlider = {
        let slider = SPSlider()
        contentView.addSubview(slider)
        return slider
    }()
    
    override func commonInit() {
        super.commonInit()
        selectionStyle = .none
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.sizeToFit()
        titleLabel.frame.origin.x = contentView.layoutMargins.left
        titleLabel.frame.origin.y = contentView.layoutMargins.top
        
        valueLabel.sizeToFit()
        valueLabel.frame.setWidth(contentView.frame.width - titleLabel.frame.origin.x)
        valueLabel.center.y = titleLabel.center.y
        valueLabel.frame.origin.x = titleLabel.frame.maxX + 6
        
        slider.sizeToFit()
        slider.frame.setWidth(contentView.layoutWidth)
        slider.frame.origin.x = contentView.layoutMargins.left
        slider.frame.origin.y = titleLabel.frame.maxY + 8
        
        slider.layoutSubviews()
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        layoutSubviews()
        let superSize = super.sizeThatFits(size)
        return CGSize.init(width: superSize.width, height: slider.frame.maxY + contentView.layoutMargins.bottom)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()

    }
}
