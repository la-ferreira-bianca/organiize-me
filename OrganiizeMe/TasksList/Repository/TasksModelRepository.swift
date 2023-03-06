//
//  TasksModelRepository.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 01/03/23.
//

import Foundation

protocol TasksModelRepository {
    typealias TasksModelResult = Result<TasksModel, TasksModelError>
    
    func getTasks(handler: @escaping (TasksModelResult) -> Void)
}

