//
//  SearchViewModal.swift
//  InstaClone
//
//  Created by Manu on 2023-09-09.
//

import Foundation


class SearchViewModal : ObservableObject {
    @Published var users = [User]()
    
    init(){
        Task {try await fetchAllUsers()}
    }
    
    func fetchAllUsers() async throws {
        self.users = try await UserServices.fetchAllUsers()
    }
}
