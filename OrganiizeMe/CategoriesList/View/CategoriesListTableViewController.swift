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
            self.stopLoading()
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
        view.backgroundColor = #colorLiteral(red: 0.5529411765, green: 0.9490196078, blue: 0.9098039216, alpha: 1)
        title = "Minhas Categorias"

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
    
    //MARK: - Private Functions
    private func setupBinders() {
        viewModel.categories.bind { [weak self] value in
            guard let category = value else { return }
            self?.categories = category
            self?.tableView.reloadData()
        }
    }
    
    private func setupNavigation() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrowshape.turn.up.backward.circle.fill"), style: .done, target: self, action: #selector(cancelTapped))
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
}
