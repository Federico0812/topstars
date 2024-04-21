//
//  RepoHeaderView+Layout.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 20/04/2024.
//

import Foundation

extension RepoHeaderView {
    func setUpView() {
        setUpIconImageView()
        setUpTitleLabel()
        setUpURLLabel()
    }
    
    
    private func setUpIconImageView() {
        self.addSubview(iconImageView)
        iconImageView.backgroundColor = .init(named: "ExtraLightGray")
        iconImageView.pin(.top, to: .top, of: self, constant: ViewConstants.externalPadding)
        iconImageView.pin(.left, to: .left, of: self, constant: ViewConstants.externalPadding)
        iconImageView.pin(.width, constant: ViewConstants.iconSide)
        iconImageView.pin(.width, to: .height, of: iconImageView, relatedBy: .equal)
        iconImageView.roundCorners(radius: ViewConstants.iconSide / 2.0)
    }
    
    private func setUpTitleLabel() {
        self.addSubview(titleLabel)
        titleLabel.backgroundColor = .clear
        titleLabel.font = .boldSystemFont(ofSize: 10)
        titleLabel.textColor = .init(named: "SecondaryGray")
        titleLabel.pin(.top, to: .top, of: self, constant: ViewConstants.externalPadding)
        titleLabel.pin(.left, to: .right, of: iconImageView, constant: ViewConstants.externalPadding)
        titleLabel.pin(.height, constant: ViewConstants.titleHeight)
    }
    
    private func setUpURLLabel() {
        self.addSubview(urlLabel)
        urlLabel.backgroundColor = .clear
        urlLabel.font = .systemFont(ofSize: 12)
        urlLabel.textColor = .label
        urlLabel.pin(.top, to: .bottom, of: titleLabel, constant: ViewConstants.internalPadding)
        urlLabel.pin(.left, to: .right, of: iconImageView, constant: ViewConstants.externalPadding)
        urlLabel.pin(.bottom, to: .bottom, of: self, constant: -ViewConstants.externalPadding)
    }
}

private extension RepoHeaderView {
    struct ViewConstants {
        static let iconSide: CGFloat = 40
        static let titleHeight: CGFloat = 24
        static let externalPadding: CGFloat = 16
        static let internalPadding: CGFloat = 8
    }
}
