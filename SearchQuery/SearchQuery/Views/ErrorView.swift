//
//  ErrorView.swift
//  SearchQuery
//
//  Created by Naseem Oyebola on 15/05/2022.
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var userFetcher: UserFetcher
    var body: some View {
        VStack {
            Text("😿")
                .font(.system(size: 80))
            Text(userFetcher.errorMessage ?? "")
            Button {
                userFetcher.fetchAllUsers()
            } label: {
                Text("Try again")
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(userFetcher: UserFetcher())
    }
}
