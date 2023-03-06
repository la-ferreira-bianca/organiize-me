//
//  CategoriesModel.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 03/03/23.
//

import Foundation

struct CategoriesModel: Decodable {
    let allCategories: [CategoryModel]
    
    enum CodingKeys: String, CodingKey {
        case allCategories = "result"
    }
}

enum CategoriesModelError: Error {
    case notParsable(Data)
    case fetchError(Error)
}
