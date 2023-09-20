//
//  RegisterViewModal.swift
//  InstaClone
//
//  Created by Manu on 2023-09-05.
//

import Foundation


class RegisterViewModal : ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    
    func createUser() async throws{
        try await AuthService.shared.createUser(email: email, password: password, username: username)
    }
}


