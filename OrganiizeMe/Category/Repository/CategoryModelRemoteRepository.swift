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
    
    func postCategory(with title: String, and description: String? = "", handler: @escaping (CategoryModelResult) -> Void) {
        guard let url = URL(string: "\(api.categoriesURL)/") else { return }
        let json: [String: Any] = ["title": title,
                                   "description": description]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        // create post request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        // insert json data to the request
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let _ = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
        }
        task.resume()
    }
    
    //MARK: - Helpers - todo change this to use only from one place
    private static func parse<T: Decodable>(type: T.Type, data: Data) -> T? {
        return try? JSONDecoder().decode(T.self, from: data)
    }
    
    private func execute(action: @escaping () -> Void) {
        executionQueue.async(execute: action)
    }
}
