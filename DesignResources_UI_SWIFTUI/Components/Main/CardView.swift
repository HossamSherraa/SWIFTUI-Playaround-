//
//  CardView.swift
//  DesignResources_UI_SWIFTUI
//
//  Created by Hossam on 23/02/2021.
//

import SwiftUI

struct CardView: View {
    let isTextColorBlack : Bool
    let title : String
    let subTitle : String
    let imageName : String
    var body: some View {
       ZStack(alignment: Alignment(horizontal: .center, vertical: .center), content: {
            
            GeometryReader(content: { geometry in
                
                Image(imageName)
                    .resizable()
                    .clipShape(RoundedRectangle.init(cornerRadius: geometry.size.height  / 15, style: .continuous))
            })
                    
           
            
    
                    
            VStack(alignment:.leading){
                VStack(alignment:.leading){
                   
                        
                    Text(title)
                        .font(.system(size: 27, weight: .bold, design: .rounded))
                        .lineLimit(2)
                        .foregroundColor(isTextColorBlack ? Color.black: Color.white)
                       
                        .fixedSize()
                    
                    Text(subTitle)
                        .font(.system(size: 15, weight: .regular, design: .rounded))
                        .padding(.top, 10)
                        .foregroundColor(isTextColorBlack ? Color.black: Color.white)
                        .lineLimit(2)
                    
                       
                        
                }
                .padding([.top , .leading], 30)
                
                
                Spacer()
                HStack{
                    Spacer()
                Circle()
                    .fill(Color.white)
                    .overlay(Image(systemName: "arrowtriangle.right.fill"))
                    .frame(width: 44, height: 44, alignment: .center)
                    
                }
                .padding([.bottom , .trailing], 30)
            }
            
            
        })
        
       .frame( minHeight:210, idealHeight: 400, maxHeight: .infinity, alignment: .center)
        
        
         
        
            
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView( isDetailsViewPresented: .constant(true))
    }
}
