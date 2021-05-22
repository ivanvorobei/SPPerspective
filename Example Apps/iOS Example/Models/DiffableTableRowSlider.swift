import UIKit
import SPDiffable

open class DiffableTableRowSlider: SPDiffableItem {
    
    public var value: Double
    public var minimumValue: Double
    public var maximumValue: Double
    public var text: String
    public var action: Action
    
    public init(identifier: String? = nil, text: String, value: Double, minimumValue: Double, maximumValue: Double, action: @escaping Action) {
        self.text = text
        self.value = value
        self.minimumValue = minimumValue
        self.maximumValue = maximumValue
        self.action = action
        super.init(identifier: identifier ?? text)
    }
    
    public typealias Action = (_ value: Double) -> Void
}
