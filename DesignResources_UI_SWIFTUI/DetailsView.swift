//
//  DetailsView.swift
//  DesignResources_UI_SWIFTUI
//
//  Created by Hossam on 26/02/2021.
//

import SwiftUI

struct DetailsView: View {
    @StateObject var viewModel : ViewModel = .init()
    @Environment(\.horizontalSizeClass) var horizontalSizeClass : UserInterfaceSizeClass?
   @State var isPresented  = false
    @Binding var isDetailsViewPresented : Bool
    var body: some View {
        VStack(spacing:10){
            HStack{
                Button(action: { withAnimation(.spring()) {
                    isDetailsViewPresented.toggle()
                }}, label: {
                    Image(systemName: "xmark.square.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 30, height: 30, alignment: .center)
                        .foregroundColor(Color.init(#colorLiteral(red: 0.03905681521, green: 0.2217929959, blue: 0.359074235, alpha: 1)))
                })
                    
                    
                Spacer()
            }
            .padding( .leading,20)
        CardView(isTextColorBlack: viewModel.cards.first!.isColorBlack , title: viewModel.cards.first!.title, subTitle: viewModel.cards.first!.subtitle, imageName: "fullBackground")
            .padding(8)
            
            
           
            
           
            ScrollView(.vertical, showsIndicators: false , content: {
                
                LazyVGrid(columns:
                    horizontalSizeClass == .regular ? [GridItem.init(.adaptive(minimum: 300), spacing: 20) , GridItem.init(.adaptive(minimum: 300), spacing: 20)] : [ GridItem.init(.flexible(minimum: 250), spacing: 20)]
     
                    , content: {
                    
                    ForEach(0..<4){ index in
                        DetailsContactCell()
                            .padding([.bottom])
                            .opacity(isPresented ? 1 : 0 )
                            .offset( y: isPresented ? 0 : -900)
                            .animation(Animation.spring().delay(0.02 * Double(index)))
                            
                    }
                    .padding(.horizontal)
   
                    
                    })
                
                
                RoundedRectangle.init(cornerRadius: 25.0, style: .continuous)
                    .frame(width: 87, height: 40, alignment: .center)
                    .foregroundColor(Color.init(#colorLiteral(red: 0.0431372549, green: 0.2196078431, blue: 0.3568627451, alpha: 1)))
                    .overlay(Text("Share")
                                .font(.system(size: 12, weight: .semibold, design: .rounded))
                                .foregroundColor(.white))
                    
                
            })
            
            
                .padding([.horizontal], horizontalSizeClass == .regular ? 100 : 0 )
            
            
            
            
          
            
           
           
        }
        
        .onAppear(perform: {
            isPresented.toggle()
        })
       
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(isDetailsViewPresented: .constant(true))
    }
}
