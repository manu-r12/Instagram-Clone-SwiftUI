//
//  TabBar.swift
//  InstaClone
//  Created by Manu on 2023-08-21.


import SwiftUI


struct TabBar: View {
    let user: User
    @State private var screenIndex =  0
    var body: some View {
        TabView(selection: $screenIndex){
        
            FeedView()
                .onAppear{
                    screenIndex  = 0
                }
                    .tabItem {
                        Image(systemName: "house")
                    }.tag(0)
                
               SearchVIew()
                    .onAppear{
                        screenIndex  = 1
                    }
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                }.tag(1)
            
            
   
            UploadPostView(tabIndex: $screenIndex)
                .onAppear{
                    screenIndex  = 2
                }
                .tabItem {
                    Image(systemName: "plus.square")
                }.tag(2)
            
            
            

            Text("Notification")
                .onAppear{
                    screenIndex  = 3
                }
                .tabItem {
                    Image(systemName: "heart")
                }.tag(3)
            
            
           
            CurrentUserProfileView(user: user)
                .onAppear{
                    screenIndex  = 4
                }
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                }.tag(4)
            
        }
        .accentColor(.red)
        
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(user: User.MOCK_USERS[1])
    }
}
