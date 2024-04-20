//
//  UIView+PinEdges.swift
//
//
//  Created by Federico Bustos Fierro on 13/04/2022.
//

import UIKit

public struct Edges: OptionSet {
    public var rawValue: UInt

    public init(rawValue: UInt) {
        self.rawValue = rawValue
    }

    public static var top: Edges { Edges(rawValue: 1 << 0) }
    public static var leading: Edges { Edges(rawValue: 1 << 1) }
    public static var bottom: Edges { Edges(rawValue: 1 << 2) }
    public static var trailing: Edges { Edges(rawValue: 1 << 3) }
    public static var all: Edges { [.top, .leading, .bottom, .trailing] }

    public static var horizontal: Edges { [.leading, .trailing] }
    public static var vertical: Edges { [.top, .bottom] }

    public static var notTop: Edges { [.leading, .bottom, .trailing] }
    public static var notLeading: Edges { [.top, .bottom, .trailing] }
    public static var notBottom: Edges { [.top, .leading, .trailing] }
    public static var notTrailing: Edges { [.top, .leading, .bottom] }
}

// The pinEdges functions are lengthy primarily because of our rules on line length
// and multi-argument parameters, not because they are inherently complex.

// swiftlint:disable function_body_length

public extension UIView {
    /// Helper UIView method to pin it's edges.
    /// - Parameters:
    ///   - edges: Which edges to pin. See `Edges` OptionSet.
    ///   - targetView: Optional view to pin the edges of `self` to. If `nil` this will use the `self.superview`.
    ///   - relation: The relation between the two attributes in the constraint.
    ///   - insets: The insets to set in the constraints.
    ///   - priority: The priority of the constraint.
    ///   - isActive: The active state of the constraint.
    /// - Returns: The constraint.
    @discardableResult
    func pinEdges(
        _ edges: Edges = .all,
        to targetView: Any? = nil,
        relatedBy relation: NSLayoutConstraint.Relation = .equal,
        withInsets insets: UIEdgeInsets = .zero,
        priority: UILayoutPriority = .required,
        isActive: Bool = true,
        identifierPrefix: String? = nil
    ) -> [NSLayoutConstraint] {
        var constraints: [NSLayoutConstraint] = []

        let invertedRelation: NSLayoutConstraint.Relation
        switch relation {
        case .lessThanOrEqual:
            invertedRelation = .greaterThanOrEqual
        case .equal:
            invertedRelation = relation
        case .greaterThanOrEqual:
            invertedRelation = .lessThanOrEqual
        @unknown default:
            invertedRelation = relation
        }

        if edges.contains(.top) {
            constraints.append(pin(
                .top,
                to: .top,
                of: targetView ?? superview,
                relatedBy: relation,
                constant: insets.top,
                priority: priority,
                isActive: isActive,
                identifier: identifierPrefix.flatMap { $0 + "-top" }
            ))
        }

        if edges.contains(.leading) {
            constraints.append(pin(
                .leading,
                to: .leading,
                of: targetView ?? superview,
                relatedBy: relation,
                constant: insets.left,
                priority: priority,
                isActive: isActive,

                identifier: identifierPrefix.flatMap { $0 + "-leading" }
            ))
        }

        if edges.contains(.bottom) {
            constraints.append(pin(
                .bottom,
                to: .bottom,
                of: targetView ?? superview,
                relatedBy: invertedRelation,
                constant: -insets.bottom,
                priority: priority,
                isActive: isActive,
                identifier: identifierPrefix.flatMap { $0 + "-bottom" }

            ))
        }

        if edges.contains(.trailing) {
            constraints.append(pin(
                .trailing,
                to: .trailing,
                of: targetView ?? superview,
                relatedBy: invertedRelation,
                constant: -insets.right,
                priority: priority,
                isActive: isActive,
                identifier: identifierPrefix.flatMap { $0 + "-trailing" }

            ))
        }

        return constraints
    }

