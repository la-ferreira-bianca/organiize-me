//
//  HomeViewController.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 24/01/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Variables
    var coordinator: HomeBaseCoordinator?
    
    //MARK: - Views
    let tableView = UITableView()
    let stackView = PresentationStackView(frame: .zero)
    
    //MARK: - Life Cycle
    init(coordinator: HomeBaseCoordinator) {
        super.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
        title = "HomeTitle".localized
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.backgroundColor = .gray
        setupViews()
        setupConstraints()
    }
    
    //MARK: - Functions
    func setupViews() {
        //MARK: - Views
        view.addSubview(stackView)
        view.addSubview(tableView)
        
        //MARK: - StackView
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: - TableView
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        //MARK: - Views
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.Home.tenValue),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constants.Home.tenValue),
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: Constants.Home.tenValue),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.Home.tenValue),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constants.Home.tenValue),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constants.Home.tenValue),
        ])
    }
}
