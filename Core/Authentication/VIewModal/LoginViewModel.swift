//
//  LoginViewModel.swift
//  InstaClone
//
//  Created by Manu on 2023-09-07.
//

import Foundation


class LoginViewModel : ObservableObject {
    @Published var email  = ""
    @Published var password  = ""
    
    
    func signIn() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
    
    func testing() {
        print("it is working")
        print("email : \(email)")
        print("email : \(password)")
    }
}
