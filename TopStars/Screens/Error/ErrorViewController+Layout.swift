//
//  ErrorViewController+Layout.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 21/04/2024.
//

import Foundation
import UIKit

extension ErrorViewController {
    func setUpView() {
        self.view.backgroundColor = UIColor.init(white: 0, alpha: 0.8)
        setUpErrorIconImageView()
        setUpTitleLabel()
        setUpDescriptionLabel()
        setUpRetryButton()
        setUpCancelButton()
    }
    
    private func setUpErrorIconImageView() {
        self.view.addSubview(errorIconImageView)
        errorIconImageView.backgroundColor = .init(named: "ExtraLightGray")
        errorIconImageView.pin(.top, to: .top, of: self.view, constant: ViewConstants.topMargin)
        errorIconImageView.pin(.centerX, to: .centerX, of: self.view)
        errorIconImageView.pin(.width, constant: ViewConstants.iconSide)
        errorIconImageView.pin(.width, to: .height, of: errorIconImageView, relatedBy: .equal)
        errorIconImageView.roundCorners(radius: ViewConstants.iconSide / 2.0)
    }
    
    private func setUpTitleLabel() {
        self.view.addSubview(titleLabel)
        titleLabel.backgroundColor = .clear
        titleLabel.font = .boldSystemFont(ofSize: 18)
        titleLabel.textColor = .systemBackground
        titleLabel.pin(.top, to: .bottom, of: errorIconImageView, constant: ViewConstants.externalPadding)
        titleLabel.pin(.centerX, to: .centerX, of: self.view)
        titleLabel.pin(.height, constant: ViewConstants.titleHeight)
    }
    
    private func setUpDescriptionLabel() {
        self.view.addSubview(errorDescriptionLabel)
        errorDescriptionLabel.backgroundColor = .clear
        errorDescriptionLabel.font = .systemFont(ofSize: 14)
        errorDescriptionLabel.numberOfLines = 0
        errorDescriptionLabel.textAlignment = .center
        errorDescriptionLabel.textColor = .systemBackground
        errorDescriptionLabel.pin(.top, to: .bottom, of: titleLabel, constant: ViewConstants.internalPadding)
        errorDescriptionLabel.pin(.left, to: .left, of: self.view, constant: ViewConstants.externalPadding)
        errorDescriptionLabel.pin(.right, to: .right, of: self.view, constant: -ViewConstants.externalPadding)
    }
    
    private func setUpRetryButton() {
        self.view.addSubview(retryButton)
        retryButton.setTitle("RETRY", for: .normal)
        retryButton.backgroundColor = .systemGreen
        retryButton.titleLabel?.font = .systemFont(ofSize: 14)
        retryButton.setTitleColor(.white, for: .normal)
        retryButton.pin(.top, to: .bottom, of: errorDescriptionLabel, constant: ViewConstants.internalPadding)
        retryButton.pin(.left, to: .left, of: self.view, constant: ViewConstants.externalPadding)
        retryButton.pin(.right, to: .right, of: self.view, constant: -ViewConstants.externalPadding)
        retryButton.pin(.height, constant: ViewConstants.buttonHeight)
        retryButton.addTarget(self, action: #selector(retry), for: .touchUpInside)
        retryButton.roundCorners(radius: ViewConstants.buttonCorners)
    }
    
    private func setUpCancelButton() {
        self.view.addSubview(cancelButton)
        cancelButton.setTitle("CANCEL", for: .normal)
        cancelButton.backgroundColor = .white
        cancelButton.titleLabel?.font = .systemFont(ofSize: 14)
        cancelButton.setTitleColor(.systemGreen, for: .normal)
        cancelButton.pin(.top, to: .bottom, of: retryButton, constant: ViewConstants.internalPadding)
        cancelButton.pin(.left, to: .left, of: self.view, constant: ViewConstants.externalPadding)
        cancelButton.pin(.right, to: .right, of: self.view, constant: -ViewConstants.externalPadding)
        cancelButton.pin(.bottom, to: .bottom, of: self.view, constant: -ViewConstants.externalPadding)
        cancelButton.pin(.height, constant: ViewConstants.buttonHeight)
        cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        cancelButton.roundCorners(radius: ViewConstants.buttonCorners)
    }
    
    @objc func retry(_ sender: AnyObject) {
        self.retryAction()
    }
    
    @objc func cancel(_ sender: AnyObject) {
        self.cancelAction()
    }
}

private extension ErrorViewController {
    struct ViewConstants {
        static let iconSide: CGFloat = 180
        static let titleHeight: CGFloat = 24
        static let buttonHeight: CGFloat = 56
        static let externalPadding: CGFloat = 16
        static let topMargin: CGFloat = 160
        static let internalPadding: CGFloat = 8
        static let buttonCorners: CGFloat = 8
    }
}
