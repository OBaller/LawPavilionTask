//
//  APIService.swift
//  SearchQuery
//
//  Created by Naseem Oyebola on 15/05/2022.
//

import Foundation
import SwiftUI


struct APIService: APIServiceProtocol {
    
    func fetch<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping(Result<T,APIError>) -> Void) {
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        let task = URLSession.shared.dataTask(with: url) {(data , response, error) in
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            } else if  let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(type, from: data)
                    completion(Result.success(result))
                    
                } catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
                
            }
        }
        
        task.resume()
    }
    
    
    
    
    func fetchUsers(with: [String: String], completion: @escaping(Result<[User], APIError>) -> Void) {
        
        
        guard let url = NSURLComponents(string: "https://api.github.com/search/users") else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        var item = [URLQueryItem]()
        for (key, value) in with {
            item.append(URLQueryItem(name: key, value: value))
        }
        
        item = item.filter{!$0.name.isEmpty}
        
        if !item.isEmpty {
            url.queryItems = item
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url.url!)) {(data , response, error) in
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            } else if  let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let users = try decoder.decode(UserModel.self, from: data)
                    completion(Result.success(users.items))
                    
                } catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
            }
        }
        
        task.resume()
        
    }
}
