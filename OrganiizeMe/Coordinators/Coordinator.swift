//
//  FlowCoordinator.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 24/01/23.
//

import UIKit

protocol FlowCoordinator: AnyObject {
    //MARK: - Variables
    var parentCoordinator: MainBaseCoordinator? { get set }
}

protocol Coordinator: FlowCoordinator {
    //MARK: - Variables
    var rootViewController: UIViewController { get set }
    func start() -> UIViewController
    @discardableResult func resetToRoot() -> Self
}

extension Coordinator {
    //MARK: - Variables
    var navigationController: UINavigationController? {
        get {
            (rootViewController as? UINavigationController)
        }
    }
    
    //MARK: - Functions
    func resetToRoot() -> Self {
        navigationController?.popToRootViewController(animated: false)
        return self
    }
}
