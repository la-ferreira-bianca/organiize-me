//
//  CategoryModelRepository.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 03/03/23.
//

import Foundation

protocol CategoryModelRepository {
    typealias CategoryModelResult = Result<CategoryModel, CategoryModelError>
    
    func getCategory(with identifier: String, handler: @escaping (CategoryModelResult) -> Void)
}
