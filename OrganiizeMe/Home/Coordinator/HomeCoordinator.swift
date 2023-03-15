//
//  HomeCoordinator.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 24/01/23.
//

import UIKit

class HomeCoordinator: Coordinator {
    //MARK: - Variables
    var rootViewController = UINavigationController()
    
    private lazy var homeViewControoler: HomeViewController = {
        let viewModel = HomeViewModel(coordinator: self)
        let vc = HomeViewController(viewModel: viewModel)
        vc.title = "OrganiizeMe"
        return vc
    }()
    
    init() {
        self.rootViewController = UINavigationController()
        rootViewController.hidesBarsOnSwipe = true
        rootViewController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationBar.barTintColor = .purple
    }
    
    //MARK: - Functions
    func start() {
        rootViewController.setViewControllers([homeViewControoler], animated: false)
    }
    
}
