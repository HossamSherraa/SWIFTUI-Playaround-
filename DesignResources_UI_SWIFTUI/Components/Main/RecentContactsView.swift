//
//  RecentContactsView.swift
//  DesignResources_UI_SWIFTUI
//
//  Created by Hossam on 23/02/2021.
//

import SwiftUI

struct RecentContactsCardView: View {
    var body: some View {
        ZStack{
            RoundedRectangle.init(cornerRadius: 39, style: .continuous)
                .fill(LinearGradient.init(gradient: Gradient(colors: [Color.init(#colorLiteral(red: 0.6745098039, green: 0.9176470588, blue: 1, alpha: 1)), Color.init(#colorLiteral(red: 0.8745098039, green: 0.9803921569, blue: 1, alpha: 1))]), startPoint: .top, endPoint: .bottom))
            VStack(alignment:.leading){
            Text("Recent Contacts")
                .font(.system(size: 16, weight: .regular, design: .rounded))
                ForEach(0..<4) { _ in
                    ContactCell(imageName: "", title: "", subTitle: "")
                        .padding(.vertical , 10)
        
                }
            }
            .padding(40)
        }
        .frame(width: 260, height: 370, alignment: .center)
    }
    
}

struct ContactCell : View {
    let imageName : String
    let title : String
    let subTitle : String
    var body: some View {
        HStack{
            Image("1")
                .resizable()
                .clipShape(Circle())
                .frame(width: 38, height: 38, alignment: .center)
            VStack(alignment:.leading , spacing: 8){
                Text("Title Bro Evers")
                    .font(.system(size: 13, weight: .medium, design: .rounded))
                Text("Chicago")
                    .font(.system(size: 11, weight: .thin, design: .rounded))
            }
            Spacer()
            Image.init(systemName: "chevron.right")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 10, height: 10, alignment: .center)
        }

    }
}

struct RecentContactsView_Previews: PreviewProvider {
    static var previews: some View {
        RecentContactsCardView()
    }
}
