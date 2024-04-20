//
//  HomeViewController.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 20/04/2024.
//

import UIKit
import Combine

class HomeViewController: UIViewController {
    
    private var subscribers: [AnyCancellable] = []
    let viewModel = HomeViewModel()
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        addSubscribers()
        setUpView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.fetchRepoList()
    }
}

private extension HomeViewController {
    func addSubscribers() {
        viewModel.$repoItems.sink { items in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            print("new items are: \(items.count)")
        }.store(in: &subscribers)
    }
    
    func setUpView() {
        setUpTableView()
    }
    
    func setUpTableView() {
        view.addSubview(tableView)
        tableView.pinEdges()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .gray
    }
    
    func registerCells() {
        RepoTableViewCell.register(on: tableView)
    }
}
