//
//  TasksModelRemoteRepository.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 02/03/23.
//

import Foundation

final internal class TasksModelRemoteRepository: TasksModelRepository {
    private let httpClient: HTTPClient
    private let api: TasksModelAPI
    private let executionQueue: DispatchQueue
    
    internal init(httpClient: HTTPClient, api: TasksModelAPI, executionQueue: DispatchQueue = .main) {
        self.httpClient = httpClient
        self.api = api
        self.executionQueue = executionQueue
    }
    
    func getTasks(handler: @escaping (TasksModelResult) -> Void) {
        httpClient.get(api.tasksURL) { [unowned self] result in
            self.execute {
                switch result {
                case .success(let data):
                    if let dto = Self.parse(type: TasksModel.self, data: data) {
                        handler(.success(dto))
                    } else {
                        handler(.failure(.notParsable(data)))
                    }
                    
                case .failure(let error):
                    handler(.failure(.fetchError(error)))
                }
            }
        }
    }
    
    //MARK: - Helpers
    private static func parse<T: Decodable>(type: T.Type, data: Data) -> T? {
        return try? JSONDecoder().decode(T.self, from: data)
    }
    
    private func execute(action: @escaping () -> Void) {
        executionQueue.async(execute: action)
    }
}
