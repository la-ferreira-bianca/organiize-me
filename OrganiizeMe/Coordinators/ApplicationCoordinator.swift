//
//  ApplicationCoordinator.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 08/03/23.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    
    let window: UIWindow?
    
    var childCoordinators = [Coordinator]()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let mainCoordinator = MainCoordinator()
        mainCoordinator.start()
        self.childCoordinators = [mainCoordinator]
        window?.rootViewController = mainCoordinator.rootViewController
    }
}
