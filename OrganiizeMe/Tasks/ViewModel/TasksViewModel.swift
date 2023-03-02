//
//  TasksViewModel.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 28/02/23.
//

import Foundation
import Alamofire

class TasksViewModel {
    private let repository: TasksModelRepository
    
    private let onSuccess: (_ taskValue: [TaskModel]) -> Void
    private let onError: (_ errorMessage: String) -> Void
    
    init(repository: TasksModelRepository, onSuccess: @escaping (_ taskValue: [TaskModel]) -> Void, onError: @escaping (_ errorMessage: String) -> Void) {
        self.repository = repository
        self.onSuccess = onSuccess
        self.onError = onError
    }
    
    func fetchTasks() {
        repository.getTasks { [unowned self] result in
            switch result {
            case .success(let tasksData):
                self.onSuccess(tasksData.allTasks)
            case .failure(let error):
                self.onError(error.localizedDescription)
            }
        }
    }
}


