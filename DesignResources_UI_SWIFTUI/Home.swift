//
//  Home.swift
//  DesignResources_UI_SWIFTUI
//
//  Created by Hossam on 23/02/2021.
//

import SwiftUI
import Combine
struct Home: View {
    @ObservedObject var viewModel = ViewModel()
    @State var isDetailsViewPresented = false
    @Environment(\.horizontalSizeClass) var horizontalSizeClass : UserInterfaceSizeClass?
    @Environment(\.imageScale) var imageScale : Image.Scale
    var body: some View {
        viewModel.counter = 0
        return
            ZStack{
                Color.clear
                    .background(GeometryReader(content: { proxy-> Color in
                        let width =  proxy.frame(in: .global).size.width
                        viewModel.updateNumberOfCoulmns(value: width)
                        return Color.clear
                    }))

            VStack{
            //TopBar
            HStack{
               
                if horizontalSizeClass == .regular{
                SearchView()
                    .frame(minWidth: 100, idealWidth: 300, maxWidth: 300)
                }

               
                
                
                HStack(spacing:50){
                    Spacer()
                    Image("ideaIcon")
                        .imageScale(imageScale)
                    
                    Image("writeIcon")
                        
                        .imageScale(imageScale)
                    
                    
                    NewPostButton()
                    
        
                }
                
            }
           
           
            
                if isDetailsViewPresented{
                    DetailsView(isDetailsViewPresented: $isDetailsViewPresented)
                        .transition(AnyTransition.move(edge: .top).combined(with: AnyTransition.opacity).animation(.spring()))
        
                }else {
                Group{
            HStack{
                Text("Design Resources")
                    .font(Font.system(horizontalSizeClass == .regular ? .largeTitle : .title2 , design: .rounded)
                            .bold()
                    )
                    .onTapGesture {
                        withAnimation(.spring()) {
                            isDetailsViewPresented.toggle()
                        }
                        
                    }
                
                Spacer()
                CardsFilterView()
                    .offset(x: horizontalSizeClass == .compact ? 0  : 40 )
                if horizontalSizeClass == .regular{
                    Spacer()
                    BackAndForwardView()
                    
                }
                
            }
                
            
           
            ScrollView{
                LazyVGrid(columns: [.init(.adaptive(minimum: 270, maximum: 270), spacing: 20, alignment: .center)]) {
                    ForEach(viewModel.cards, id: \.id) { element -> AnyView in
                        viewModel.counter += 1
                       
                      return  AnyView.init(erasing:
                            
                                        CardView(isTextColorBlack: element.isColorBlack, title: element.title, subTitle: element.subtitle, imageName: element.imageName)
                                            .padding(.bottom, 20)
                                            .transition(AnyTransition.move(edge: .top)
                                                            .combined(with: AnyTransition.opacity)
                                                            .animation(
                                                                Animation.linear
                                                                    .delay(viewModel.delay))
                                            )
                                            .animation(Animation.spring().delay(viewModel.delay))
                                            
                                           
                            )
                      
                            
                    }
                }
                .padding(.top, 3)
                
        
            
            
            
            }
            .disabled(true)
            
            
            
        }
                .transition(AnyTransition.move(edge: isDetailsViewPresented ? .top : .bottom ).combined(with: AnyTransition.opacity).animation(.spring()))
                
               
            }
            }
            }
        
        .padding(.horizontal)
            .navigationBarHidden(horizontalSizeClass != .regular)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .gesture(DragGesture()
                    .onEnded({ (value) in
                        if value.translation.height < 60 {
                           
                            viewModel.removeFirstRowPublisher.send()
                            
                        }
                        
                    }))
        .coordinateSpace(name: "Home")
        
        
        
        }
       
        
    }


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
