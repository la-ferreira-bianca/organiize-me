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
    
    //MARK: - Variables
    var error: ObservableObject<String?> = ObservableObject(value: nil)
    var tasks: ObservableObject<[TaskModel]?> = ObservableObject(value: nil)
    var didDeleteTask: ObservableObject<Bool> = ObservableObject(value: false)

    var coordinator = TaskListCoordinator()
    
    init(coordinator: TaskListCoordinator?) {
        guard let coordinator = coordinator else { return }
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
    
    func showTask(with id: String) {
        coordinator.showTaskDetails(with: id)
    }
    
    func deleteTask(with id: String) {
        repository.deleteTask(with: id) { result in
            switch result {
            case .success(_):
                self.didDeleteTask.value = true
            case .failure(let error):
                self.didDeleteTask.value = false
                self.error.value = error.localizedDescription
            }
        }
    }
}


