//
//  CompleteSignUpView.swift
//  InstaClone
//
//  Created by Manu on 2023-08-24.
//

import SwiftUI

struct CompleteSignUpView: View {
    @Environment (\.dismiss) var dismiss
    @EnvironmentObject var viewModal: RegisterViewModal
    var body: some View {
        VStack(spacing: 12){
            Text("Welcome to Instagram, \(viewModal.username)")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
                .multilineTextAlignment(.center)
            
            Text("Click below to complete sign up and start using Instagram")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
            
            
          
            Button {
//                CreateUsernameView()
                Task { try await  viewModal.createUser()}
            } label: {
                Text("Sign Up")
                    .fontWeight(.semibold)
                    .frame(width: 340, height: 40)
                    .foregroundColor(.white)
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
            }  .padding(.vertical, 20)
            
                .padding(.vertical, 20)
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading) {
                
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
                
            }
            
        }
    }
}

struct CompleteSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteSignUpView()
    }
}
