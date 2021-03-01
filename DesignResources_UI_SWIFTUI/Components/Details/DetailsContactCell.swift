//
//  DetailsContactCell.swift
//  DesignResources_UI_SWIFTUI
//
//  Created by Hossam on 26/02/2021.
//

import SwiftUI

struct DetailsContactCell: View {

    var body: some View {
        ZStack{
        RoundedRectangle(cornerRadius: 35.0 , style: .continuous)
            .fill(Color.init(#colorLiteral(red: 0.9590840936, green: 0.9644495845, blue: 0.9811900258, alpha: 1)))
            HStack(spacing:24){
                VStack(spacing:4){
                    Circle()
                        .fill(Color.init(#colorLiteral(red: 0.8195355535, green: 0.8196542859, blue: 0.819509685, alpha: 1)))
                        .frame(width: 3, height: 3, alignment: .center)
                    
                    Circle()
                        .fill(Color.init(#colorLiteral(red: 0.8195355535, green: 0.8196542859, blue: 0.819509685, alpha: 1)))
                        .frame(width: 3, height: 3, alignment: .center)
                    
                    
                    Circle()
                        .fill(Color.init(#colorLiteral(red: 0.8195355535, green: 0.8196542859, blue: 0.819509685, alpha: 1)))
                        .frame(width: 3, height: 3, alignment: .center)
                  
                }
                
                Image("p7")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: 47, height: 47)
                    .offset(x:-7)
                
                VStack(alignment:.leading , spacing:3){
                    Text("Hossam Eldin")
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .fixedSize()
                    
                    Text("Guangzhou")
                        .font(.system(size: 12, weight: .regular, design: .rounded))
                        .accentColor(Color.init(#colorLiteral(red: 0.35682863, green: 0.3568845391, blue: 0.3568163514, alpha: 1)))
                        .fixedSize()
                }
                
                Spacer()
                RoundedRectangle(cornerRadius: 11 , style: .continuous)
                    .fill(Color.init(#colorLiteral(red: 1, green: 0.4634016156, blue: 0.4944792986, alpha: 1)))
                    .frame(width: 35, height: 35)
                    .overlay(
                        Image.init(systemName: "chevron.right")
                            .font(.system(size: 12, weight: .bold, design: .rounded))
                            .foregroundColor(Color.init(#colorLiteral(red: 1, green: 0.9426621199, blue: 0.9444884658, alpha: 1)))
                    )
                    
            }
            .padding(.horizontal)
            
        }
        .frame( height: 88)
    }
}

struct DetailsContactCell_Previews: PreviewProvider {
    static var previews: some View {
        DetailsContactCell()
            .previewLayout(.fixed(width: 345, height: 88))
    }
}
