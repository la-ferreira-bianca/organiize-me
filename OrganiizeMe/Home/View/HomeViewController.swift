//
//  HomeViewController.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 24/01/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Variables
    var viewModel: HomeViewModel?
    var tasksViewModel = TasksViewModel(coordinator: nil)
    var tasks = [TaskModel]() {
        didSet {
            self.tableView.refreshControl?.endRefreshing()
            self.setupLoading(isEnable: false)
        }
    }
    
    //MARK: - Views
    var collectionView: UICollectionView?
    var stackView = PresentationStackView(frame: .zero)
    var tableView = UITableView()
    
    let carrossel = CarrosselModel.fetchCarrossel()
    let loadingView = CustomLoadingView()
    
    //MARK: - LifeCycle
    init(viewModel: HomeViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.tasksViewModel.fetchTasks()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
                
        setupBinders()
        setupViews()
        setupConstraints()
        setupLoading(isEnable: true)
    }
    
    private func setupBinders() {
        tasksViewModel.tasks.bind({ [weak self] value in
            guard let task = value else { return }
            self?.tasks = task
            self?.tableView.reloadData()
        })
    }
    
    private func setupLoading(isEnable: Bool) {
        isEnable ? loadingView.activityIndicator.startAnimating() : loadingView.activityIndicator.stopAnimating()
        tableView.isUserInteractionEnabled = isEnable ? false : true
        loadingView.isHidden = isEnable ? false : true
    }
}
