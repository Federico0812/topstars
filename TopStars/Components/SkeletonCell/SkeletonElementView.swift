//
//  SkeletonElementView.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 21/04/2024.
//

import UIKit

class SkeletonElementView: UIView {
    
    var isAnimating: Bool = false

    init() {
        super.init(frame: .zero)
        backgroundColor = .init(named: "ShimmerGray")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if !isAnimating {
            self.startAnimating()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startAnimating() {
        isAnimating = true
        self.addAnimationLayer()
    }
}
