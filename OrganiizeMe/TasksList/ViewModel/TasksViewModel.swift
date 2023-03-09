//
//  TasksViewModel.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 28/02/23.
//

import Foundation

class TasksViewModel {
    //MARK: - Private Variables
    private let repository: TasksModelRepository = TasksModelRemoteRepository(httpClient: URLSessionHTTPClient(), api: .dev)
    var error: ObservableObject<String?> = ObservableObject(value: nil)
    var tasks: ObservableObject<[TaskModel]?> = ObservableObject(value: nil)
    var coordinator = TaskListCoordinator()
    
    init(coordinator: TaskListCoordinator) {
        self.coordinator = coordinator
    }
    
    //MARK: - Functions
    func fetchTasks() {
        repository.getTasks { [unowned self] result in
            switch result {
            case .success(let tasksData):
                self.tasks.value = tasksData.allTasks
            case .failure(let error):
                self.error.value = error.localizedDescription
            }
        }
    }
    
    func didTapTask(with id: String) {
        coordinator.didTapTask(with: id)
    }
}


