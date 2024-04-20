//
//  UITableViewCell+Identifiers.swift
//
//
//  Created by Federico Bustos Fierro on 11/03/2022.
//

import Foundation
import UIKit

public extension UITableViewCell {
    static var identifier: String {
        String(describing: Self.self)
    }

    static func registerNib(on tableView: UITableView, bundle: Bundle?) {
        let nib = UINib(nibName: identifier, bundle: bundle)
        tableView.register(nib, forCellReuseIdentifier: identifier)
    }

    static func register(on tableView: UITableView) {
        tableView.register(Self.self, forCellReuseIdentifier: identifier)
    }
}

public extension UITableViewHeaderFooterView {
    static var identifier: String {
        String(describing: Self.self)
    }

    static func registerNib(on tableView: UITableView, bundle: Bundle?) {
        let nib = UINib(nibName: identifier, bundle: bundle)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: identifier)
    }
}

public protocol RegistrableInCollectionView {
    static func register(on collectionView: UICollectionView, bundle: Bundle?)
}

public extension UICollectionViewCell {
    static var identifier: String {
        String(describing: Self.self)
    }

    static func registerNib(on collectionView: UICollectionView, bundle: Bundle?) {
        let nib = UINib(nibName: identifier, bundle: bundle)
        collectionView.register(nib, forCellWithReuseIdentifier: identifier)
    }

    static func register(on collectionView: UICollectionView) {
        collectionView.register(Self.self, forCellWithReuseIdentifier: identifier)
    }
}

public extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        let identifier = T.identifier

        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Couldn't dequeue cell with identifier \(identifier)")
        }
        return cell
    }

    func dequeueReusableHeaderFooterCell<T: UITableViewHeaderFooterView>() -> T {
        let identifier = T.identifier

        guard let cell = dequeueReusableHeaderFooterView(withIdentifier: T.identifier) as? T else {
            fatalError("Couldn't dequeue cell with identifier \(identifier)")
        }
        return cell
    }
}

public extension UICollectionView {
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        let identifier = T.identifier
        guard let cell = dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Couldn't dequeue cell with identifier \(identifier)")
        }
        return cell
    }
}
