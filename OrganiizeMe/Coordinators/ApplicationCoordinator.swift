//
//  ApplicationCoordinator.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 08/03/23.
//

import UIKit
import Combine

class ApplicationCoordinator: Coordinator {
    
    let window: UIWindow?
    
    var childCoordinators = [Coordinator]()
    
    //TODO: change this after in the final touches with false
    //ADD THIS TO LOGIN AS WELL
    let hasSeenOnboarding = CurrentValueSubject<Bool, Never>(false)
    var subscriptions = Set<AnyCancellable>()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        setupOnboardingValue()
        
        hasSeenOnboarding.sink { [weak self] hasSeenOnboarding in
            if hasSeenOnboarding {
                let mainCoordinator = MainCoordinator()
                mainCoordinator.start()
                self?.childCoordinators = [mainCoordinator]
                self?.window?.rootViewController = mainCoordinator.rootViewController
            } else if let hasSeenOnboarding = self?.hasSeenOnboarding {
                let onboardingCoordinator = OnboardingCoordinator(hasSeenOnboarding: hasSeenOnboarding)
                onboardingCoordinator.start()
                self?.childCoordinators = [onboardingCoordinator]
                self?.window?.rootViewController = onboardingCoordinator.rootViewController
                
            }
        }.store(in: &subscriptions)
    }
    
    func setupOnboardingValue() {
        //storing and loading of datas/states
        let key = "hasSeenOnboarding"
        let value = UserDefaults.standard.bool(forKey: key)
        hasSeenOnboarding.send(value)
        
        hasSeenOnboarding.filter({ $0 }).sink { value in
            UserDefaults.standard.set(value, forKey: key)
        }.store(in: &subscriptions)
    }
}
