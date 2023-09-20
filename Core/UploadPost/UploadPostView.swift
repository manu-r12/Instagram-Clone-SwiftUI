//
//  UploadPostView.swift
//  InstaClone
//
//  Created by Manu on 2023-08-28.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State var caption = ""
    @State private var imagePickerPresented = false
    @State private var photosItem : PhotosPickerItem?
    @StateObject var viewModal  =  UploadPostViewModal()
    @Binding var tabIndex : Int
    
    
    var body: some View {
        VStack{
            HStack{
                Button {
                    clearAllAndReturnToView()
                } label: {
                    Text("Cancel")
                }
                
                Spacer()
                Text("New Post")
                Spacer()
                Button {
                    Task {
                        try await viewModal.uploadPost(caption:caption)
                        clearAllAndReturnToView()
                    }
                } label: {
                    Text("Upload")
                }

            }
            .padding(.horizontal)
            
            HStack{
                if let image = viewModal.pickedImage{
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipped()
                }
                
                TextField("Add Caption here....", text: $caption, axis: .vertical)
            }.padding()
            
            Spacer()
        }
        .onAppear{
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModal.selectedImage)
    }
    
    func clearAllAndReturnToView(){
        caption = ""
        viewModal.pickedImage = nil
        viewModal.selectedImage = nil
        tabIndex = 0
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView(tabIndex: .constant(0))
    }
}


// TODO: for tomorrow
// connect the database to this project
// learn and grasp every concept you are using in this project
// have faith in yourself
// apply to interships

