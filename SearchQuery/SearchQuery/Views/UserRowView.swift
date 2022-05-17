//
//  UserRowView.swift
//  SearchQuery
//
//  Created by Naseem Oyebola on 15/05/2022.
//

import SwiftUI

struct UserRowView: View {
    let user: User
    let imageSize:CGFloat = 100
    var body: some View {
        HStack {
            if user.avatar_url != nil {
                AsyncImage(url: URL(string: user.avatar_url!)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFill()
                            .frame(width: imageSize, height: imageSize)
                            .clipped()
                    } else if phase.error != nil {
                        Text(phase.error?.localizedDescription ?? "error")
                            .foregroundColor(Color.pink)
                            .frame(width: imageSize, height: imageSize)
                    } else {
                        ProgressView()
                            .frame(width: imageSize, height: imageSize)
                    }
                }
            } else {
                Color.gray.frame(width: imageSize, height: imageSize)
                
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(user.login)
                    .font(.headline)
                Text(user.type)
            }
        }
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView(user: User.init(id: 24208344, login: "", avatar_url: "", type: ""))
            .previewLayout(.fixed(width: 400, height: 200))
    }
}
