//
//  MainCoordinator.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 24/01/23.
//

import UIKit

enum AppFlow  {
    case TasksList
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
        case .TasksList:
            (rootViewController as? UITabBarController)?.selectedIndex = 0
        }
    }
    
    func resetToRoot() -> Self {
        homeCoordinator.resetToRoot()
        moveTo(flow: .TasksList)
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
