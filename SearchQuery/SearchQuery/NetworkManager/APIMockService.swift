//
//  APIMockService.swift
//  SearchQuery
//
//  Created by Naseem Oyebola on 17/05/2022.
//

import Foundation

struct APIMockService: APIServiceProtocol {
    
    var result: Result<[User], APIError>
    
    func fetchUsers(with: [String: String], completion: @escaping(Result<[User], APIError>) -> Void) {
        completion(result)
    }
    
}
