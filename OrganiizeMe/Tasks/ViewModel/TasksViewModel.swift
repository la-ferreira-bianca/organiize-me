//
//  TasksViewModel.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 28/02/23.
//

import Foundation

class TasksViewModel {
    //MARK: - Private Variables
    private let repository: TasksModelRepository
    private let onSuccess: (_ tasksValues: [TaskModel]) -> Void
    private let onError: (_ errorMessage: String) -> Void
    
    //MARK: - Private Variables
    init(repository: TasksModelRepository, onSuccess: @escaping (_ taskValue: [TaskModel]) -> Void, onError: @escaping (_ errorMessage: String) -> Void) {
        self.repository = repository
        self.onSuccess = onSuccess
        self.onError = onError
    }
    
    //MARK: - Functions
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


