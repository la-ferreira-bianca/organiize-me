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
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.axis = .vertical
        stack.spacing = Constants.Home.tenValue
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        stack.backgroundColor = .purple
        stack.layer.cornerRadius = Constants.Home.tenValue
        return stack
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Bem Vindo: "
        label.textColor = .white
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Ester B."
        label.textColor = .white
        return label
    }()
    
    //MARK: - Life Cycle
    init(coordinator: HomeBaseCoordinator) {
        super.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
        title = "Home"
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
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(nameLabel)
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
        
        //MARK: - SubViews
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: Constants.Home.tenValue),
            titleLabel.topAnchor.constraint(equalTo: stackView.topAnchor, constant: Constants.Home.tenValue),
            nameLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: Constants.Home.tenValue),
        ])
    }
}
