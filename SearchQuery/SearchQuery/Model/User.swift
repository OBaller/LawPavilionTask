//
//  User.swift
//  SearchQuery
//
//  Created by Naseem Oyebola on 15/05/2022.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Double
    let login: String
    let avatar_url: String?
    let type: String
    
    
     
//    enum CodingKeys: String, CodingKey {
//        case id
//        case login
//        case avatarUrl = "avatar_url"
//        case type
//    }

    
//    init(id: Double, login: String, avatar_url: String, type: String) {
//        self.id = id
//        self.login = login
//        self.avatarUrl = avatar_url
//        self.type = type
//    }
    

    
//    static func example1() -> User {
//        return User(id: 24208344, login: "exam", avatar_url: "https://avatars.githubusercontent.com/u/24208344?v=4", type: "Organization")
//    }
//
//    static func example2() -> User {
//        return User(id: 2177000, login: "examplecode", avatar_url: "https://avatars.githubusercontent.com/u/2177000?v=4", type: "User")
//    }
}


struct UserModel: Codable {
    var items: [User]
}
