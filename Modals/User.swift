//  User.swift
//  InstaClone
//  Created by Manu on 2023-08-24.


import Foundation


import Firebase

struct User : Identifiable,Hashable,  Codable{
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
    
    
    var isCurrentUser: Bool {
        guard let currentUserId = Auth.auth().currentUser?.uid else {return false}
        
        return currentUserId == id
    }
}



extension User{
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "mad.line",
              profileImageUrl: "img2", fullname: "Madlyne",
              bio: "An Actor", email: "madlinelove@gmail.com"),
        .init(id: NSUUID().uuidString, username: "minnie.mills",
              profileImageUrl: "img3", fullname: "Minnie Mills",
              bio: "Free Soul", email: "minnimills@gmail.com"),
        .init(id: NSUUID().uuidString, username: "minnie.manu",
              profileImageUrl: "img5", fullname: "Minnie Miller",
              bio: "him makes me happy", email: "minnimillsmanu@gmail.com"),
    ]
}

 
    

