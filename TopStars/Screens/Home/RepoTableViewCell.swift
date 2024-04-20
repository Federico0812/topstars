//
//  RepoTableViewCell.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 20/04/2024.
//

import UIKit

class RepoTableViewCell: UITableViewCell {
    
    let titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(with repoItem: RepoItem) {
        titleLabel.text = repoItem.name
        print("name: \(repoItem.name)")
    }
}

private extension RepoTableViewCell {
    func setUpView() {
        setUpTitleLabel()
    }
    
    func setUpTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.backgroundColor = .systemPink
        titleLabel.pin(.top, to: .top, of: contentView, constant: ViewConstants.padding)
        titleLabel.pin(.left, to: .left, of: contentView, constant: ViewConstants.padding)
        titleLabel.pin(.height, constant: ViewConstants.titleHeight)
    }
}

private extension RepoTableViewCell {
    struct ViewConstants {
        static let titleHeight: CGFloat = 48
        static let padding: CGFloat = 16
    }
}
