//
//  UserStateView.swift
//  InstaClone
//
//  Created by Manu on 2023-08-22.
//

import SwiftUI

struct UserStateView: View {
    var value: Int
    var title: String
    var body: some View {
        VStack{
            Text("\(value)")
                .fontWeight(.medium)
            Text(title)
                .fontWeight(.medium)
            
        }
        .frame(width: 80)
    }
}

struct UserStateView_Previews: PreviewProvider {
    static var previews: some View {
        UserStateView(value: 3, title: "Hello")
    }
}
