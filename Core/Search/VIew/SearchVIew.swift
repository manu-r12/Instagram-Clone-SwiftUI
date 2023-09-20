
//  SearchVIew.swift
//  InstaClone
//  Created by Manu on 2023-08-23.


import SwiftUI

struct SearchVIew: View {
    
    @State var value = ""
    
    @StateObject var viewModal = SearchViewModal()
    var body: some View {
       
        NavigationStack {
            ScrollView{
                LazyVStack{
                    ForEach(viewModal.users) {user in
                        NavigationLink(value: user, label: {
                            HStack{
                                Image(systemName: "person.circle")
                                    .resizable()
                                    .scaledToFill()
                                    .foregroundStyle(.gray)
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                
                                VStack{
                                    Text(user.fullname ?? "")
                                        .fontWeight(.semibold)
                                    Text(user.username)
                                    
                            }
                                Spacer()
                          

                            }
                            .foregroundColor(.black)
                        })
                        .padding(.horizontal)
                        
                    }
                    
                }
                .padding(.top, 8)
                .searchable(text: $value, prompt: "Search")
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SearchVIew_Previews: PreviewProvider {
    static var previews: some View {
        SearchVIew()
    }
}




