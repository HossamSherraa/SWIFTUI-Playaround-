//
//  NavigationViewRow.swift
//  DesignResources_UI_SWIFTUI
//
//  Created by Hossam on 23/02/2021.
//

import SwiftUI

struct NavigationViewRow: View {
    let isSelected : Bool
    let title : String
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 22 , style : .continuous)
            .fill(isSelected ? Color.black : Color.init(#colorLiteral(red: 0.9607843137, green: 0.9647058824, blue: 0.9803921569, alpha: 1)) )
            
            Text(title)
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .foregroundColor(isSelected ? Color.white : Color.black )
            
            
        }
        .frame(height:57)
    
        
    }
}
