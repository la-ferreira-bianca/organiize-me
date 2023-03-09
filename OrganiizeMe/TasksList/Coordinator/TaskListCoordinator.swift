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
        let viewModel = TasksViewModel(coordinator: self)
        let vc = TasksListTableViewController(viewModel: viewModel)
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
    
    func didTapTask(with id: String) {
        //todo: when the coordinator for the taskview is completed, change this values
        //to create the coordinator and the view model, the rest the taskcoordinator
        //will handle
        let taskDetails = TaskViewController(taskID: id)
        rootViewController.pushViewController(taskDetails, animated: true)
    }
    
}
