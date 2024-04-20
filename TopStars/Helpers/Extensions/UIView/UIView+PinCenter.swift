//
//  UIView+PinCenter.swift
//
//
//  Created by Federico Bustos Fierro on 13/04/2022.
//

import UIKit

public struct Center: OptionSet {
    public var rawValue: UInt

    public init(rawValue: UInt) {
        self.rawValue = rawValue
    }

    public static var centerX: Center { Center(rawValue: 1 << 0) }
    public static var centerY: Center { Center(rawValue: 1 << 1) }
    public static var center: Center { [.centerX, .centerY] }
}

public extension UIView {
    /// Helper UIView method to pin it's center.
    /// - Parameters:
    ///   - center: OptionSet to decide which center to pin. See `Center`.
    ///   - targetView: Optional view to pin the edges of `self` to. If `nil` this will use the `self.superview`.
    ///   - offset: UIOffset to set to the constraint.
    ///   - priority: The priority of the constraint.
    ///   - isActive: The active state of the constraint.
    /// - Returns: The constraint.
    @discardableResult
    func pinCenter(
        _ center: Center = .center,
        to targetView: Any? = nil,
        withOffset offset: UIOffset = .zero,
        priority: UILayoutPriority = .required,
        isActive: Bool = true
    ) -> (centerX: NSLayoutConstraint?, centerY: NSLayoutConstraint?) {
        var centerX: NSLayoutConstraint?, centerY: NSLayoutConstraint?

        if center.contains(.centerX) {
            centerX = pin(
                .centerX,
                to: .centerX,
                of: targetView ?? superview,
                constant: offset.horizontal,
                priority: priority,
                isActive: isActive
            )
        }

        if center.contains(.centerY) {
            centerY = pin(
                .centerY,
                to: .centerY,
                of: targetView ?? superview,
                constant: offset.vertical,
                priority: priority,
                isActive: isActive
            )
        }

        return (centerX: centerX, centerY: centerY)
    }
}
