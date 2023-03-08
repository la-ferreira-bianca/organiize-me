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
    private var viewModel = CategoriesViewModel()
    var categories = [CategoryModel]() {
        didSet {
            self.setupLoading(isEnable: false)
        }
    }
    
    //MARK: - LifeCycle
    init() {
        super.init(nibName: nil, bundle: nil)
        viewModel.fetchCategories()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.191467334, green: 0.6420556003, blue: 0.7067605558, alpha: 1)
        title = "Minhas Categorias"

        setupNavigation()
        setupViews()
        setupConstraints()
        setupLoading(isEnable: true)
        setupBinders()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        resetNavigation()
    }
    
    //MARK: - Functions
    
    @objc func cancelTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Private Functions
    private func setupBinders() {
        viewModel.categories.bind { [weak self] value in
            guard let category = value else { return }
            self?.categories = category
            self?.tableView.reloadData()
        }
    }
    
    //TODO: - Change this functions to coordinator
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
    
    private func setupViews() {
        tableView.rowHeight = 80
        tableView.separatorStyle = .none
        tableView.register(CategoryListTableViewCell.self, forCellReuseIdentifier: "Cell")
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
}
