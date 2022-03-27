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

import UIKit
import SparrowKit
import SPAlert
import SPDiffable
import SPPerspective

class ExampleAnimationController: SPDiffableTableController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        navigationItem.title = "SPPerspective"
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
        tableView.cellLayoutMarginsFollowReadableWidth = true
        tableView.register(SliderTableViewCell.self)
        tableView.tableHeaderView = HeaderView()
        
        setCellProviders(SPDiffableTableCellProviders.default + [extendCellProvider], sections: content)
        updatePreviewAndContent()
    }
    
    /**
     Generate table content.
     */
    private var content: [SPDiffableSection] {
        
        var content: [SPDiffableSection] = []
        
        // Animatable
        
        let animatableSection = SPDiffableSection(
            identifier: Section.animatable.identifier,
            header: nil,
            footer: SPDiffableTextHeaderFooter(text: "You can set as animatabe or not style. With animation you can change duration."),
            items: [
                SPDiffableTableRowSwitch(
                    identifier: Section.Row.animatableSwitch.identifier,
                    text: "Animatable", icon: nil,
                    isOn: animatable,
                    action: { [weak self] (isOn) in
                        guard let self = self else { return }
                        self.animatable = isOn
                    }),
                SPDiffableTableRow(
                    identifier: Section.Row.fromCorner.identifier,
                    text: "Higlight Corner",
                    detail: self.fromCorner.rawValue,
                    icon: nil,
                    accessoryType: .none,
                    selectionStyle: .none,
                    action: { [weak self] _ , _  in
                        guard let self = self else { return }
                        guard let next = SPPerspectiveHighlightCorner.order(from: self.fromCorner, direction: .forward)[safe: 1] else { return }
                        self.fromCorner = next
                        if let cell = self.diffableDataSource?.cell(SPDiffableTableViewCell.self, for: Section.Row.fromCorner.identifier) {
                            cell.detailTextLabel?.text = self.fromCorner.rawValue
                        }
                    }
                )
            ])
        content.append(animatableSection)
        
        if animatable {
            let animationSection = SPDiffableSection(
                identifier: Section.animation.identifier,
                header: SPDiffableTextHeaderFooter(text: "Animation"),
                footer: nil,
                items: [
                    DiffableTableRowSlider(
                        identifier: Section.Row.animationDuration.identifier,
                        text: "Duration",
                        value: Double(animationDuration),
                        minimumValue: Double(0.5),
                        maximumValue: Double(25),
                        action: { [weak self] (value) in
                            guard let self = self else { return }
                            self.animationDuration = TimeInterval(value)
                        })
                ])
            content.append(animationSection)
        }
        
        // Transform
        
        let transformConfigSection = SPDiffableSection(
            identifier: Section.transformConfiguration.identifier,
            header: SPDiffableTextHeaderFooter(text: "Transforms"),
            footer: SPDiffableTextHeaderFooter(text: "Angle change amount of rotation degress. Perspective change visible distortion."),
            items: [
                DiffableTableRowSlider(
                    identifier: Section.Row.distortionPerspective.identifier,
                    text: "Perspective",
                    value: Double(distortionPerspective),
                    minimumValue: Double(0),
                    maximumValue: Double(1500),
                    action: { [weak self] (value) in
                        guard let self = self else { return }
                        self.distortionPerspective = CGFloat(value)
                    }),
                DiffableTableRowSlider(
                    identifier: Section.Row.angle.identifier,
                    text: "Angle",
                    value: Double(angle),
                    minimumValue: Double(0),
                    maximumValue: Double(150),
                    action: { [weak self] (value) in
                        guard let self = self else { return }
                        self.angle = CGFloat(value)
                    })
            ])
        content.append(transformConfigSection)
        
        // Shadow
        
        let shadowSection = SPDiffableSection(
            identifier: Section.shadowConfiguration.identifier,
            header: SPDiffableTextHeaderFooter(text: "Shadow"),
            footer: SPDiffableTextHeaderFooter(text: "You should set the following values in increment: [Start Vertical offset, Corner Vertical offset, Maximum Vertical offset]. Horizontall offset you can set any."),
            items: [
                DiffableTableRowSlider(
                    identifier: Section.Row.shadowBlurRadius.identifier,
                    text: "Blur Radius",
                    value: Double(shadowBlurRadius),
                    minimumValue: Double(0),
                    maximumValue: Double(30),
                    action: { [weak self] (value) in
                        guard let self = self else { return }
                        self.shadowBlurRadius = CGFloat(value)
                    }),
                DiffableTableRowSlider(
                    identifier: Section.Row.shadowOpacity.identifier,
                    text: "Opacity",
                    value: Double(shadowOpacity),
                    minimumValue: Double(0),
                    maximumValue: Double(1),
                    action: { [weak self] (value) in
                        guard let self = self else { return }
                        self.shadowOpacity = CGFloat(value)
                    }),
                DiffableTableRowSlider(
                    identifier: Section.Row.shadowMaximumHorizontalOffset.identifier,
                    text: "Maximum Horizontal Offset",
                    value: Double(shadowMaximumHorizontalOffset),
                    minimumValue: Double(0),
                    maximumValue: Double(100),
                    action: { [weak self] (value) in
                        guard let self = self else { return }
                        self.shadowMaximumHorizontalOffset = CGFloat(value)
                    }),
                DiffableTableRowSlider(
                    identifier: Section.Row.shadowStartVerticalOffset.identifier,
                    text: "Start Vertical Offset",
                    value: Double(shadowStartVerticalOffset),
                    minimumValue: Double(-10),
                    maximumValue: Double(50),
                    action: { [weak self] (value) in
                        guard let self = self else { return }
                        self.shadowStartVerticalOffset = CGFloat(value)
                    }),
                DiffableTableRowSlider(
                    identifier: Section.Row.shadowCornerVerticalOffset.identifier,
                    text: "Corner Vertical Offset",
                    value: Double(shadowCornerVerticalOffset),
                    minimumValue: Double(-10),
                    maximumValue: Double(50),
                    action: { [weak self] (value) in
                        guard let self = self else { return }
                        self.shadowCornerVerticalOffset = CGFloat(value)
                    }),
                DiffableTableRowSlider(
                    identifier: Section.Row.shadowMaximumVerticalOffset.identifier,
                    text: "Maximum Vertical Offset",
                    value: Double(shadowMaximumVerticalOffset),
                    minimumValue: Double(-10),
                    maximumValue: Double(50),
                    action: { [weak self] (value) in
                        guard let self = self else { return }
                        self.shadowMaximumVerticalOffset = CGFloat(value)
                    })
            ])
        content.append(shadowSection)
        
        return content
    }
    
    // MARK: - Properties
    
    var animatable = true
    { didSet { self.updatePreviewAndContent() } }
    
    var fromCorner = SPPerspectiveHighlightCorner.topLeft
    { didSet { self.updatePreviewAndContent() } }
    
    var animationDuration = SPPerspectiveConfig.iOS14WidgetAnimatable.animationDuration
    { didSet { self.updatePreviewAndContent() } }
    
    var distortionPerspective = SPPerspectiveConfig.iOS14WidgetStatic.distortionPerspective
    { didSet { self.updatePreviewAndContent() } }
    
    var angle = SPPerspectiveConfig.iOS14WidgetStatic.angle
    { didSet { self.updatePreviewAndContent() } }
    
    var shadowBlurRadius = SPPerspectiveConfig.iOS14WidgetStatic.shadowConfig?.blurRadius ?? 0
    { didSet { self.updatePreviewAndContent() } }
    
    var shadowOpacity = SPPerspectiveConfig.iOS14WidgetStatic.shadowConfig?.opacity ?? 0
    { didSet { self.updatePreviewAndContent() } }
    
    var shadowMaximumHorizontalOffset = SPPerspectiveConfig.iOS14WidgetStatic.shadowConfig?.maximumHorizontalOffset ?? 0
    { didSet { self.updatePreviewAndContent() } }
    
    var shadowStartVerticalOffset = SPPerspectiveConfig.iOS14WidgetStatic.shadowConfig?.startVerticalOffset ?? 0
    { didSet { self.updatePreviewAndContent() } }
    
    var shadowCornerVerticalOffset = SPPerspectiveConfig.iOS14WidgetStatic.shadowConfig?.cornerVerticalOffset ?? 0
    { didSet { self.updatePreviewAndContent() } }
    
    var shadowMaximumVerticalOffset = SPPerspectiveConfig.iOS14WidgetStatic.shadowConfig?.maximumVerticalOffset ?? 0
    { didSet { self.updatePreviewAndContent() } }
    
    // MARK: - Data
    
    private let defaultConfigs: [ConfigurationModel] = [
        ConfigurationModel(name: "iOS 14 Widget Static", config: .iOS14WidgetStatic),
        ConfigurationModel(name: "iOS 14 Widget Animatable", config: .iOS14WidgetAnimatable)
    ]
    
    /**
     Cell Provider for slider table cell.
     */
    private var extendCellProvider: SPDiffableTableCellProvider {
        let cellProvider: SPDiffableTableCellProvider = { [weak self] (tableView, indexPath, item) -> UITableViewCell? in
            guard let self = self else { return nil }
            switch item {
            case let model as DiffableTableRowSlider:
                let cell = tableView.dequeueReusableCell(withClass: SliderTableViewCell.self, for: indexPath)
                self.configure(cell: cell, by: model)
                return cell
            default:
                break
            }
            return nil
        }
        return cellProvider
    }
    
    private var rightBarButtonItem: UIBarButtonItem {
        return UIBarButtonItem.init(
            title: nil, image: UIImage.init(systemName: "ellipsis.circle.fill"),
            primaryAction: UIAction.init(handler: { (_) in
                let alertController = UIAlertController.init(title: "Choose ready-use config", message: "This list of availalbe configs. You can choose and apply any of its.", preferredStyle: .actionSheet)
                for model in self.defaultConfigs {
                    alertController.addAction(title: model.name, style: .default) { (_) in
                        let apply: (SPPerspectiveConfig) -> Void = { [weak self] config in
                            guard let self = self else { return }
                            self.distortionPerspective = config.distortionPerspective
                            self.angle = config.angle
                            self.shadowOpacity = config.shadowConfig?.opacity ?? 0
                            self.shadowBlurRadius = config.shadowConfig?.blurRadius ?? 0
                            self.shadowMaximumHorizontalOffset = config.shadowConfig?.maximumHorizontalOffset ?? 0
                            self.shadowStartVerticalOffset = config.shadowConfig?.startVerticalOffset ?? 0
                            self.shadowCornerVerticalOffset = config.shadowConfig?.cornerVerticalOffset ?? 0
                            self.shadowMaximumVerticalOffset = config.shadowConfig?.maximumVerticalOffset ?? 0
                        }
                        
                        if let configuration = model.config as? SPPerspectiveAnimationConfig {
                            self.animatable = true
                            self.animationDuration = configuration.animationDuration
                            apply(configuration)
                            SPAlert.present(title: "Applied iOS 14 animatable", preset: .done)
                        }
                        
                        if let configuration = model.config as? SPPerspectiveStaticConfig {
                            self.animatable = false
                            apply(configuration)
                            SPAlert.present(title: "Applied iOS 14 static", preset: .done)
                        }
                    }
                }
                alertController.addAction(title: "Cancel", style: .cancel, handler: nil)
                alertController.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
                self.present(alertController)
            }),
            menu: nil
        )
    }
    
    // MARK: - Helpers
    
    private func configure(cell: SliderTableViewCell, by model: DiffableTableRowSlider) {
        cell.slider.minimumValue = Float(model.minimumValue)
        cell.slider.minimumTrackLabel.text = "\(Int(model.minimumValue))"
        cell.slider.maximumValue = Float(model.maximumValue)
        cell.slider.maximumTrackLabel.text = "\(Int(model.maximumValue))"
        cell.slider.value = Float(model.value)
        cell.titleLabel.text = model.text
        cell.valueLabel.text = "\(round(cell.slider.value * 10) / 10)"
        cell.sliderAction = UIAction.init(handler: { [weak self] (action) in
            guard let _ = self else { return }
            cell.valueLabel.text = "\(round(cell.slider.value * 10) / 10)"
            model.action(Double(cell.slider.value))
        })
        cell.layoutSubviews()
    }
    
    /**
     Using for update preview and update sliders and values on cells.
     */
    fileprivate func updatePreviewAndContent() {
        diffableDataSource?.apply(content, animated: true)
        if let indexPath = diffableDataSource?.indexPath(for: Section.Row.animatableSwitch.identifier), let cell = tableView.cellForRow(at: indexPath), let `switch` = cell.accessoryView as? SPDiffableSwitch {
            `switch`.setOn(self.animatable, animated: true)
        }
        
        // Update all cells with slider to new data.
        for indexPath in tableView.indexPathsForVisibleRows ?? [] {
            guard let model = diffableDataSource?.item(for: indexPath) as? DiffableTableRowSlider else { continue }
            guard let cell = diffableDataSource?.cell(SliderTableViewCell.self, for: model.identifier) else { continue }
            self.configure(cell: cell, by: model)
        }
        
        if let headerView = tableView.tableHeaderView as? HeaderView {
            let config: SPPerspectiveConfig = { [weak self] in
                guard let self = self else { return SPPerspectiveConfig.iOS14WidgetStatic }
                if animatable {
                    let config = SPPerspectiveConfig.iOS14WidgetAnimatable
                    config.animationDuration = self.animationDuration
                    config.fromCorner = self.fromCorner
                    return config
                } else {
                    let config = SPPerspectiveConfig.iOS14WidgetStatic
                    config.corner = self.fromCorner
                    return config
                }
            }()
            config.distortionPerspective = distortionPerspective
            config.angle = angle
            config.shadowConfig?.blurRadius = shadowBlurRadius
            config.shadowConfig?.opacity = shadowOpacity
            config.shadowConfig?.maximumHorizontalOffset = shadowMaximumHorizontalOffset
            config.shadowConfig?.startVerticalOffset = shadowStartVerticalOffset
            config.shadowConfig?.cornerVerticalOffset = shadowCornerVerticalOffset
            config.shadowConfig?.maximumVerticalOffset = shadowMaximumVerticalOffset
            headerView.whiteView.applyPerspective(config)
        }
    }
    
    // MARK: - Models
    
    enum Section: String {
        
        case animatable
        case animation
        case transformConfiguration
        case shadowConfiguration
        
        var identifier: String { return rawValue }
        
        enum Row: String, CaseIterable {
            
            case animatableSwitch
            case fromCorner
            case animationDuration
            case distortionPerspective
            case angle
            case shadowBlurRadius
            case shadowOpacity
            case shadowMaximumHorizontalOffset
            case shadowStartVerticalOffset
            case shadowCornerVerticalOffset
            case shadowMaximumVerticalOffset
            
            var identifier: String { return rawValue }
        }
    }
    
    // MARK: - Init
    
    init() {
        super.init(style: .insetGrouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
