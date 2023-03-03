//
//  TasksAPI.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 01/03/23.
//

import Foundation

//MARK: - TASKS
struct TasksModelAPI {
    let environment: Environment
    
    init(environment: Environment) {
        self.environment = environment
    }
}

extension TasksModelAPI {
    var tasksURL: URL { getURL(path: "tasks") }
}

//MARK: - TASK
struct TaskModelAPI {
    let environment: Environment
    
    init(environment: Environment) {
        self.environment = environment
    }
}

extension TaskModelAPI {
    var taskURL: URL { getURL(path: "tasks") }
}


//MARK: - Helpers
fileprivate extension TasksModelAPI {
    func getURL(path: String) -> URL {
        URL(string: "\(environment.baseURL)/\(path)")!
    }
}

fileprivate extension TaskModelAPI {
    func getURL(path: String) -> URL {
        URL(string: "\(environment.baseURL)/\(path)")!
    }
}
