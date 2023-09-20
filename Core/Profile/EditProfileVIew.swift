//
//  EditProfileVIew.swift
//  InstaClone
//
//  Created by Manu on 2023-09-13.
//

import SwiftUI
import PhotosUI

struct EditProfileVIew: View {
    @Environment(\.dismiss) var dismiss
   
    @StateObject var viewModal : EditProfileModal
    init(user: User){
        self._viewModal = StateObject   (wrappedValue: EditProfileModal(user: user))
    }
    var body: some View {
        VStack{
            // toolbar
             
            VStack {
                HStack{
                    Button("Cancel"){dismiss()}
                    Spacer()
                    
                    Text("Edit Your Profile")
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button(action: {
                        print("Update your profile")
                        Task {try await viewModal.updateUserData()}
                        dismiss()
                    }, label: {
                        Text("Done")
                            .fontWeight(.semibold)
                    })
                }
                .padding()
            }
            Divider()
          
            PhotosPicker(selection: $viewModal.selectedImage) {
                VStack {
                    if let image = viewModal.profileImage {
                        image
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.blue)
                            .background(.black)
                          .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    }else{
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.blue)
                            .background(.black)
                          .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    }
                    
                
                    Text("Upload an image")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                    
                    Divider()
                }
                    
            }
            VStack{
                EditProfileRowView(title: "Name", Placeholder: "Enter Your Name", text: $viewModal.fullname)
                EditProfileRowView(title: "Bio", Placeholder: "Enter your Bio", text: $viewModal.bio)
            }
            Spacer()
            
        }
    }
}


struct EditProfileRowView : View {
    let title:String
    let Placeholder:String
    @Binding var text:String
    
    var body: some View {
        HStack{
            Text(title)
                .padding(.leading, 8)
                .frame(width: 90, alignment: .leading)
            
            VStack{
                TextField(Placeholder, text: $text)
                
                Divider()
            }
            
        }
        .font(.subheadline)
        .frame(height: 38)
    }
}


#Preview {
    EditProfileVIew(user: User.MOCK_USERS[0])
}
