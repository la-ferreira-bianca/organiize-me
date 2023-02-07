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
    var collectionView: UICollectionView?
    var stackView = PresentationStackView(frame: .zero)
    
    lazy var myTasksButton: UIButton = {
        let button = UIButton()
        button.setTitle("Minhas Tarefas", for: .normal)
        button.layer.cornerRadius = 10
        button.layer.shadowColor = #colorLiteral(red: 0.1529411765, green: 0.3490196078, blue: 0.3137254902, alpha: 1)
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = CGSize(width: 1.5, height: 4)
        button.layer.shadowRadius = 0.5
        button.layer.masksToBounds = false
        button.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.7490196078, blue: 0.7019607843, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var myCategoriesButton: UIButton = {
        let button = UIButton()
        button.setTitle("Minha Categorias", for: .normal)
        button.layer.cornerRadius = 10
        button.layer.shadowColor = #colorLiteral(red: 0.1529411765, green: 0.3490196078, blue: 0.3137254902, alpha: 1)
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = CGSize(width: 1.5, height: 4)
        button.layer.shadowRadius = 0.5
        button.layer.masksToBounds = false
        button.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.7490196078, blue: 0.7019607843, alpha: 1)
        button.addTarget(self, action: #selector(didTapMyCategories), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
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
    
    //MARK: - Functions
    @objc func didTapMyCategories() {
        //TODO: CHANGE THIS comportament TO COORDINATOR
        navigationController?.pushViewController(CategoriesListTableViewController(), animated: true)
    }
    
    //MARK: - Private Functions
    private func setupViews() {
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
    
    private func setupCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 222, height: 64)
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
    
    private func setupConstraints() {
        guard let collectionView = collectionView else { return }
        
        //MARK: - Views
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.Home.tenValue),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constants.Home.tenValue),
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
}

//#if DEBUG
//import SwiftUI
//
//struct HomeViewControllerRepresentable: UIViewControllerRepresentable {
//    func makeUIViewController(context: Context) -> some UIViewController {
//        return HomeViewController()
//    }
//
//    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
//}
//
//struct HomeViewController_Preview: PreviewProvider {
//    static var previews: some View {
//        HomeViewControllerRepresentable()
//            .previewDevice("iPhone SE (3rd generation)")
//    }
//}
//
//#endif
