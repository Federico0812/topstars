//
//  HomeViewController+TableView.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 20/04/2024.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.repoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RepoTableViewCell.identifier, for: indexPath) as! RepoTableViewCell
        let item = viewModel.repoItems[indexPath.row]
        cell.setUp(with: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ViewConstants.collapsedRowHeight
    }
}


private extension HomeViewController {
    struct ViewConstants {
        static let collapsedRowHeight: CGFloat = RepoTableViewCell.ViewConstants.headerHeight
        static let expandedRowHeight: CGFloat = RepoTableViewCell.ViewConstants.headerHeight + RepoTableViewCell.ViewConstants.bodyHeight
    }
}
