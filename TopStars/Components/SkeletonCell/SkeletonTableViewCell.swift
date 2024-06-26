//
//  RepoTableViewCell.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 20/04/2024.
//

import UIKit

class SkeletonTableViewCell: UITableViewCell {
    
    let titleLabel = SkeletonElementView()
    let urlLabel = SkeletonElementView()
    let iconImageView = SkeletonElementView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
