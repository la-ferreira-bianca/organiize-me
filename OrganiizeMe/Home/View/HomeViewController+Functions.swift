//
//  HomeViewController+Functions.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 07/03/23.
//

import UIKit

extension HomeViewController {
    //MARK: - Functions
    @objc func didTapMyTasks() {
        //TODO: CHANGE THIS comportament TO COORDINATOR
        navigationController?.pushViewController(TasksListTableViewController(), animated: true)
    }
    
    @objc func didTapMyCategories() {
        //TODO: CHANGE THIS comportament TO COORDINATOR
        navigationController?.pushViewController(CategoriesListTableViewController(), animated: true)
    }
    
    func setupViews() {
        //MARK: - Views
        view.addSubview(stackView)
        view.addSubview(myTasksButton)
        view.addSubview(myCategoriesButton)
        
        //MARK: - StackView
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: - CollectionView
        setupCollectionView()
        
        //MARK: - DataSources/Delegates
        collectionView?.dataSource = self
        collectionView?.delegate = self
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
            myTasksButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 15),
            myTasksButton.heightAnchor.constraint(equalToConstant: 150),
            myTasksButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.Home.tenValue),
            myTasksButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constants.Home.tenValue),
        ])
        
        NSLayoutConstraint.activate([
            myCategoriesButton.topAnchor.constraint(equalTo: myTasksButton.bottomAnchor, constant: 10),
            myCategoriesButton.heightAnchor.constraint(equalToConstant: 150),
            myCategoriesButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.Home.tenValue),
            myCategoriesButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constants.Home.tenValue),
        ])
    }
    
    func getButtonStyle(for button: UIButton) -> UIButton {
        button.layer.cornerRadius = 10
        button.layer.shadowColor = #colorLiteral(red: 0.1529411765, green: 0.3490196078, blue: 0.3137254902, alpha: 1)
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = CGSize(width: 1.5, height: 4)
        button.layer.shadowRadius = 0.5
        button.layer.masksToBounds = false
        button.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.7490196078, blue: 0.7019607843, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
}
