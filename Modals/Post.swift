//
//  Post.swift
//  InstaClone
//
//  Created by Manu on 2023-08-25.
//

import Foundation
import Firebase

// Identifiable = it can be looped with an id automatically without providing
struct Post : Hashable , Identifiable, Codable{
    let id : String
    let ownerid: String
    let caption: String
    let likes: Int
    let imageUrl : String
    let timeStamp : Timestamp
    var user: User?
    
    
}


extension Post {
    static var MOCK_POSTS : [Post] = [
    
        .init(id: NSUUID().uuidString, ownerid: NSUUID().uuidString, caption: "Wanna eat fresh corn ", likes: 223, imageUrl: "img7", timeStamp: Timestamp(), user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString, ownerid: NSUUID().uuidString, caption: "Emily in low light ", likes: 2123, imageUrl: "img6", timeStamp: Timestamp(), user: User.MOCK_USERS[1]),
        .init(id: NSUUID().uuidString, ownerid: NSUUID().uuidString, caption: "Enjoying the day", likes: 12223, imageUrl: "img3", timeStamp: Timestamp(), user: User.MOCK_USERS[2]),
        
//        .init(id: NSUUID().uuidString, ownerid: NSUUID().uuidString, caption: "Happy life to you", likes: 12323, imageUrl: "img4", timeStamp: Date(), user: User.MOCK_USERS[3]),
    
    ]
}
