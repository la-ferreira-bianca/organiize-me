//
//  TasksModelRemoteRepository.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 02/03/23.
//

import Foundation

final internal class TasksModelRemoteRepository: TasksModelRepository {
    //MARK: Private Variables
    private let httpClient: HTTPClient
    private let api: TasksModelAPI
    private let executionQueue: DispatchQueue
    
    //MARK: Initializer
    internal init(httpClient: HTTPClient, api: TasksModelAPI, executionQueue: DispatchQueue = .main) {
        self.httpClient = httpClient
        self.api = api
        self.executionQueue = executionQueue
    }
    
    //MARK: Functions
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
    
    func deleteTask(with identifier: String, handler: @escaping (TaskModelResult) -> Void) {
        let json: [String: Any] = [
            "_id": identifier
        ]
        guard let url = URL(string: "\(api.tasksURL)/\(identifier)") else { return }
        httpClient.delete(json: json, url) { [unowned self] result in
            self.execute {
                switch result {
                case .success(_):
                    handler(.success(()))
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
        executionQueue.asyncAfter(deadline: .now() + 2, execute: action)
    }
}
