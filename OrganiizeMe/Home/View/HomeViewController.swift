//
//  HomeViewController.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 24/01/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Variables
//    var coordinator: HomeBaseCoordinator?
    let carrossel = CarrosselModel.fetchCarrossel()
    
    //MARK: - Views
    var collectionView: UICollectionView?
    var stackView = PresentationStackView(frame: .zero)
    
    lazy var myTasksButton: UIButton = {
        let button = UIButton()
        button.setTitle("Minhas Tarefas", for: .normal)
        button.addTarget(self, action: #selector(didTapMyTasks), for: .touchUpInside)
        
        return getButtonStyle(for: button)
    }()
    
    lazy var myCategoriesButton: UIButton = {
        let button = UIButton()
        button.setTitle("Minha Categorias", for: .normal)
        
        button.addTarget(self, action: #selector(didTapMyCategories), for: .touchUpInside)
       return getButtonStyle(for: button)
    }()
    
    //MARK: - LifeCycle
//    init(coordinator: HomeBaseCoordinator) {
//        super.init(nibName: nil, bundle: nil)
//        self.coordinator = coordinator
//        title = "HomeTitle".localized
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
//        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationController?.hidesBarsOnSwipe = true
//        navigationController?.navigationBar.barTintColor = .purple
//        navigationController?.navigationBar.tintColor = .white
        
//        tabBarController?.tabBar.tintColor = .white
//        tabBarController?.tabBar.backgroundColor = .purple
        
        setupViews()
        setupConstraints()
    }
}
