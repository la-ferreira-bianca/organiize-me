//
//  CategoriesModelRepository.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 03/03/23.
//

import Foundation

protocol CategoriesModelRepository {
    typealias CategoriesModelResult = Result<CategoriesModel, CategoriesModelError>
    
    func getCategories(handler: @escaping (CategoriesModelResult) -> Void)
}
