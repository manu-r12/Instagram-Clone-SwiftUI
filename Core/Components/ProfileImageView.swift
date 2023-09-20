//
//  ProfileImageView.swift
//  InstaClone
//
//  Created by Manu on 2023-09-19.
//

import SwiftUI
import Kingfisher

struct ProfileImageView: View {
    
    let user: User
    var body: some View {
        if let profileImage = user.profileImageUrl{
            KFImage(URL(string: profileImage))
                .resizable()
                .scaledToFill()
                .frame(width: 80,height: 80)
                .clipShape(Circle())
        }else{
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 80,height: 80)
                .clipShape(Circle())
        }
    }
}

#Preview {
    ProfileImageView(user: User.MOCK_USERS[1])
}


