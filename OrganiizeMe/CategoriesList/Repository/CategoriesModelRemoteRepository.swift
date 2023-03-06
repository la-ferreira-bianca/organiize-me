//
//  CategoriesModelRemoteRepository.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 03/03/23.
//

import Foundation

final internal class CategoriesModelRemoteRepository: CategoriesModelRepository {
    
    private let httpClient: HTTPClient
    private let api: CategoriesModelAPI
    private let executionQueue: DispatchQueue
    
    internal init(httpClient: HTTPClient, api: CategoriesModelAPI, executionQueue: DispatchQueue = .main) {
        self.httpClient = httpClient
        self.api = api
        self.executionQueue = executionQueue
    }
    
    func getCategories(handler: @escaping (CategoriesModelResult) -> Void) {
        httpClient.get(api.categoriesURL) { [unowned self] result in
            self.execute {
                switch result {
                case .success(let data):
                    if let dto = Self.parse(type: CategoriesModel.self, data: data) {
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
        executionQueue.asyncAfter(deadline: .now() + 2, execute: action)
    }
}
