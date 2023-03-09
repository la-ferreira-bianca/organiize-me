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
        let viewModel = CategoriesViewModel(coordinator: self)
        let vc = CategoriesListTableViewController(viewModel: viewModel)
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
    
    func showCategoryDetails(with id: String) {
        //todo: when the coordinator for the taskview is completed, change this values
        //to create the coordinator and the view model, the rest the taskcoordinator
        //will handle
        let categoryDetails = CategoryViewController(categoryID: id)
        rootViewController.pushViewController(categoryDetails, animated: true)
    }
}
