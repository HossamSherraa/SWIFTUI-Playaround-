//
//  ContentView.swift
//  DesignResources_UI_SWIFTUI
//
//  Created by Hossam on 23/02/2021.
//

import SwiftUI

struct ContentView: View {
  
    @Environment(\.horizontalSizeClass) var horizontalSizeClass : UserInterfaceSizeClass?
    @Environment(\.verticalSizeClass) var verticalSizeClass : UserInterfaceSizeClass?
    @State var currentNavigationTag : Int? = 0
    
    @State var currentSelected : Int? = 1
    
    var isRegularRegularSizeClass : Bool{
       horizontalSizeClass == .regular && verticalSizeClass == .regular
    }
    var body : some View {
        if isRegularRegularSizeClass {
            regularRegularView
        }else {
            defaultView
        }
    }
        var regularRegularView: some View {
            NavigationView{
            VStack(alignment:.leading){
            HStack{
                Image("p6")
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 21))
                    .frame(width: 70, height: 70)
                VStack(alignment:.leading, spacing:7){
                    Text("Hossam Sherraa")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                    Text("IOS Developer")
                        .font(.system(size: 16, weight: .thin, design: .rounded))
                }
                
            }
                Spacer(minLength: 50)
                VStack{
                ForEach(NavigationRowModel.someFakeRows){ row in
                    NavigationLink.init(
                        destination: Home(),
                        tag: row.id,
                        selection: $currentNavigationTag,
                        label: {NavigationViewRow.init(isSelected: row.isSelected, title: row.title)})
                        .navigationBarBackButtonHidden(true)
                    
                    Spacer()
                    
                    
                    
                }
                    Spacer()
                    
                    Text("logout")
                        .font(.system(size: 17, weight: .semibold, design: .rounded))
                }
                .frame( minHeight: 400, idealHeight: .infinity, maxHeight: .infinity, alignment: .center)
                
                
            }
            .padding()
            
        }
            .accentColor(.gray)
    }
    
    var defaultView : some View{
       
        TabView(selection: $currentSelected,
                content:  {
                    Home()
                        .tag(1)
                        .tabItem { Label("Home", systemImage: "house.fill") }
                    
                    Home()
                        .tag(2)
                        .tabItem { Label("Books", systemImage: "character.book.closed.fill") }
                    
                    
                    Home()
                        .tag(3)
                        .tabItem { Label("Productivity", systemImage: "lasso.sparkles") }
                    
                    
                    Home()
                        .tag(4)
                        .tabItem { Label("Snacks", systemImage: "dpad.fill") }
                    
                    
                    
                        
                })
            .accentColor(.black)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
