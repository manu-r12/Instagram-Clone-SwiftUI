//
//  UploadPostModal.swift
//  InstaClone
//
//  Created by Manu on 2023-08-28.
//

import Foundation
import PhotosUI
import SwiftUI
import Firebase

//guard var itemPicker : ImagePaint

@MainActor
class UploadPostViewModal: ObservableObject {
    
    @Published var selectedImage: PhotosPickerItem?{
        didSet {Task {await loadImage(fromitem: selectedImage)}}
    }
    
    private var uiImage : UIImage?
    
    @Published var pickedImage: Image?
    func loadImage(fromitem item: PhotosPickerItem?) async {
        guard let item = item else {return}
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        
        guard let uiImage = UIImage(data: data) else {return}
        self.uiImage = uiImage
        self.pickedImage =  Image(uiImage: uiImage)
    }
    
    func uploadPost(caption : String) async  throws {
        
        guard let uid = Auth.auth().currentUser?.uid else {return }
        guard let uiImage = uiImage else {return }
        
        let postRef = Firestore.firestore().collection("posts").document()
        guard let imageUrl = try? await ImageUploader.uploadImage(image: uiImage) else {return}
        let post = Post(id: postRef.documentID, ownerid: uid, caption: caption, likes: 0, imageUrl: imageUrl, timeStamp: Timestamp())
        
        guard let encodedPost = try? Firestore.Encoder().encode(post) else {return}
        try await postRef.setData(encodedPost)
                
                
        
    }
    
}
