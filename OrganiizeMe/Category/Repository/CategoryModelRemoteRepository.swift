//
//  CategoryModelRemoteRepository.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 03/03/23.
//

import Foundation

final internal class CategoryModelRemoteRepository: CategoryModelRepository {
    
    private let httpClient: HTTPClient
    private let api: CateogoryModelAPI
    private let executionQueue: DispatchQueue
    
    internal init(httpClient: HTTPClient, api: CateogoryModelAPI, executionQueue: DispatchQueue = .main) {
        self.httpClient = httpClient
        self.api = api
        self.executionQueue = executionQueue
    }
    
    func getCategory(with categoryID: String, handler: @escaping (CategoryModelResult) -> Void) {
        guard let url = URL(string: "\(api.categoriesURL)/\(categoryID)") else { return }
        httpClient.get(url) { [unowned self] result in
            self.execute {
                switch result {
                case .success(let data):
                    if let dto = Self.parse(type: CategoryModel.self, data: data) {
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
