//
//  IGTextFieldModifier.swift
//  InstaClone
//
//  Created by Manu on 2023-08-24.
//

import Foundation
import SwiftUI


struct IGTextFieldModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)
    }
}
