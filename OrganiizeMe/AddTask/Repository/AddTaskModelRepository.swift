//
//  TaskModelRepository.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 02/03/23.
//

import Foundation

protocol AddTaskModelRepository {
    typealias TaskModelResult = Result<TaskModel, TaskModelError>
    
    func addTask(_ task: String, handler: @escaping (TaskModelResult) -> Void)
}
