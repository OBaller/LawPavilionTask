//
//  APIServiceProtocol.swift
//  SearchQuery
//
//  Created by Naseem Oyebola on 15/05/2022.
//

import Foundation
protocol APIServiceProtocol {
    func fetchUsers(with: [String: String], completion: @escaping(Result<[User], APIError>) -> Void)
}
