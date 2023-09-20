//
//  LoginView.swift
//  InstaClone
//
//  Created by Manu on 2023-08-24.
//

import SwiftUI


struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
  
    
    var body: some View {
        NavigationStack {
            VStack{
                Spacer()
                Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 270, height: 110)
                // hover the data
                // MARK: -
                VStack{
                    TextField("Enter Your Email", text: $viewModel.email)
                        .textInputAutocapitalization(.none)
                        .modifier(IGTextFieldModifier())
                    SecureField("Password", text: $viewModel.password)
                        .modifier(IGTextFieldModifier())
                }
                // when we have that password
                Button {
                print("Hello ")
                } label: {
                    Text("Forgot your password")
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                
                Button {
                    // when we have those data to be fethced out
                    print("Hello ")
                    Task  { try await viewModel.signIn()}
                } label: {
                    Text("Login")
                        .fontWeight(.semibold)
                        .frame(width: 340, height: 40)
                        .foregroundColor(.white)
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                    
                }
                .padding(.vertical, 20)
                
                HStack{
                    
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40,
                               height: 0.5)
                    Text("Or")
                    
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40,
                               height: 0.5)
                }
                
                HStack{
                    Image("fb-logo")
                    
                    
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Continue With Facebook")
                }
                .padding(.top,8)

                Spacer()
                
                Divider()
                // Navigation Link to pages (different pages)
                NavigationLink {
                   AddEmailView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack{
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }

                
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}



