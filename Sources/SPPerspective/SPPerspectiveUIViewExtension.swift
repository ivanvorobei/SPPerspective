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

public extension UIView {
    
    /**
     Apple perspective and start animation.
     */
    func applyPerspectiveAnimation(_ style: SPPerspectiveAnimation) {
        switch style {
        case .iOS14Widget:
            let config = SPPerspectiveAnimationConfig(
                animationDuration: 2,
                distortionPerspective: 600,
                angle: 10,
                vectorStep: 3.14,
                shadowConfig: SPPerspectiveShadowConfig(
                    blurRadius: 19,
                    opacity: 0.25,
                    color: UIColor.black,
                    maximumHorizontalOffset: 14,
                    startVerticalOffset: 8,
                    cornerVerticalOffset: 20,
                    maximumVerticalOffset: 24
                )
            )
            applyPerspectiveConfig(config)
        case .custom(let config):
            applyPerspectiveConfig(config)
        }
    }
    
    fileprivate func applyPerspectiveConfig(_ config: SPPerspectiveAnimationConfig) {
        
        // Process 3D Animation
        
        let transformAnimation = CAKeyframeAnimation(keyPath: "transform")
        transformAnimation.duration = config.animationDuration
        transformAnimation.repeatCount = .infinity
        transformAnimation.fillMode = .forwards
        transformAnimation.isRemovedOnCompletion = false
        
        let distortion = config.distortionPerspective
        let angle = config.angle
        let step = config.vectorStep
        
        let transformValues = [
            makeTransform(distortion: distortion, angle: angle, vectorX: step * 2, vectorY: 0, vectorZ: 0),
            makeTransform(distortion: distortion, angle: angle, vectorX: step, vectorY: step, vectorZ: 0),
            makeTransform(distortion: distortion, angle: angle, vectorX: 0, vectorY: step * 2, vectorZ: 0),
            makeTransform(distortion: distortion, angle: angle, vectorX: -step, vectorY: step, vectorZ: 0),
            makeTransform(distortion: distortion, angle: angle, vectorX: -step * 2, vectorY: 0, vectorZ: 0),
            makeTransform(distortion: distortion, angle: angle, vectorX: -step, vectorY: -step, vectorZ: 0),
            makeTransform(distortion: distortion, angle: angle, vectorX: 0, vectorY: -step * 2, vectorZ: 0),
            makeTransform(distortion: distortion, angle: angle, vectorX: step, vectorY: -step, vectorZ: 0),
            makeTransform(distortion: distortion, angle: angle, vectorX: step * 2, vectorY: 0, vectorZ: 0)
        ]
        
        transformAnimation.values = transformValues
        
        let transformTimingStep = 1 / Double(transformValues.count - 1)
        var transformTimings: [NSNumber] = []
        for (index, _) in transformValues.enumerated() {
            transformTimings.append(NSNumber(value: transformTimingStep * Double(index)))
        }
        transformAnimation.keyTimes = transformTimings
        
        var transformTimingFunctions: [CAMediaTimingFunction] = []
        for _ in transformValues {
            let timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
            transformTimingFunctions.append(timingFunction)
        }
        transformAnimation.timingFunctions = transformTimingFunctions
        
        layer.add(transformAnimation, forKey: "SPPerspective - Transform")
        
        // Process shadow logic
        
        guard let shadowConfig = config.shadowConfig else { return }
        layer.shadowRadius = shadowConfig.blurRadius
        layer.shadowOpacity = Float(shadowConfig.opacity)
        layer.shadowColor = shadowConfig.color.cgColor
        
        let shadowAnimation = CAKeyframeAnimation(keyPath: "shadowOffset")
        shadowAnimation.duration = config.animationDuration
        shadowAnimation.repeatCount = .infinity
        shadowAnimation.fillMode = .forwards
        shadowAnimation.isRemovedOnCompletion = false
        
        let shadowOffsetValues = [
            CGSize(width: 0, height: shadowConfig.startVerticalOffset),
            CGSize(width: shadowConfig.maximumHorizontalOffset, height: shadowConfig.cornerVerticalOffset),
            CGSize(width: 0, height: shadowConfig.maximumVerticalOffset),
            CGSize(width: -shadowConfig.maximumHorizontalOffset, height: shadowConfig.cornerVerticalOffset),
            CGSize(width: 0, height: shadowConfig.startVerticalOffset)
        ]
        shadowAnimation.values = shadowOffsetValues
        
        let shadowTimingStep = 1 / Double(shadowOffsetValues.count - 1)
        var shadowTimings: [NSNumber] = []
        for (index, _) in shadowOffsetValues.enumerated() {
            shadowTimings.append(NSNumber(value: shadowTimingStep * Double(index)))
        }
        shadowAnimation.keyTimes = shadowTimings
        
        var shadowTimingFunctions: [CAMediaTimingFunction] = []
        for _ in transformValues {
            let timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
            shadowTimingFunctions.append(timingFunction)
        }
        shadowAnimation.timingFunctions = shadowTimingFunctions
        
        layer.add(shadowAnimation, forKey: "SPPerspectivShadow")
    }
    
    /**
     Create tranform buy distortion,
     angle in degres and vector values.
     */
    fileprivate func makeTransform(distortion: CGFloat, angle: CGFloat, vectorX: CGFloat, vectorY: CGFloat, vectorZ: CGFloat) -> CATransform3D {
        var rotationAndPerspectiveTransform : CATransform3D = CATransform3DIdentity
        rotationAndPerspectiveTransform.m34 = 1.0 / distortion
        rotationAndPerspectiveTransform = CATransform3DRotate(
            rotationAndPerspectiveTransform,
            CGFloat(angle * .pi / 180), vectorX, vectorY, vectorZ
        )
        return rotationAndPerspectiveTransform
    }
}
