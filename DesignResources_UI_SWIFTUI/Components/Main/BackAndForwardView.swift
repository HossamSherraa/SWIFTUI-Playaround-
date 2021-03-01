//
//  BackAndForwardView.swift
//  DesignResources_UI_SWIFTUI
//
//  Created by Hossam on 23/02/2021.
//

import SwiftUI

struct BackAndForwardView: View {
    var body: some View {
        HStack{
            Image.init(systemName: "arrow.backward")
                .font(.system(size: 19, weight: .bold, design: .rounded))
                
                
                
            Spacer()
            Image.init(systemName: "arrow.right")
                .font(.system(size: 19, weight: .bold, design: .rounded))
                
                .foregroundColor(Color.init(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
        }
        .frame(width: 80, alignment: .center)
    }
}

struct BackAndForwardView_Previews: PreviewProvider {
    static var previews: some View {
        BackAndForwardView()
    }
}
