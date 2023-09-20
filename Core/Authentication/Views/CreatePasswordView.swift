//
//  CreatePasswordView.swift
//  InstaClone
//
//  Created by Manu on 2023-08-24.
//

import SwiftUI

struct CreatePasswordView: View {
  
    @Environment (\.dismiss) var dismiss
    @EnvironmentObject var viewModal: RegisterViewModal
    var body: some View {
        VStack(spacing: 12){
            Text("Create a password ")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("Password must be at least 6 character long")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 8)
            
            SecureField("Password", text: $viewModal.password)
                .textInputAutocapitalization(.none)
                .modifier(IGTextFieldModifier())
            NavigationLink {
                CompleteSignUpView()
                    .navigationBarBackButtonHidden(true)
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

struct CreatePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePasswordView()
    }
}
