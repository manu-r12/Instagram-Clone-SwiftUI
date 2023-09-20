//
//  AddEmailView.swift
//  InstaClone
//
//  Created by Manu on 2023-08-24.
//

import SwiftUI

struct AddEmailView: View {
    
    @Environment (\.dismiss) var dismiss

    @EnvironmentObject var viewModal: RegisterViewModal
    var body: some View {
        VStack(spacing: 12){
            Text("Add your email")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("You'll use this email to log into your account")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 8)
            
            TextField("Enter Your Email", text: $viewModal.email)
                .textInputAutocapitalization(.none)
                .modifier(IGTextFieldModifier())
            
            NavigationLink {
                CreateUsernameView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                Text("Next")
                    .fontWeight(.semibold)
                    .frame(width: 340, height: 40)
                    .foregroundColor(.white)
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
            }  .padding(.vertical, 20)
          
           
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

struct AddEmailView_Previews: PreviewProvider {
    static var previews: some View {
        AddEmailView()
    }
}
