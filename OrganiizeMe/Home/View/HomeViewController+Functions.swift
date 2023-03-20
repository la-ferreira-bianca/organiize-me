//
//  HomeViewController+Functions.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 07/03/23.
//

import UIKit

extension HomeViewController {
    //MARK: - Functions
    func setupViews() {
        //MARK: - Views
        view.addSubview(stackView)
        view.addSubview(tableView)
        
        //MARK: - StackView
        stackView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: - CollectionView
        setupCollectionView()
        
        //MARK: - TableView
        setupTableview()
        
        //MARK: - DataSources/Delegates
        collectionView?.dataSource = self
        collectionView?.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func setupTableview() {
        tableView.rowHeight = 80
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.register(HomeTasksTableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func setupCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 144, height: 64)
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.backgroundColor = .clear
        collectionView?.register(CarrosselCollectionCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView?.alwaysBounceHorizontal = true
        collectionView?.layer.shadowColor = #colorLiteral(red: 0.1529411765, green: 0.3490196078, blue: 0.3137254902, alpha: 1)
        collectionView?.layer.shadowOpacity = 0.5
        collectionView?.layer.shadowOffset = CGSize(width: 6, height: 5)
        collectionView?.layer.shadowRadius = 4
        collectionView?.layer.masksToBounds = false
        collectionView?.translatesAutoresizingMaskIntoConstraints = false

        view.isMultipleTouchEnabled = true
        view.addSubview(collectionView ?? UICollectionView())
    }
    
    func setupConstraints() {
        guard let collectionView = collectionView else { return }
        tableView.addSubview(loadingView)
        
        //MARK: - Views
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 15),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.Home.tenValue),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constants.Home.tenValue),
            collectionView.heightAnchor.constraint(equalToConstant: 64)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 15),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.Home.tenValue),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constants.Home.tenValue),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            loadingView.heightAnchor.constraint(equalTo: tableView.heightAnchor),
            loadingView.widthAnchor.constraint(equalTo: tableView.widthAnchor),
            loadingView.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: tableView.centerYAnchor)
        ])
    }
}
