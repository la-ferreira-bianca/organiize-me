//
//  TaskModelRepository.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 02/03/23.
//

import Foundation

protocol TaskModelRepository {
    typealias TaskModelResult = Result<TaskModel, TaskModelError>
    
    func getTask(with identifier: String, handler: @escaping (TaskModelResult) -> Void)
    func postTask(with title: String, _ description: String, handler: @escaping (TaskModelResult) -> Void)
}
