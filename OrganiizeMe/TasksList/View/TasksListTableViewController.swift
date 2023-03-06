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
            self.stopLoading()
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
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.5529411765, green: 0.9490196078, blue: 0.9098039216, alpha: 1)
        title = "Minhas Tarefas"
        
        setupNavigation()
        setupViews()
        setupConstraints()
        startLoading()
        setupBinders()
    }
    
    //MARK: - Functions
    @objc func cancelTapped() {
        navigationController?.popViewController(animated: true)
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
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrowshape.turn.up.backward.circle.fill"), style: .done, target: self, action: #selector(cancelTapped))
    }
    
    private func startLoading() {
        loadingView.activityIndicator.startAnimating()
        navigationController?.isNavigationBarHidden = true
        tabBarController?.tabBar.isHidden = true
        tableView.isUserInteractionEnabled = false
        loadingView.isHidden = false
    }
    
    private func stopLoading() {
        loadingView.activityIndicator.stopAnimating()
        navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isHidden = false
        tableView.isUserInteractionEnabled = true
        loadingView.isHidden = true
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
