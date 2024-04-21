//
//  HomeViewController+TableView.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 20/04/2024.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = indexPath.row
        let isExpanded = row == expandedRowIndex && !viewModel.isInitialLoading
        return isExpanded ? ViewConstants.expandedRowHeight : ViewConstants.collapsedRowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tappedRow = indexPath.row
        if let expandedRowIndex, expandedRowIndex == tappedRow  {
            self.expandedRowIndex = nil
            return
        }
        
        expandedRowIndex = tappedRow
    }
}


private extension HomeViewController {
    struct ViewConstants {
        static let collapsedRowHeight: CGFloat = RepoTableViewCell.ViewConstants.headerHeight
        static let expandedRowHeight: CGFloat = RepoTableViewCell.ViewConstants.headerHeight + RepoTableViewCell.ViewConstants.bodyHeight
    }
}
