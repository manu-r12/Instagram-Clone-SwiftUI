//
//  CreateUsernameView.swift
//  InstaClone
//
//  Created by Manu on 2023-08-24.
//

import SwiftUI

struct CreateUsernameView: View {
    
   
    @Environment (\.dismiss) var dismiss
    @EnvironmentObject var viewModal: RegisterViewModal
    var body: some View {
        VStack(spacing: 12){
            Text("Add your Username")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("You'll use this email to log into your account")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 8)
            
            TextField("Username", text: $viewModal.username)
                .textInputAutocapitalization(.none)
                .modifier(IGTextFieldModifier())
            NavigationLink {
                CreatePasswordView()
                    .navigationBarBackButtonHidden()
            } label: {
                Text("Next")
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
struct CreateUsernameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUsernameView()
    }
}
