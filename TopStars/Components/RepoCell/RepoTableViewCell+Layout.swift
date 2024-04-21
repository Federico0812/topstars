//
//  RepoTableViewCell+View.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 20/04/2024.
//

import Foundation
import UIKit

extension RepoTableViewCell {
    func setUpView() {
        selectionStyle = .none
        contentView.clipsToBounds = true
        setUpHeaderView()
        setUpBodyView()
    }
    
    private func setUpHeaderView() {
        contentView.addSubview(headerView)
        headerView.pinEdges(.notBottom)
        headerView.pin(.height, constant: ViewConstants.headerHeight)
    }
    
    private func setUpBodyView() {
        contentView.addSubview(bodyView)
        bodyView.pin(.top, to: .bottom, of: headerView)
        bodyView.pin(.left, to: .left, of: contentView)
        bodyView.pin(.right, to: .right, of: contentView)
        bodyView.pin(.height, constant: ViewConstants.bodyHeight)
    }
}

extension RepoTableViewCell {
    struct ViewConstants {
        static let headerHeight: CGFloat = 80.0
        static let bodyHeight: CGFloat = 110.0
    }
}
