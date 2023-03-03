//
//  APIEnvironment.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 02/03/23.
//

import Foundation
struct APIEnvironment: Environment {
    let baseURL: String = "http://34.30.232.59"
}

extension TasksModelAPI {
    static var dev: Self {
        TasksModelAPI(environment: APIEnvironment())
    }
}

extension TaskModelAPI {
    static var dev: Self {
        TaskModelAPI(environment: APIEnvironment())
    }
}
