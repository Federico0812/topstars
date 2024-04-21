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
        setUpIconImageView()
        setUpTitleLabel()
        setUpURLLabel()
        setUpDescriptionLabel()
    }
    
    
    private func setUpIconImageView() {
        contentView.addSubview(iconImageView)
        iconImageView.backgroundColor = .purple
        iconImageView.pin(.top, to: .top, of: contentView, constant: ViewConstants.externalPadding)
        iconImageView.pin(.left, to: .left, of: contentView, constant: ViewConstants.externalPadding)
        iconImageView.pin(.width, constant: ViewConstants.iconSide)
        iconImageView.pin(.width, to: .height, of: iconImageView, relatedBy: .equal)
    }
    
    private func setUpTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.backgroundColor = .systemPink
        titleLabel.pin(.top, to: .top, of: contentView, constant: ViewConstants.externalPadding)
        titleLabel.pin(.left, to: .right, of: iconImageView, constant: ViewConstants.externalPadding)
        titleLabel.pin(.height, constant: ViewConstants.titleHeight)
    }
    
    private func setUpURLLabel() {
        contentView.addSubview(urlLabel)
        urlLabel.backgroundColor = .blue
        urlLabel.pin(.top, to: .bottom, of: titleLabel, constant: ViewConstants.internalPadding)
        urlLabel.pin(.left, to: .right, of: iconImageView, constant: ViewConstants.externalPadding)
    }
    
    private func setUpDescriptionLabel() {
        contentView.addSubview(descriptionLabel)
        descriptionLabel.backgroundColor = .green
        descriptionLabel.numberOfLines = 0
        descriptionLabel.pin(.top, to: .bottom, of: urlLabel, constant: ViewConstants.internalPadding)
        descriptionLabel.pin(.bottom, to: .bottom, of: contentView, constant: -ViewConstants.externalPadding)
        descriptionLabel.pin(.left, to: .right, of: iconImageView, constant: ViewConstants.externalPadding)
    }
}

private extension RepoTableViewCell {
    struct ViewConstants {
        static let iconSide: CGFloat = 56
        static let titleHeight: CGFloat = 24
        static let externalPadding: CGFloat = 16
        static let internalPadding: CGFloat = 8
    }
}
