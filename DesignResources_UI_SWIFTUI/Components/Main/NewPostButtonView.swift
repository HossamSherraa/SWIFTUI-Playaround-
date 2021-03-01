//
//  NewPostButton.swift
//  DesignResources_UI_SWIFTUI
//
//  Created by Hossam on 23/02/2021.
//

import SwiftUI

struct NewPostButton: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass : UserInterfaceSizeClass?
    
    var body: some View {
        Button(action: {}, label: {
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .stroke(Color.gray)
                .frame(width: horizontalSizeClass == .regular ? 188 : 110 , height: horizontalSizeClass == .regular ? 70 : 45 , alignment: .center)
                .overlay(
                    Text("New Post")
                        .font(.system(size: horizontalSizeClass == .regular ? 20 : 15 , weight: .semibold, design: .rounded))
                        .foregroundColor(.black)
                )
        })
    }
}

struct NewPostButton_Previews: PreviewProvider {
    static var previews: some View {
        NewPostButton()
    }
}