    /// Helper UIView method to pin it's edges to margins.
    /// - Parameters:
    ///   - edges: Which edges to pin. See `Edges` OptionSet.
    ///   - targetView: Optional view to pin the edges of `self` to. If `nil` this will use the `self.superview`.
    ///   - relation: The relation between the two attributes in the constraint.
    ///   - insets: The insets to set in the constraints.
    ///   - priority: The priority of the constraint.
    ///   - isActive: The active state of the constraint.
    /// - Returns: The constraint.
    @discardableResult
    func pinEdgesToMargins(
        _ edges: Edges = .all,
        to targetView: Any? = nil,
        relatedBy relation: NSLayoutConstraint.Relation = .equal,
        withInsets insets: UIEdgeInsets = .zero,
        priority: UILayoutPriority = .required,
        isActive: Bool = true
    ) -> [NSLayoutConstraint] {
        var constraints: [NSLayoutConstraint] = []

        let invertedRelation: NSLayoutConstraint.Relation
        switch relation {
        case .lessThanOrEqual:
            invertedRelation = .greaterThanOrEqual
        case .equal:
            invertedRelation = relation
        case .greaterThanOrEqual:
            invertedRelation = .lessThanOrEqual
        @unknown default:
            invertedRelation = relation
        }

        if edges.contains(.top) {
            constraints.append(pin(
                .top,
                to: .topMargin,
                of: targetView ?? superview,
                relatedBy: relation,
                constant: insets.top,
                priority: priority,
                isActive: isActive
            ))
        }

        if edges.contains(.leading) {
            constraints.append(pin(
                .leading,
                to: .leadingMargin,
                of: targetView ?? superview,
                relatedBy: relation,
                constant: insets.left,
                priority: priority,
                isActive: isActive
            ))
        }

        if edges.contains(.bottom) {
            constraints.append(pin(
                .bottom,
                to: .bottomMargin,
                of: targetView ?? superview,
                relatedBy: invertedRelation,
                constant: -insets.bottom,
                priority: priority,
                isActive: isActive
            ))
        }

        if edges.contains(.trailing) {
            constraints.append(pin(
                .trailing,
                to: .trailingMargin,
                of: targetView ?? superview,
                relatedBy: invertedRelation,
                constant: -insets.right,
                priority: priority,
                isActive: isActive
            ))
        }

        return constraints
    }

    /// Helper UIView method to pin it's margins.
    /// - Parameters:
    ///   - edges: Which edges to pin. See `Edges` OptionSet.
    ///   - targetView: Optional view to pin the edges of `self` to. If `nil` this will use the `self.superview`.
    ///   - relation: The relation between the two attributes in the constraint.
    ///   - insets: The insets to set in the constraints.
    ///   - priority: The priority of the constraint.
    ///   - isActive: The active state of the constraint.
    /// - Returns: The constraint.
    @discardableResult
    func pinMargins(
        _ edges: Edges = .all,
        to targetView: Any? = nil,
        relatedBy relation: NSLayoutConstraint.Relation = .equal,
        withInsets insets: UIEdgeInsets = .zero,
        priority: UILayoutPriority = .required,
        isActive: Bool = true
    ) -> [NSLayoutConstraint] {
        var constraints: [NSLayoutConstraint] = []

        let invertedRelation: NSLayoutConstraint.Relation
        switch relation {
        case .lessThanOrEqual:
            invertedRelation = .greaterThanOrEqual
        case .equal:
            invertedRelation = relation
        case .greaterThanOrEqual:
            invertedRelation = .lessThanOrEqual
        @unknown default:
            invertedRelation = relation
        }

        if edges.contains(.top) {
            constraints.append(pin(
                .topMargin,
                to: .topMargin,
                of: targetView ?? superview,
                relatedBy: relation,
                constant: insets.top,
                priority: priority,
                isActive: isActive
            ))
        }

        if edges.contains(.leading) {
            constraints.append(pin(
                .leadingMargin,
                to: .leadingMargin,
                of: targetView ?? superview,
                relatedBy: relation,
                constant: insets.left,
                priority: priority,
                isActive: isActive
            ))
        }

        if edges.contains(.bottom) {
            constraints.append(pin(
                .bottomMargin,
                to: .bottomMargin,
                of: targetView ?? superview,
                relatedBy: invertedRelation,
                constant: -insets.bottom,
                priority: priority,
                isActive: isActive
            ))
        }

        if edges.contains(.trailing) {
            constraints.append(pin(
                .trailingMargin,
                to: .trailingMargin,
                of: targetView ?? superview,
                relatedBy: invertedRelation,
                constant: -insets.right,
                priority: priority,
                isActive: isActive
            ))
        }

        return constraints
    }
}
