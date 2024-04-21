//
//  RepoTableViewCell+View.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 20/04/2024.
//

import Foundation
import UIKit

extension SkeletonTableViewCell {
    func setUpView() {
        selectionStyle = .none
        contentView.clipsToBounds = true
        setUpIconImageView()
        setUpTitleLabel()
        setUpURLLabel()
    }
    
    private func setUpIconImageView() {
        self.addSubview(iconImageView)
        iconImageView.pin(.top, to: .top, of: self, constant: ViewConstants.externalPadding)
        iconImageView.pin(.left, to: .left, of: self, constant: ViewConstants.externalPadding)
        iconImageView.pin(.width, constant: ViewConstants.iconSide)
        iconImageView.pin(.width, to: .height, of: iconImageView, relatedBy: .equal)
        iconImageView.roundCorners(radius: ViewConstants.iconSide / 2.0)
        urlLabel.alpha = 0.8
    }
    
    private func setUpTitleLabel() {
        self.addSubview(titleLabel)
        titleLabel.pin(.top, to: .top, of: self, constant: ViewConstants.externalPadding)
        titleLabel.pin(.left, to: .right, of: iconImageView, constant: ViewConstants.externalPadding)
        titleLabel.pin(.right, to: .right, of: self, constant: -ViewConstants.externalPadding)
        titleLabel.pin(.height, constant: ViewConstants.titleHeight)
        titleLabel.roundCorners(radius: ViewConstants.titleHeight / 2.0)
        urlLabel.alpha = 0.8
    }
    
    private func setUpURLLabel() {
        self.addSubview(urlLabel)
        urlLabel.pin(.top, to: .bottom, of: titleLabel, constant: ViewConstants.internalPadding)
        urlLabel.pin(.left, to: .right, of: iconImageView, constant: ViewConstants.externalPadding)
        urlLabel.pin(.right, to: .right, of: self, constant: -ViewConstants.externalPadding)
        urlLabel.pin(.height, constant: ViewConstants.titleHeight)
        urlLabel.roundCorners(radius: ViewConstants.titleHeight / 2.0)
        urlLabel.alpha = 0.5
    }
}

private extension SkeletonTableViewCell {
    struct ViewConstants {
        static let iconSide: CGFloat = 40
        static let titleHeight: CGFloat = 24
        static let externalPadding: CGFloat = 16
        static let internalPadding: CGFloat = 4
    }
}
