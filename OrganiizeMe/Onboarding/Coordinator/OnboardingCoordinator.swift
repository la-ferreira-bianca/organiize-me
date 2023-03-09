//
//  OnboardingCoordinator.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 09/03/23.
//

import UIKit
import Combine

class OnboardingCoordinator: Coordinator {
    var rootViewController = UINavigationController()
    
    var hasSeenOnboarding: CurrentValueSubject<Bool, Never>
    
    private lazy var onboardingViewController: OnboardingViewController = {
        let vc = OnboardingViewController(hasSeenOnboarding: hasSeenOnboarding)
        vc.title = "Onboarding"
        return vc
    }()
    
    init(hasSeenOnboarding: CurrentValueSubject<Bool, Never>) {
        self.rootViewController = UINavigationController()
        rootViewController.navigationBar.barTintColor = .green
        self.hasSeenOnboarding = hasSeenOnboarding
    }
    
    func start() {
        rootViewController.setViewControllers([onboardingViewController], animated: false)
    }
}
