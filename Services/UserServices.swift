//
//  UserServices.swift
//  InstaClone
//
//  Created by Manu on 2023-09-09.
//

import Foundation
import Firebase

struct UserServices {
   static func fetchAllUsers() async throws -> [User]{
        var users = [User]()
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let docs = snapshot.documents
        // to turn data into an array of users of type User
        // we can try this
        for doc in docs {
            guard let user = try? doc.data(as: User.self) else {return users}
            users.append(user)
        }
       
       return users
    }
}
