//
//  ProfileView.swift
//  InstaClone
//
//  Created by Manu on 2023-08-21.
//

import SwiftUI

struct ProfileView: View {
    
    
    let user : User
    @State var showEditProfile = false

    // this is a computed value 
   var posts: [Post]{
        return Post.MOCK_POSTS.filter({ $0.user?.username == user.username })
    }
   
    var body: some View {
//        NavigationStack {
            ScrollView{
                //header
                VStack{
                    HStack(){
                        ProfileImageView(user: user)
                         
                           Spacer()
                        HStack(spacing: 9){
                            UserStateView(value: 3, title: "Posts")
                            UserStateView(value: 2003, title: "Followers")
                            UserStateView(value: 13, title: "Following")
                        }
                    }.padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 5){
                        Text(user.fullname ?? "")
                            .fontWeight(.bold)
                        Text(user.bio ?? "")
                        Text(user.username)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    Button {
                        if user.isCurrentUser {
                            showEditProfile.toggle()
                        }else{
                            print("follow")
                        }
                    } label: {
                        Text(user.isCurrentUser ? "Edit Profle": "Follow")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 360,height: 32)
                            .foregroundColor(.black)
                            .overlay(RoundedRectangle(cornerRadius:6).stroke(Color.gray, lineWidth: 1))
                           
                    }
                
                   
                    
                    Divider()

                }
                PostGridView(post: posts)
             
              
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .fullScreenCover(isPresented: $showEditProfile, content: {
                EditProfileVIew(user: user)
            })
      
//        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCK_USERS[0])
    }
}
