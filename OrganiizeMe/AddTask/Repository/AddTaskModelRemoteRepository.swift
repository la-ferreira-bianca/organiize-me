//
//  TaskModelRemoteRepository.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 02/03/23.
//

import Foundation

final internal class AddTaskModelRemoteRepository: AddTaskModelRepository {
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
    func addTask(_ task: String, handler: @escaping (TaskModelResult) -> Void) {
        guard let urlRequest = try? URLRequest(url: api.taskURL, method: .post) else { return }
        httpClient.post(urlRequest, body: task) { [unowned self] result in
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
