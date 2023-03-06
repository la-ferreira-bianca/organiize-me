//
//  Tasks.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 28/02/23.
//
import Foundation

//MARK: - Model from JSON
struct TasksModel: Decodable {
    let allTasks: [TaskModel]
    
    enum CodingKeys: String, CodingKey {
        case allTasks = "result"
    }
}

extension TasksModel {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        allTasks = try values.decode([TaskModel].self, forKey: .allTasks)
    }
}

enum TasksModelError: Error {
    case notParsable(Data)
    case fetchError(Error)
}
