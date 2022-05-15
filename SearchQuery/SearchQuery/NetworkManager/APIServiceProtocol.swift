//
//  APIServiceProtocol.swift
//  SearchQuery
//
//  Created by Naseem Oyebola on 15/05/2022.
//

import Foundation
protocol APIServiceProtocol {
    func fetchBreeds(url: URL?, completion: @escaping(Result<[User], APIError>) -> Void)
}
