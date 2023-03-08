//
//  MainCoordinator.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 24/01/23.
//

import UIKit

class MainCoordinator: Coordinator {
    var rootViewController = UITabBarController()
    
    var childCoordinators = [Coordinator]()
    
    init() {
        self.rootViewController = UITabBarController()
        rootViewController.tabBar.isTranslucent = true
        rootViewController.tabBar.backgroundColor = .purple
        rootViewController.tabBar.tintColor = .white
    }

    //MARK: - Functions
    func start() {
        let homeCoordinator = HomeCoordinator()
        let homeVC = homeCoordinator.rootViewController
        homeVC.tabBarItem = UITabBarItem(
            title: "Inicio",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill"))
        homeCoordinator.start()
        self.childCoordinators.append(homeCoordinator)
        
        let tasksListCoordinator = TaskListCoordinator()
        let taskslistVc = tasksListCoordinator.rootViewController
        taskslistVc.tabBarItem = UITabBarItem(
            title: "Tarefas",
            image: UIImage(systemName: "newspaper"),
            selectedImage: UIImage(systemName: "newspaper.fill"))
        tasksListCoordinator.start()
        self.childCoordinators.append(tasksListCoordinator)
        
        let categoriesListCoordinator = CategoriesListCoordinator()
        let categoriesListVC = categoriesListCoordinator.rootViewController
        categoriesListVC.tabBarItem = UITabBarItem(
            title: "Categorias",
            image: UIImage(systemName: "folder"),
            selectedImage: UIImage(systemName: "folder.fill"))
        categoriesListCoordinator.start()
        self.childCoordinators.append(categoriesListCoordinator)
        
        rootViewController.viewControllers = [
            homeVC,
            taskslistVc,
            categoriesListVC
        ]
    }
}
