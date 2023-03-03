//
//  TaskViewModel.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 02/03/23.
//

import Foundation

final class TaskViewModel {
    //MARK: - Private Variables
    private let repository: TaskModelRepository = TaskModelRemoteRepository(httpClient: URLSessionHTTPClient(), api: .dev)
    
    var error: ObservableObject<String?> = ObservableObject(value: nil)
    var task: ObservableObject<String?> = ObservableObject(value: nil)

    //MARK: - Functions
    func fetchTask(with id: String) {
        repository.getTask(with: id) { [unowned self] result in
            switch result {
            case .success(let taskData):
                self.task.value = taskData.title
            case .failure(let error):
                self.error.value = error.localizedDescription
            }
        }
    }
    
}
