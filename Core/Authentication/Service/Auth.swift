//
//  Auth.swift
//  InstaClone
//
//  Created by Manu on 2023-09-04.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestoreSwift

class AuthService {
    
    
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser : User?
    static let shared = AuthService()
    
    init(){
       
        Task {try await loadUser()}
    }
    @MainActor
    func login(withEmail email: String, password: String) async throws{
        
        do {
            
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession  = result.user
            try await loadUser()
        }catch{
            print("Failed To Create:\(error)")
        }
    }
    
    @MainActor
    func createUser(email: String, password: String, username: String) async throws{
  
        
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            await uploadUserData(uid: result.user.uid, username: username, email: email)
        }catch{
            print("Failed To Create:\(error)")
        }
    }
    @MainActor
    func loadUser() async throws {
        self.userSession = Auth.auth().currentUser
        guard let currentUserUid = userSession?.uid else {return}
        let snapshot = try await Firestore.firestore().collection("users").document(currentUserUid).getDocument()

 
        self.currentUser = try?  snapshot.data(as: User.self)
    }
    
    
    
    
    func signOut(){
        try? Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil
    }
    
    
    private func uploadUserData(uid: String, username: String, email: String )async{
        let user = User(id: uid, username: username,email: email)
        self.currentUser = user
        guard let encodeUser = try? Firestore.Encoder().encode(user) else {return}
        
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodeUser)
    }
}

