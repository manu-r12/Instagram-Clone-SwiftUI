
//  EditProfileModal.swift
//  InstaClone
//  Created by Manu on 2023-09-13.



import SwiftUI
import Firebase
import PhotosUI

@MainActor
class EditProfileModal: ObservableObject {
    
    @Published var user: User
    @Published var fullname = ""
    @Published var bio = ""
    private var uiImage: UIImage?
    
    init(user: User){
        self.user = user
    }
    @Published var selectedImage: PhotosPickerItem?{
        didSet {Task {await loadImage(fromitem: selectedImage)}}
    }
    
    // MArk

    @Published var profileImage: Image?
    func loadImage(fromitem item: PhotosPickerItem?) async {
        guard let item = item else {return}
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
   
        guard let uiImage = UIImage(data: data) else {return}
        self.uiImage = uiImage
        self.profileImage =  Image(uiImage: uiImage)
    }
    
    // MARK: Uploading user info
    // basically we are checking if there's been any change
    // if there is, then we will update that specific value to the database
    
    func updateUserData() async throws {
        
        var data = [String:Any]()
        
        if let uiImage = uiImage{
         let imageUrl  = try? await  ImageUploader.uploadImage(image: uiImage)
        data["profileImageUrl"] = imageUrl
        }
        
        if !fullname.isEmpty && user.fullname != fullname {
            data["fullname"] = fullname
        }
        
        
        if !bio.isEmpty && user.bio != bio{
            data["bio"] = bio

        }
        
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }
}
