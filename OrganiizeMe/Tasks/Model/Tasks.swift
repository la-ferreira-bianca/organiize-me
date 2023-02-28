//
//  Tasks.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 28/02/23.
//

struct Tasks: Decodable {
    let allTasks: [Task]
    
    enum CodingKeys: String, CodingKey {
        case allTasks = "result"
    }
}

