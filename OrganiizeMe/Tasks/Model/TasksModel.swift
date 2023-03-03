//
//  Tasks.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 28/02/23.
//
import Foundation

//MARK: - Model from JSON
internal struct TasksModel: Decodable {
    let allTasks: [TaskModel]
    
    enum CodingKeys: String, CodingKey {
        case allTasks = "result"
    }
}

enum TasksModelError: Error {
    case notParsable(Data)
    case fetchError(Error)
}
