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
    lazy var errorViewController = {
        ErrorViewController(retryAction: { [weak self] in
            self?.retryAction()
        }, cancelAction: { [weak self] in
            self?.cancelAction()
        })
    }()
    
    let refreshControl = UIRefreshControl()
    
    var errorView: UIView {
        errorViewController.view
    }
    
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
        setUpErrorView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getItems()
    }
}

// MARK: - Initial set up

private extension HomeViewController {
    func addSubscribers() {
        viewModel.$items.sink { items in
            DispatchQueue.main.async {
                self.collapseAllCells()
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            }
        }.store(in: &subscribers)
        
        viewModel.$isInitialLoading.sink { isLoading in
            if isLoading {
                self.tableView.reloadData()
            }
        }.store(in: &subscribers)
        
        viewModel.$error.sink { serviceError in
            guard let serviceError else {
                self.errorView.isHidden = true
                return
            }
            DispatchQueue.main.async {
                self.errorViewController.setUp(with: serviceError)
                self.errorView.isHidden = false
                self.refreshControl.endRefreshing()
            }
        }.store(in: &subscribers)
    }
    
    func collapseAllCells() {
        if expandedRowIndex != nil {
            expandedRowIndex = nil
        }
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
        tableView.backgroundColor = .systemBackground
    }
    
    func registerCells() {
        RepoTableViewCell.register(on: tableView)
        SkeletonTableViewCell.register(on: tableView)
    }
    
    func setUpErrorView() {
        self.addChild(errorViewController)
        view.addSubview(errorView)
        errorView.pinEdges()
        errorView.isHidden = true
    }
}

// MARK: - User actions

private extension HomeViewController {
    
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
    
    @objc func refresh(_ sender: AnyObject) {
        collapseAllCells()
        viewModel.getItems(allowCachedResults: false)
    }
    
    func retryAction() {
        viewModel.error = nil
        viewModel.getItems(allowCachedResults: false)
    }
    
    func cancelAction() {
        viewModel.error = nil
    }
}
