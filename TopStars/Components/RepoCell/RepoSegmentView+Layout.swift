//
//  RepoHeaderView+Layout.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 20/04/2024.
//

import Foundation

extension RepoSegmentView {
    func setUpView() {
        self.pin(.width, constant: 100)
        setUpIconImageView()
        setUpTitleLabel()
    }
    
    private func setUpIconImageView() {
        self.addSubview(iconView)
        iconView.backgroundColor = .clear
        iconView.pin(.centerY, to: .centerY, of: self)
        iconView.pin(.left, to: .left, of: self)
        iconView.pin(.width, constant: ViewConstants.iconSide)
        iconView.pin(.width, to: .height, of: iconView, relatedBy: .equal)
    }
    
    private func setUpTitleLabel() {
        self.addSubview(textLabel)
        textLabel.backgroundColor = .clear
        textLabel.font = .boldSystemFont(ofSize: 12)
        textLabel.textColor = .darkGray
        textLabel.pin(.left, to: .right, of: iconView, constant: ViewConstants.padding)
        textLabel.pinEdges(.notLeading)
    }
}

private extension RepoSegmentView {
    struct ViewConstants {
        static let padding: CGFloat = 8
        static let iconSide: CGFloat = 12
        static let titleHeight: CGFloat = 24
    }
}
