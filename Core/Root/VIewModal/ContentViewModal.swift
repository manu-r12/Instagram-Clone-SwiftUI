//
//  ContentViewModal.swift
//  InstaClone
//
//  Created by Manu on 2023-09-05.
//

import Foundation
import Firebase
import Combine


class ContentViewModal : ObservableObject {
    
    
    private let service = AuthService.shared
    private var cancellabe = Set<AnyCancellable>()
    
    @Published var userSession : FirebaseAuth.User?
    @Published var currentUser : User?
    init(){
        setUpSubscribers()
    }
    
    func setUpSubscribers(){
        service.$userSession.sink{[weak self] userSession in
            self?.userSession = userSession
        }.store(in: &cancellabe)
        
        service.$currentUser.sink{[weak self] currentUser in
            self?.currentUser = currentUser
        }.store(in: &cancellabe)
    }
    
    
}
    

