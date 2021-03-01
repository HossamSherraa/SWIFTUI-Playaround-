//
//  CardsFilterView.swift
//  DesignResources_UI_SWIFTUI
//
//  Created by Hossam on 23/02/2021.
//

import SwiftUI

struct CardsFilterView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass : UserInterfaceSizeClass?
    var body: some View {
        ZStack{
            if horizontalSizeClass == .regular{
        RoundedRectangle(cornerRadius: 12, style: .continuous)
            .fill(Color.init(#colorLiteral(red: 0.9607843137, green: 0.9647058824, blue: 0.9803921569, alpha: 1)))
            .frame(width: horizontalSizeClass == .regular ? 134 : 110 , height: horizontalSizeClass == .regular ? 50 : 45 , alignment: .center)
            }
            
            HStack{
                Text("Popular")
                    .font(.system(size: 17, weight: .semibold, design: .rounded))
                Image(systemName: "chevron.down")
                    .font(.system(size: 10, weight: .bold, design: .rounded))
                
            }
        }
        
    }
}

struct CardsFilterView_Previews: PreviewProvider {
    static var previews: some View {
        CardsFilterView()
    }
}
