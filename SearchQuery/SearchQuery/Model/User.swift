//
//  User.swift
//  SearchQuery
//
//  Created by Naseem Oyebola on 15/05/2022.
//

import Foundation

struct User: Codable, Identifiable, Comparable {
    let id: Double
    let login: String
    let avatarUrl: String?
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatarUrl = "avatar_url"
        case type
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(Double.self, forKey: .id)
        login = try values.decode(String.self, forKey: .login)
        avatarUrl = try values.decode(String.self, forKey: .avatarUrl)
        type = try values.decode(String.self, forKey: .type)
    }
    
    init(id: Double, login: String, avatarUrl: String, type: String) {
        self.id = id
        self.login = login
        self.avatarUrl = avatarUrl
        self.type = type
    }
    
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.login < rhs.login
    }
    static func <(lhs: User, rhs: User) -> Bool {
            return lhs.login < rhs.login
        }
    
    static func example1() -> User {
        return User(id: 24208344, login: "exam", avatarUrl: "https://avatars.githubusercontent.com/u/24208344?v=4", type: "Organization")
    }
    
    static func example2() -> User {
        return User(id: 2177000, login: "examplecode", avatarUrl: "https://avatars.githubusercontent.com/u/2177000?v=4", type: "User")
    }
}
