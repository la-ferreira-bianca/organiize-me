//
//  Task.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 28/02/23.
//
import Foundation

struct TaskModel: Decodable {
    let id, title: String
    let description: String
//    let categoryId: String
//    let categoryTitle: String
//    let categoryDescription: String
//    let initialDate, finalDate: String?
//        let modelVersion: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title
        case description
//        case category
//        case initialDate
//        case finalDate
//        case modelVersion = "__v"
    }
    
//    enum CategoryCodingKeys: String, CodingKey {
//        case categoryId = "_id"
//        case categoryTitle = "title"
//        case categoryDescription = "description"
//    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
//        let nestedContainer = try values.nestedContainer(keyedBy: CategoryCodingKeys.self, forKey: .category)

        id = try values.decode(String.self, forKey: .id)
        title = try values.decode(String.self, forKey: .title)
        description = try values.decode(String.self, forKey: .description)
//        categoryId = try nestedContainer.decode(String.self, forKey: .categoryId)
//        categoryTitle = try nestedContainer.decode(String.self, forKey: .categoryTitle)
//        categoryDescription = try nestedContainer.decode(String.self, forKey: .categoryDescription)
//        initialDate = try values.decode(String.self, forKey: .initialDate)
//        finalDate = try values.decode(String.self, forKey: .finalDate)
//        modelVersion = try values.decode(Int.self, forKey: .modelVersion)
    }
}

enum TaskModelError: Error {
    case notParsable(Data)
    case fetchError(Error)
}
