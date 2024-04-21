//
//  RepoHeaderView.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 20/04/2024.
//

import UIKit
import Combine

class RepoSegmentView: UIView {
    let textLabel = UILabel()
    let iconView = UIImageView()
    
    init() {
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(with segmentInfo: RepoSegmentInfo) {
        textLabel.text = segmentInfo.text
        iconView.image = segmentInfo.icon
        iconView.tintColor = segmentInfo.color
    }
}
