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
        setUpHeaderView()
    }
    
    private func setUpHeaderView() {
        self.addSubview(headerView)
        headerView.pinEdges(.notBottom)
        headerView.pin(.height, constant: ViewConstants.headerHeight)
    }
}

extension RepoTableViewCell {
    struct ViewConstants {
        static let headerHeight: CGFloat = 80
        static let bodyHeight: CGFloat = 120
    }
}
