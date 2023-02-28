//
//  Task.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 28/02/23.
//

struct Task: Decodable {
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case title
    }
}
