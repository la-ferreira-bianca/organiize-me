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
    let carrossel = CarrosselModel.fetchCarrossel()
    
    //MARK: - Views
    var tableView = TasksListTableViewController()
    var collectionView: UICollectionView?
    var stackView = PresentationStackView(frame: .zero)
    
    //MARK: - LifeCycle
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
        setupViews()
        setupConstraints()
    }
    
    //MARK: - Private Functions
    private func setupViews() {
        //MARK: - Views
        view.addSubview(stackView)
        view.addSubview(tableView)
        
        //MARK: - StackView
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: - TableView
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: - CollectionView
        setupCollectionView()
        
        //MARK: - DataSources/Delegates
        collectionView?.dataSource = self
        collectionView?.delegate = self
    }
    
    private func setupCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 40)
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.backgroundColor = .clear
        collectionView?.register(CarrosselCollectionCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView?.alwaysBounceHorizontal = true
        collectionView?.translatesAutoresizingMaskIntoConstraints = false

        view.isMultipleTouchEnabled = true
        view.addSubview(collectionView ?? UICollectionView())
    }
    
    private func setupConstraints() {
        guard let collectionView = collectionView else { return }
        //MARK: - Views
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.Home.tenValue),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constants.Home.tenValue),
            stackView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 5),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.Home.tenValue),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constants.Home.tenValue),
            collectionView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.Home.tenValue),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constants.Home.tenValue),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constants.Home.tenValue),
        ])
    }
}
