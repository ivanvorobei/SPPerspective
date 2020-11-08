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
import SparrowKit
import SPAlert
import SPDiffable

class ExampleAnimationController: SPDiffableTableController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        navigationItem.title = "SPPerspective"
        navigationItem.rightBarButtonItem = .init(
            title: nil, image: UIImage.init(systemName: "ellipsis.circle.fill"),
            primaryAction: UIAction.init(handler: { (_) in
                let alertController = UIAlertController.init(title: "Choose ready-use config", message: "This list of availalbe configs. You can choose and apply any of its.", preferredStyle: .actionSheet)
                for model in self.defaultConfigs {
                    alertController.addAction(title: model.name, style: .default) { (_) in
                        if let configuration = model.config as? SPPerspectiveAnimationConfig {
                            self.animationConfig = configuration
                            self.animatable = true
                            SPAlert.present(title: "Applied iOS 14 animatable", preset: .done)
                        }
                        if let configuration = model.config as? SPPerspectiveStaticConfig {
                            self.staticConfig = configuration
                            self.animatable = false
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
        
        setCellProviders([SPDiffableTableCellProviders.default], sections: content)
        
        let headerView = HeaderView()
        headerView.frame.setHeight(400)
        tableView.tableHeaderView = headerView
    }
    
    private var content: [SPDiffableSection] {
        
        var content: [SPDiffableSection] = []
        
        let animatableSection = SPDiffableSection(
            identifier: Section.animatable.identifier,
            header: nil,
            footer: nil,
            items: [
                SPDiffableTableRowSwitch(
                    identifier: animatableSwitchKey, text: "Animatable", icon: nil, isOn: animatable, action: { [weak self] (isOn) in
                        guard let self = self else { return }
                        self.animatable = isOn
                    })
            ])
        content.append(animatableSection)
        
        
        if animatable {
            let animationConfigSection = SPDiffableSection(
                identifier: Section.animationConfiguration.identifier,
                header: nil,
                footer: nil,
                items: [
                    SPDiffableTableRow(text: "Example 1"),
                    SPDiffableTableRow(text: "Example 2"),
                    SPDiffableTableRow(text: "Example 3")
                ])
            content.append(animationConfigSection)
        } else {
            let staticConfigSection = SPDiffableSection(
                identifier: Section.staticConfiguration.identifier,
                header: nil,
                footer: nil,
                items: [
                    SPDiffableTableRow(text: "Example 4"),
                    SPDiffableTableRow(text: "Example 5")
                ])
            content.append(staticConfigSection)
        }
        return content
    }
    
    fileprivate func updateContent(animated: Bool) {
        diffableDataSource?.apply(content, animating: animated)
        if let headerView = tableView.tableHeaderView as? HeaderView {
            headerView.whiteView.applyPerspective(animatable ? animationConfig : staticConfig)
        }
        if let indexPath = diffableDataSource?.indexPath(for: animatableSwitchKey), let cell = tableView.cellForRow(at: indexPath), let `switch` = cell.accessoryView as? SPDiffableSwitch {
            `switch`.setOn(animatable, animated: true)
        }
    }
    
    // MARK: - Properties
    
    var animatable: Bool = true {
        didSet {
            self.updateContent(animated: true)
        }
    }
    
    var animationConfig: SPPerspectiveAnimationConfig = .iOS14WidgetAnimatable
    
    var staticConfig: SPPerspectiveStaticConfig = .iOS14WidgetStatic
    
    let defaultConfigs: [ConfigurationModel] = [
        ConfigurationModel(name: "iOS 14 Widget Static", config: .iOS14WidgetStatic),
        ConfigurationModel(name: "iOS 14 Widget Animatable", config: .iOS14WidgetAnimatable)
    ]
    
    // MARK: - Data
    
    enum Section: String {
        
        case animatable
        case animationConfiguration
        case staticConfiguration
        
        var identifier: String { return rawValue }
    }
    
    var animatableSwitchKey: String { return "animatable-switch" }
    
    // MARK: - Init
    
    init() {
        super.init(style: .insetGrouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
