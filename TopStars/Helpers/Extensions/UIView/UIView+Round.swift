//
//  UIView+Round.swift
//
//
//  Created by Federico Bustos Fierro on 15/03/2022.
//

import Foundation
import UIKit

public extension UIView {
    func round() {
        roundCorners(radius: frame.height / 2.0)
    }

    func roundCorners(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }

    /// Sets the corner radius to make all the parameter borders rounded.
    /// - Parameters:
    ///   - corners: The list of corners to round
    ///   - radius: The cornerRadius to set to the corners
    func round(corners: [SingularCorner], radius: CGFloat) {
        roundCorners(radius: radius)
        let layerCorners = corners.compactMap { $0.toCornerMask() }
        var maskedCorners: CACornerMask = []
        layerCorners.forEach { maskedCorners.insert($0) }
        layer.maskedCorners = maskedCorners
    }
    
    func addBorderGradient(
        startColor: UIColor,
        endColor: UIColor,
        lineWidth: CGFloat,
        startPoint: CGPoint,
        endPoint: CGPoint
    ) -> CALayer {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        
        let shape = CAShapeLayer()
        shape.lineWidth = lineWidth
        shape.path = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        
        gradient.mask = shape
        
        layer.addSublayer(gradient)
        
        return gradient
    }
}

public enum SingularCorner {
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight

    public func toCornerMask() -> CACornerMask {
        switch self {
        case .topLeft:
            return .layerMinXMinYCorner
        case .topRight:
            return .layerMaxXMinYCorner
        case .bottomLeft:
            return .layerMinXMaxYCorner
        case .bottomRight:
            return .layerMaxXMaxYCorner
        }
    }
}

public extension CGPoint {
    static let topLeft = CGPoint(x: 0, y: 0)
    static let topCenter = CGPoint(x: 0.5, y: 0)
    static let topRight = CGPoint(x: 1, y: 0)
    static let centerLeft = CGPoint(x: 0, y: 0.5)
    static let center = CGPoint(x: 0.5, y: 0.5)
    static let centerRight = CGPoint(x: 1, y: 0.5)
    static let bottomLeft = CGPoint(x: 0, y: 1.0)
    static let bottomCenter = CGPoint(x: 0.5, y: 1.0)
    static let bottomRight = CGPoint(x: 1, y: 1)
}
