//
//  FeedCell.swift
//  InstaClone
//
//  Created by Manu on 2023-08-22.
//

import SwiftUI




struct FeedCell: View {
    
    let post: Post
    var body: some View {
        
      
        VStack{
            HStack{
      
                if let user = post.user {
                    Image(user.profileImageUrl ?? "")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                    Spacer()
                }
            }
            .padding(.leading, 8)
            Image(post.imageUrl)
                .resizable()
                .frame(height: 400)
                .clipShape(Rectangle())

            HStack(spacing: 16){
                    
                Button {
                    print("Clicked")
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
                Button {
                    print("clicked")
                } label: {
                    Image(systemName: "message")
                        .imageScale(.large)
                }
                Button {
                    print("Clicked")
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
                
                Spacer()

            }
            .padding(.leading, 8)
            .padding(.top, 8)
            .foregroundColor(.black)
            
            Text("194 Likes")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 8)
                .padding(.top, 1)
            
            HStack{
                Text("mills ").fontWeight(.semibold) +
                Text(post.caption)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 8)
            
            Text("3h ago")
                .padding(.leading, 8)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.gray)
        }
        
    }
}



struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: Post.MOCK_POSTS[0])
    }
}
