//
//  PostGridView.swift
//  InstaClone
//
//  Created by Manu on 2023-08-25.
//

import SwiftUI

struct PostGridView: View {
    
    let post : [Post]
    private let griditem : [GridItem] = [
        .init(.flexible(), spacing: 2),
        .init(.flexible(), spacing: 2),
        .init(.flexible(), spacing: 2)
        
    ]
    
    
    private let imageDimensions : CGFloat = (UIScreen.main.bounds.width / 3 ) - 1
    
    var body: some View {
        
        LazyVGrid(columns: griditem, spacing: 2) {
            ForEach(post) { post in
                Image(post.imageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageDimensions, height: imageDimensions)
                    .clipped()
            }
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView(post: Post.MOCK_POSTS)
    }
}
