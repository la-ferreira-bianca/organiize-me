//
//  CategoriesListCoordinator.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 08/03/23.
//

import UIKit

class CategoriesListCoordinator: Coordinator {
    var rootViewController = UINavigationController()
    
    lazy var categoriesListTableViewController: CategoriesListTableViewController = {
        let vc = CategoriesListTableViewController()
        vc.title = "Minhas Categorias"
        return vc
    }()
    
    init() {
        self.rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationBar.barTintColor = #colorLiteral(red: 0.191467334, green: 0.6420556003, blue: 0.7067605558, alpha: 1)
    }
    
    func start() {
        rootViewController.setViewControllers([categoriesListTableViewController], animated: false)
    }
}
