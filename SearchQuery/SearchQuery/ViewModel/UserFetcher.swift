//
//  UserFetcher.swift
//  SearchQuery
//
//  Created by Naseem Oyebola on 15/05/2022.
//

import Foundation
class UserFetcher: ObservableObject {
    
    @Published var users = [User]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    var text: String = "user"
    @Published var searchText: String = ""
    let service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
        fetchAllUsers()
    }
    
    func fetchAllUsers() {
        
        isLoading = true
        errorMessage = nil
       
        service.fetchUsers(with: ["q": text]) { [unowned self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    print(" This is why \(error)")
                case .success(let users):
                    print("--- sucess with \(users.count)")
                    self.users = users
                }
            }
        }
        
    }
    
}
