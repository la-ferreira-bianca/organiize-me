//
//  TasksListViewController.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 24/01/23.
//

import UIKit
class TasksListTableViewController: UITableViewController {
    //MARK: - Variables
    var viewModel: TasksViewModel?
    
    var tasks = [TaskModel]() {
        didSet {
            self.tableView.refreshControl?.endRefreshing()
            self.setupLoading(isEnable: false)
        }
    }
    
    //MARK: - Views
    let loadingView = CustomLoadingView()
    
    //MARK: - LifeCycle
    init(viewModel: TasksViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        self.viewModel?.fetchTasks()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.191467334, green: 0.6420556003, blue: 0.7067605558, alpha: 1)
        
        setupViews()
        setupConstraints()
        setupLoading(isEnable: true)
        setupBinders()
    }
    
    
    // MARK: - Binding
    private func setupBinders() {
        viewModel?.tasks.bind { [weak self] value in
            guard let task = value else { return }
            self?.tasks = task
            self?.tableView.reloadData()
        }
    }
    
    //MARK: - Private Functions
    private func setupViews() {
        tableView.rowHeight = 80
        tableView.separatorStyle = .none
        tableView.register(TaskListTableViewCell.self, forCellReuseIdentifier: "Cell")
        setupRefreshControl()
    }
    
    private func setupLoading(isEnable: Bool) {
        isEnable ? loadingView.activityIndicator.startAnimating() : loadingView.activityIndicator.stopAnimating()
        navigationController?.isNavigationBarHidden = isEnable ? true : false
        tabBarController?.tabBar.isHidden = isEnable ? true : false
        tableView.isUserInteractionEnabled = isEnable ? false : true
        loadingView.isHidden = isEnable ? false : true
    }
    
    private func setupConstraints() {
        view.addSubview(loadingView)
        view.layoutSubviews()
        
        NSLayoutConstraint.activate([
            loadingView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor),
            loadingView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            loadingView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
        
    }
    
    private func setupRefreshControl() {
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(didCallRefresh), for: .valueChanged)
    }
    
    @objc func didCallRefresh() {
        viewModel?.fetchTasks()
    }
}
