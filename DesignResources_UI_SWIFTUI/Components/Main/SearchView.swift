//
//  SearchView.swift
//  DesignResources_UI_SWIFTUI
//
//  Created by Hossam on 23/02/2021.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        TextField("Search", text: .constant(""))
            .padding(.leading, 50)
            .frame( height: 52, alignment: .center)
            .background(
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .center), content: {
                    
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .strokeBorder(Color.gray, style: .init(lineWidth: 1))
                        
                        Image.init(systemName: "magnifyingglass")
                            .resizable()
                            .offset(x: 15)
                            .frame(width: 23, height: 23, alignment: .center)
                        
                    
                })
                
            )
            .padding()
            
            
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
