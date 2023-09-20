//
//  CurrentUserProfileView.swift
//  InstaClone
//
//  Created by Manu on 2023-08-25.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    let user: User
    
    private let griditem : [GridItem] = [
        .init(.flexible(), spacing: 2),
        .init(.flexible(), spacing: 2),
        .init(.flexible(), spacing: 2)
        
    ]
    
    var body: some View {
        NavigationStack{
            ProfileView(user: user)
//            ScrollView{
//                //header
//                VStack{
//                    HStack(){
//                        Image("img5")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 100, height: 90)
//                            .clipShape(Circle())
//                         
//                           Spacer()
//                        HStack(spacing: 9){
//                            UserStateView(value: 3, title: "Posts")
//                            UserStateView(value: 2003, title: "Followers")
//                            UserStateView(value: 13, title: "Following")
//                        }
//                    }.padding(.horizontal)
//                    
//                    VStack(alignment: .leading, spacing: 5){
//                        Text("Minnie Mills")
//                            .fontWeight(.bold)
//                        Text("\(Image(systemName: "heart")) 사랑\(Image(systemName: "star"))")
//                        Text("\(user.email)")
//                    }
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(.horizontal)
//                    
//                    Button {
//                        
//                    } label: {
//                        Text("Edit Profile")
//                            .font(.subheadline)
//                            .fontWeight(.semibold)
//                            .frame(width: 360,height: 32)
//                            .foregroundColor(.black)
//                            .overlay(RoundedRectangle(cornerRadius:6).stroke(Color.gray, lineWidth: 1))
//                           
//                    }
//                   
//                    
//                    Divider()
//
//                }
//                
//             
//                
//                PostGridView(post: Post.MOCK_POSTS)
//            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }

                }
            }
        }
    }
}

struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView(user: User.MOCK_USERS[0])
    }
}
