//
//  FeedView.swift
//  InstaClone
//
//  Created by Manu on 2023-08-22.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 30){
                    ForEach(Post.MOCK_POSTS){ post in
                        FeedCell(post: post)
                    }
                }
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Image("logo")
                        .resizable()
                        .frame(width: 100, height: 60)
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Image(systemName: "paperplane")
                        
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
