//
//  AddTaskViewModel.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 04/03/23.
//

import Foundation

final class AddTaskViewModel {
    private let repository: TaskModelRepository = TaskModelRemoteRepository(httpClient: URLSessionHTTPClient(), api: .dev)
    
    var error: ObservableObject<String?> = ObservableObject(value: nil)
    var task: ObservableObject<TaskModel?> = ObservableObject(value: nil)
    
    func addTask(with title: String) {
        repository.postTask(with: title) { [unowned self] result in
            switch result {
            case .success(let taskData):
                self.task.value = taskData
            case .failure(let error):
                self.error.value = error.localizedDescription
            }
        }
    }
}
