//
//  CategoriesAPI.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 03/03/23.
//

import Foundation

//MARK: - Categories
struct CategoriesModelAPI {
    let environment: Environment
    
    init(environment: Environment) {
        self.environment = environment
    }
}

extension CategoriesModelAPI {
    var categoriesURL: URL { getURL(path: "categories") }
}

//MARK: - Category
struct CateogoryModelAPI {
    let environment: Environment
    
    init(environment: Environment) {
        self.environment = environment
    }
}

extension CateogoryModelAPI {
    var categoriesURL: URL { getURL(path: "categories") }
}

//MARK: - Helpers
fileprivate extension CategoriesModelAPI {
    func getURL(path: String) -> URL {
        URL(string: "\(environment.baseURL)/\(path)")!
    }
}

fileprivate extension CateogoryModelAPI {
    func getURL(path: String) -> URL {
        URL(string: "\(environment.baseURL)/\(path)")!
    }
}
