//
//  HomeCoordinator.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 24/01/23.
//

import UIKit

class HomeCoordinator: HomeBaseCoordinator {
    //MARK: - Variables
    var parentCoordinator: MainBaseCoordinator?
    lazy var rootViewController: UIViewController = UIViewController()
    
    //MARK: - Functions
    func start() -> UIViewController {
        rootViewController = UINavigationController(rootViewController: HomeViewController(coordinator: self))
        return rootViewController
    }
    
    
    func gotoTasksList() {
        print("testes funcionalidade goto task list")
//        let taskListViewController = TasksListViewController(coordinator: self)
//        navigationController?.pushViewController(taskListViewController, animated: true)
    }
    
    
    
   
    
}
