//
//  TasksRequest.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 28/02/23.
//

import Alamofire

struct TasksRequest: Request {
    var path: String {
        "tasks"
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var encoding: ParameterEncoding {
        URLEncoding()
    }

    // Como adicionar um header "Authorization" a esta Request?
    // Opcional: como adicionar um parâmetro "category" que só aceite os valores "hound", "pug" ou "husky" a esta Request?
}
