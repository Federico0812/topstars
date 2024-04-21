//
//  RepoTableViewCell.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 20/04/2024.
//

import UIKit

class RepoTableViewCell: UITableViewCell {
    
    let headerView = RepoHeaderView()
    let bodyView = RepoBodyView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(with repoItem: RepoItem, isExpanded: Bool) {
        headerView.setUp(with: repoItem)
        if isExpanded {
            bodyView.isHidden = false
            bodyView.setUp(with: repoItem)
        } else {
            bodyView.isHidden = true
        }
    }
}
