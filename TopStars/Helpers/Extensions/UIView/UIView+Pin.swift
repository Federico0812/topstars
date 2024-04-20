//
//  UIView+Pin.swift
//
//
//  Created by Federico Bustos Fierro on 13/04/2022.
//

import UIKit

public extension UILayoutPriority {
    /// Almost Required: the highest possible non-required priority
    /// (well almost, priority is Float after all). Suited for use with trailing
    /// and bottom constraints of UITableView header and footer views
    /// (and UITableViewHeaderFooterView).
    static let almostRequired = UILayoutPriority(999)

    /// Almost None: the lowest possible priority for content-hugging
    static let almostNone = UILayoutPriority(1)
}

public extension UIView {
    /// Declarative Auto Layout helper. Does the same thing as creating a layout constraint but feels more intuitive.
    /// Also, it remembers to set translatesAutoresizingMaskIntoConstraints = false and allows you to set a constraint's
    /// priority all in a single method call.
    /// Plus you also don't have to worry about activating the constraint.
    /// - Returns: the created constraint in case you wish to hold onto it.
    @discardableResult
    func pin(
        _ attr1: NSLayoutConstraint.Attribute,
        to attr2: NSLayoutConstraint.Attribute = .notAnAttribute,
        of targetView: Any? = nil,
        relatedBy relation: NSLayoutConstraint.Relation = .equal,
        multiplier: CGFloat = 1,
        constant const: CGFloat = 0,
        priority: UILayoutPriority = .required,
        isActive: Bool = true,
        identifier: String? = nil
    ) -> NSLayoutConstraint {
        disableAutoConstraints()

        let constraint = NSLayoutConstraint(
            item: self,
            attribute: attr1,
            relatedBy: relation,
            toItem: targetView,
            attribute: attr2,
            multiplier: multiplier,
            constant: const
        )
        constraint.priority = priority
        constraint.isActive = isActive
        constraint.identifier = identifier
        return constraint
    }

    /// Sets `translatesAutoresizingMaskIntoConstraints` to false.
    func disableAutoConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
