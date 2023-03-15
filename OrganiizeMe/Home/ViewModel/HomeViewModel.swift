//
//  HomeViewModel.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 15/03/23.
//

import Foundation

class HomeViewModel {
    var coordinator = HomeCoordinator()
    
    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
    }
}
