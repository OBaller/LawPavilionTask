//
//  UserListView.swift
//  SearchQuery
//
//  Created by Naseem Oyebola on 15/05/2022.
//

import SwiftUI

struct UserListView: View {
    let users: [User]
    @State private var searchText: String = ""
    var filteredUsers: [User] {
        if searchText.count == 0 {
            return users
        } else {
            return users.filter {
                $0.login.lowercased().contains(searchText.lowercased())
            }.sorted()
        }
    }
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredUsers) { user in
                    NavigationLink {
                        UserDetailView(user: user)
                    } label: {
                        UserRowView(user: user)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Github Users")
            .searchable(text: $searchText)
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView(users: UserFetcher.successState().users)
    }
}
