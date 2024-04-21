//
//  RepoTableViewCell.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 20/04/2024.
//

import UIKit

class RepoTableViewCell: UITableViewCell {
    
    let headerView = RepoHeaderView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(with repoItem: RepoItem) {
        headerView.setUp(with: repoItem)
    }
}
