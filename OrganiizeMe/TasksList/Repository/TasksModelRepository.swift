//
//  TasksModelRepository.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 01/03/23.
//

import Foundation

protocol TasksModelRepository {
    typealias TasksModelResult = Result<TasksModel, TasksModelError>
    typealias TaskModelResult = Result<Void, TaskModelError>
    
    func getTasks(handler: @escaping (TasksModelResult) -> Void)
    func deleteTask(with identifier: String, handler: @escaping (TaskModelResult) -> Void)
}

