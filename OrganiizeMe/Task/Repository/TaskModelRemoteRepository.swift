//
//  TaskModelRemoteRepository.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 02/03/23.
//

import Foundation

final internal class TaskModelRemoteRepository: TaskModelRepository {
    //MARK: Private Variables
    private let httpClient: HTTPClient
    private let api: TaskModelAPI
    private let executionQueue: DispatchQueue
    
    //MARK: Initializer
    internal init(httpClient: HTTPClient, api: TaskModelAPI, executionQueue: DispatchQueue = .main) {
        self.httpClient = httpClient
        self.api = api
        self.executionQueue = executionQueue
    }
    //MARK: Functions
    func getTask(with taskID: String, handler: @escaping (TaskModelResult) -> Void) {
        guard let url = URL(string: "\(api.taskURL)/\(taskID)") else { return }
        httpClient.get(url) { [unowned self] result in
            self.execute {
                switch result {
                case .success(let data):
                    if let dto = Self.parse(type: TaskModel.self, data: data) {
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
    
    //MARK: - Helpers - todo change this to use only from one place
    private static func parse<T: Decodable>(type: T.Type, data: Data) -> T? {
        return try? JSONDecoder().decode(T.self, from: data)
    }
    
    private func execute(action: @escaping () -> Void) {
        executionQueue.async(execute: action)
    }
}
