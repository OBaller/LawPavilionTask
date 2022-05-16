//
//  UserDetailView.swift
//  SearchQuery
//
//  Created by Naseem Oyebola on 15/05/2022.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    let imageSize: CGFloat = 300
    
    var body: some View {
        ScrollView {
            VStack {
                if user.avatarUrl != nil {
                    AsyncImage(url: URL(string: user.avatarUrl!)) { phase in
                        if let image = phase.image {
                            image.resizable()
                                .scaledToFit()
                                .frame( height: imageSize)
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
                }else {
                    Color.gray.frame(height: imageSize)
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text(user.login)
//                        .font(.headline)
                    Text(user.type)
//                        .font(.footnote)
                    
                    Spacer()
                }.padding()
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(user: User.example1())
    }
}
