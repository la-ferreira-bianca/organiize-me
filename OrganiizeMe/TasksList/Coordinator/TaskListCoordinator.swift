//
//  TaskListCoordinator.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 08/03/23.
//

import UIKit

class TaskListCoordinator: Coordinator {
    var rootViewController = UINavigationController()
    
    private lazy var tasksListViewController: TasksListTableViewController = {
        let vc = TasksListTableViewController()
        vc.title = "Minhas Tarefas"
        return vc
    }()
    
    init() {
        self.rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationBar.barTintColor = #colorLiteral(red: 0.191467334, green: 0.6420556003, blue: 0.7067605558, alpha: 1)
    }
    
    func start() {
        rootViewController.setViewControllers([tasksListViewController], animated: false)
    }
    
}
