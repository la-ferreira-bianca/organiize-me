//
//  MainCoordinator.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 24/01/23.
//

import UIKit

enum AppFlow  {
    case Home
    case Categories
}

class MainCoordinator: MainBaseCoordinator {
    //MARK: - Variables
    var parentCoordinator: MainBaseCoordinator?
    
    //MARK: - Lazy Variables
    lazy var homeCoordinator: HomeBaseCoordinator = HomeCoordinator()
    lazy var rootViewController: UIViewController = UITabBarController()
    
    //MARK: - Functions
    func start() -> UIViewController {
        let homeViewController = homeCoordinator.start()
        homeCoordinator.parentCoordinator = self
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.circle"), tag: 0)
        
        (rootViewController as? UITabBarController)?.viewControllers = [homeViewController]
        return rootViewController
    }
    
    func moveTo(flow: AppFlow) {
        switch flow {
        case .Home:
            (rootViewController as? UITabBarController)?.selectedIndex = 0
        case .Categories:
            let categoryVC = CategoriesListTableViewController()
            categoryVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.circle"), tag: 1)
            (rootViewController as? UITabBarController)?.viewControllers?.append(categoryVC)
            (rootViewController as? UITabBarController)?.selectedIndex = 1
        }
    }
    
    func resetToRoot() -> Self {
        homeCoordinator.resetToRoot()
        moveTo(flow: .Home)
        return self
    }
    
}

//MARK: - Based Coordinators
protocol MainBaseCoordinator: Coordinator {
    //MARK: - Variables
    var homeCoordinator: HomeBaseCoordinator { get }
    
    //MARK: - Functions
    func moveTo(flow: AppFlow)
}

protocol HomeBaseCoordinated {
    var coordinator: HomeBaseCoordinator? { get }
}
