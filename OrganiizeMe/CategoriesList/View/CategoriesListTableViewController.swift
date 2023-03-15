//
//  CategoriesListTableViewController.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 07/02/23.
//

import UIKit

class CategoriesListTableViewController: UITableViewController {
    //MARK: - Views
    let loadingView = CustomLoadingView()
    
    //MARK: - Variables
    var viewModel: CategoriesViewModel?
    var categories = [CategoryModel]() {
        didSet {
            self.tableView.refreshControl?.endRefreshing()
            self.setupLoading(isEnable: false)
        }
    }
    
    //MARK: - LifeCycle
    init(viewModel: CategoriesViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.191467334, green: 0.6420556003, blue: 0.7067605558, alpha: 1)
        
        viewModel?.fetchCategories()
        setupViews()
        setupConstraints()
        setupLoading(isEnable: true)
        setupBinders()
    }
    
    //MARK: - Private Functions
    private func setupBinders() {
        viewModel?.categories.bind { [weak self] value in
            guard let category = value else { return }
            self?.categories = category
            self?.tableView.reloadData()
        }
    }
    
    private func setupViews() {
        tableView.rowHeight = 80
        tableView.separatorStyle = .none
        tableView.register(CategoryListTableViewCell.self, forCellReuseIdentifier: "Cell")
        setupRefreshControl()
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
    
    private func setupLoading(isEnable: Bool) {
        isEnable ? loadingView.activityIndicator.startAnimating() : loadingView.activityIndicator.stopAnimating()
        navigationController?.isNavigationBarHidden = isEnable ? true : false
        tabBarController?.tabBar.isHidden = isEnable ? true : false
        tableView.isUserInteractionEnabled = isEnable ? false : true
        loadingView.isHidden = isEnable ? false : true
    }
    
    private func setupRefreshControl() {
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(didCallRefresh), for: .valueChanged)
    }
    
    @objc func didCallRefresh() {
        viewModel?.fetchCategories()
    }
}
