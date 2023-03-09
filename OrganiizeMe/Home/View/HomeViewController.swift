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
                
        setupViews()
        setupConstraints()
    }
}
