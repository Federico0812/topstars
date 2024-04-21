//
//  HomeViewController+TableView.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 20/04/2024.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.repoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let isExpanded = row == expandedRowIndex
        let cell = tableView.dequeueReusableCell(withIdentifier: RepoTableViewCell.identifier, for: indexPath) as! RepoTableViewCell
        let item = viewModel.repoItems[indexPath.row]
        cell.setUp(with: item, isExpanded: isExpanded)
        return cell
    }
}
