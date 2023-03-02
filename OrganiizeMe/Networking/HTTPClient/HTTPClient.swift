//
//  HTTPClient.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 28/02/23.
//

import Foundation

public protocol HTTPClient {
    typealias ResponseResult = Result<Data, Error>
    
    func get(_ url: URL, responseHandler: @escaping (ResponseResult) -> Void)
}
