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
    let refreshControl = UIRefreshControl()
    var expandedRowIndex: Int? {
        didSet {
            let oldRow = oldValue
            let newRow = expandedRowIndex
            updateExpandedCells(oldRow: oldRow, newRow: newRow)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        addSubscribers()
        setUpView()
        setUpNavigationBar()
        setUpRefreshControl()
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
                self.refreshControl.endRefreshing()
            }
        }.store(in: &subscribers)
        
        viewModel.$isInitialLoading.sink { isLoading in
            if isLoading {
                self.tableView.reloadData()
            }
        }.store(in: &subscribers)
    }
    
    func updateExpandedCells(oldRow: Int?, newRow: Int?) {
        var rowsToUpdate: [IndexPath] = []
        if let newRow {
            let ip = IndexPath(row: newRow, section: 0)
            rowsToUpdate.append(ip)
        }
        if let oldRow {
            let ip = IndexPath(row: oldRow, section: 0)
            rowsToUpdate.append(ip)
        }
        self.tableView.reloadRows(at: rowsToUpdate, with: .automatic)
    }
    
    func setUpNavigationBar() {
        self.title = "Trending"
    }
    
    func setUpView() {
        setUpTableView()
    }
    
    func setUpRefreshControl() {
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    func setUpTableView() {
        view.addSubview(tableView)
        tableView.pinEdges()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .white
    }
    
    func registerCells() {
        RepoTableViewCell.register(on: tableView)
        SkeletonTableViewCell.register(on: tableView)
    }
    
    @objc func refresh(_ sender: AnyObject) {
        self.viewModel.fetchRepoList()
    }
}
