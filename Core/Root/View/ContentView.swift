//
//  ContentView.swift
//  InstaClone
//
//  Created by Manu on 2023-08-21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModal = ContentViewModal()
    @StateObject var registrationViewModal = RegisterViewModal()
    var body: some View {
     
        Group{
            
            if viewModal.userSession == nil {
                LoginView()
                    .environmentObject(registrationViewModal)
            }else if let currentUser = viewModal.currentUser {
                TabBar(user: currentUser)
            }
            
        }
     


      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
