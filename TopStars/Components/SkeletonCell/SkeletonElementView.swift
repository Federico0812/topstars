//
//  SkeletonElementView.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 21/04/2024.
//

import UIKit

class SkeletonElementView: UIView {

    init() {
        super.init(frame: .zero)
        backgroundColor = .init(named: "ShimmerGray")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
