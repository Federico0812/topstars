//
//  RepoHeaderView.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 20/04/2024.
//

import UIKit

class RepoBodyView: UIView {
    
    let bodyLabel = UILabel()
    let hStack = UIStackView()
    let languageSegment = RepoSegmentView()
    let starsSegment = RepoSegmentView()
    
    init() {
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(with repoItem: RepoItem) {
        bodyLabel.text = repoItem.description
        languageSegment.setUp(with: repoItem.langugageSegmentInfo)
        starsSegment.setUp(with: repoItem.starSegmentInfo)
        displayAnimated()
    }
    
    private func displayAnimated() {
        self.alpha = 0
        UIView.animate(withDuration: 0.3) {
            self.alpha = 1
        }
    }
}
