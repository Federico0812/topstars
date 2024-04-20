//
//  UIView+PinSize.swift
//
//
//  Created by Federico Bustos Fierro on 13/04/2022.
//

import UIKit

public extension UIView {
    /// Helper UIView method to pin it's size.
    /// - Parameters:
    ///   - dimension: The constant to apply for the height and width.
    ///   - relation: The relation between the two attributes in the constraint.
    ///   - priority: The priority of the constraint.
    /// - Returns: The constraint.
    @discardableResult
    func pinSize(
        _ dimension: CGFloat,
        relatedBy relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> (width: NSLayoutConstraint, height: NSLayoutConstraint) {
        pinSize(CGSize(width: dimension, height: dimension), relatedBy: relation, priority: priority)
    }

    /// Helper UIView method to pin it's size.
    /// - Parameters:
    ///   - size: CGSize to apply to the view.
    ///   - relation: The relation between the two attributes in the constraint.
    ///   - priority: The priority of the constraint.
    /// - Returns: The constraint.
    @discardableResult
    func pinSize(
        _ size: CGSize,
        relatedBy relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> (width: NSLayoutConstraint, height: NSLayoutConstraint) {
        let width = pin(.width, relatedBy: relation, constant: size.width, priority: priority)
        let height = pin(.height, relatedBy: relation, constant: size.height, priority: priority)
        return (width: width, height: height)
    }
}
