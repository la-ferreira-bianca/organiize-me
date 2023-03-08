//
//  TasksListViewController.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 24/01/23.
//

import UIKit
class TasksListTableViewController: UITableViewController {
    //MARK: - Variables
    private var viewModel = TasksViewModel()
    var tasks = [TaskModel]() {
        didSet {
            self.setupLoading(isEnable: false)
        }
    }
    
    //MARK: - Views
    let loadingView = CustomLoadingView()
    
    //MARK: - LifeCycle
    init() {
        super.init(nibName: nil, bundle: nil)
        viewModel.fetchTasks()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Minhas Tarefas"
        view.backgroundColor = #colorLiteral(red: 0.191467334, green: 0.6420556003, blue: 0.7067605558, alpha: 1)
        setupViews()
        setupConstraints()
        setupLoading(isEnable: true)
        setupBinders()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        resetNavigation()
    }
    
    // MARK: - Binding
    private func setupBinders() {
        viewModel.tasks.bind { [weak self] value in
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
    }
    
    private func setupNavigation() {
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.191467334, green: 0.6420556003, blue: 0.7067605558, alpha: 1)
        tabBarController?.tabBar.backgroundColor = #colorLiteral(red: 0.191467334, green: 0.6420556003, blue: 0.7067605558, alpha: 1)
        tabBarController?.tabBar.barTintColor = #colorLiteral(red: 0.191467334, green: 0.6420556003, blue: 0.7067605558, alpha: 1)
    }
    
    private func resetNavigation() {
        navigationController?.navigationBar.barTintColor = .purple
        tabBarController?.tabBar.backgroundColor = .purple
        tabBarController?.tabBar.barTintColor = .purple
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
}
