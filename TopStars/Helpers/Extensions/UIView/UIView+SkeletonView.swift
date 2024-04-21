//
//  UIView+SkeletonView.swift
//
//
//  Created by Federico Bustos Fierro on 21/04/2024.
//

import Foundation
import UIKit

extension UIView {

    @objc func gradientLayer() -> CAGradientLayer {
        let baseColor: CGColor = UIColor(named: "ShimmerGray")!.cgColor
        let shineColor: CGColor = UIColor(named: "ShimmerShine")!.cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.colors = [baseColor, shineColor, baseColor]
        gradientLayer.locations = [0.0, 0.5, 1.0]
        gradientLayer.setValue(UIView.skeletonLayerKey, forKey: "skeletonLayerKey")

        return gradientLayer
    }
    
    func addAnimationLayer() {
        let gradientLayer = self.gradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = (layer.cornerRadius > 0) ? layer.cornerRadius : bounds.size.height / 2
        gradientLayer.zPosition = 30

        layer.addSublayer(gradientLayer)
        
        let waitAnimation = waitAnimation()
        let shineAnimation = shineAnimation()
        let group = CAAnimationGroup()
        group.animations = [waitAnimation, shineAnimation]
        group.duration = Self.animationDuration + Self.waitTime
        group.repeatCount = 100

        gradientLayer.add(group, forKey: shineAnimation.keyPath)
    }
}

private extension UIView {
    static var skeletonLayerKey = "skeletonLayerKey"
    static var animationDuration = 3.0
    static var waitTime = 3.0
    static var shineBoldness = 1.5
    static var effectSlowness = 1.0

    func waitAnimation() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [-2.0, -1.5, -1.0]
        animation.toValue = [-1.0, -0.5, 0.0]
        animation.duration = 0
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false

        return animation
    }

    func shineAnimation() -> CABasicAnimation {
        let screenRatio = bounds.size.width / UIScreen.main.bounds.width
        let normalizedShrink = 1 - screenRatio / Self.shineBoldness
        let animation = CABasicAnimation(keyPath: "locations")
        let gap = 0.5 * normalizedShrink
        let fromCenter = -0.5
        let toCenter = 1.5
        animation.fromValue = [fromCenter - gap, fromCenter, fromCenter + gap]
        animation.toValue = [toCenter - gap, toCenter, toCenter + gap]

        let convertedFrame = convert(bounds, to: nil)
        let xOffset = convertedFrame.origin.x
        let normalizedBeginTime = xOffset / UIScreen.main.bounds.width
        animation.beginTime = Self.animationDuration * normalizedBeginTime * 0.8
        let normalizedDuration = screenRatio
        animation.duration = Self.animationDuration * normalizedDuration + Self.effectSlowness
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        return animation
    }

    func removeSkeletonView() {
        let skeletonLayers = layer.sublayers?.filter { $0.value(forKey: "skeletonLayerKey") != nil }
        skeletonLayers?.forEach { $0.removeFromSuperlayer() }
    }
}
