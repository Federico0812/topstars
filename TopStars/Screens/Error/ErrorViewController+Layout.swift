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
        setUpanimationBackgroundView()
        setUpTitleLabel()
        setUpDescriptionLabel()
        setUpRetryButton()
        setUpCancelButton()
    }
    
    func setUpLottieAnimation() {
        animationView.frame = animationBackgroundView.frame
        animationView.backgroundColor = .clear
        print("BOUNDS: \(view.bounds)")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.5
        view.addSubview(animationView)
        animationView.play()
        self.view.bringSubviewToFront(animationView)
    }
    
    private func setUpanimationBackgroundView() {
        self.view.addSubview(animationBackgroundView)
        animationBackgroundView.backgroundColor = .init(white: 0, alpha: 0.4)
        animationBackgroundView.pin(.top, to: .top, of: self.view, constant: ViewConstants.topMargin)
        animationBackgroundView.pin(.centerX, to: .centerX, of: self.view)
        animationBackgroundView.pin(.width, constant: ViewConstants.iconSide)
        animationBackgroundView.pin(.width, to: .height, of: animationBackgroundView, relatedBy: .equal)
        animationBackgroundView.roundCorners(radius: ViewConstants.iconSide / 2.0)
    }
    
    private func setUpTitleLabel() {
        self.view.addSubview(titleLabel)
        titleLabel.backgroundColor = .clear
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.textColor = .systemBackground
        titleLabel.pin(.top, to: .bottom, of: animationBackgroundView, constant: ViewConstants.iconMargin)
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
        static let iconSide: CGFloat = UIScreen.main.bounds.width * 0.8
        static let titleHeight: CGFloat = 24
        static let buttonHeight: CGFloat = 56
        static let externalPadding: CGFloat = 16
        static let iconMargin: CGFloat = 32
        static let topMargin: CGFloat = 160
        static let internalPadding: CGFloat = 8
        static let buttonCorners: CGFloat = 8
    }
}
