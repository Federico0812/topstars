//
//  RepoHeaderView+Layout.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 20/04/2024.
//

import Foundation
import UIKit

extension RepoBodyView {
    func setUpView() {
        self.backgroundColor = .clear
        setUpBodyLabel()
        setUpHStack()
        setUpSegments()
    }
 
    private func setUpBodyLabel() {
        self.addSubview(bodyLabel)
        bodyLabel.backgroundColor = .clear
        bodyLabel.font = .systemFont(ofSize: 12)
        bodyLabel.textColor = .label
        bodyLabel.numberOfLines = 0
        bodyLabel.pinEdges(.notBottom, withInsets: ViewConstants.insets)
    }
    
    private func setUpHStack() {
        self.addSubview(hStack)
        hStack.backgroundColor = .clear
        hStack.pin(.top,
                   to: .bottom,
                   of: bodyLabel,
                   relatedBy: .greaterThanOrEqual,
                   constant: ViewConstants.separation)
        hStack.pin(.height, constant: ViewConstants.hStackHeight)
        hStack.pinEdges(.notTop, withInsets: ViewConstants.insets)
    }
    
    
    private func setUpSegments() {
        hStack.addArrangedSubview(languageSegment)
        hStack.addArrangedSubview(starsSegment)
    }
}

private extension RepoBodyView {
    struct ViewConstants {
        static let insets = UIEdgeInsets(top: 0, left: padding, bottom: padding, right: padding)
        static let padding: CGFloat = 16
        static let separation: CGFloat = 8
        static let hStackHeight: CGFloat = 24
    }
}
