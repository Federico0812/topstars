//
//  RepoTableViewCell.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 20/04/2024.
//

import UIKit

class RepoTableViewCell: UITableViewCell {
    
    let titleLabel = UILabel()
    let urlLabel = UILabel()
    let descriptionLabel = UILabel()
    let iconImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(with repoItem: RepoItem) {
        titleLabel.text = repoItem.name
        urlLabel.text = repoItem.url
        descriptionLabel.text = repoItem.description
        print("name: \(repoItem.name)")
    }
}
