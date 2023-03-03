//
//  CategoryModel.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 03/03/23.
//

import Foundation

struct CategoryModel: Decodable {
    let id: String
    let title: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title
        case description
    }
}

enum CategoryModelError: Error {
    case notParsable(Data)
    case fetchError(Error)
}
