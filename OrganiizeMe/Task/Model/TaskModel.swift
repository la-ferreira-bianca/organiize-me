//
//  Task.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 28/02/23.
//
import Foundation

struct TaskModel: Decodable {
    let id: String
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title
    }
}

enum TaskModelError: Error {
    case notParsable(Data)
    case fetchError(Error)
}
