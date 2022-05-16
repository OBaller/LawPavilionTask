//
//  LoadingView.swift
//  SearchQuery
//
//  Created by Naseem Oyebola on 15/05/2022.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 20)  {
            Image("githubIcon")
                .resizable()
                .frame(width: 200, height: 100)
            ProgressView()
            Text("Getting the users ...")
                .foregroundColor(.gray)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
