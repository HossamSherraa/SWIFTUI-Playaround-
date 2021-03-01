//
//  ViewModel.swift
//  DesignResources_UI_SWIFTUI
//
//  Created by Hossam on 23/02/2021.
//

/*
 1- get Current Size
 2- update numberOfCo
 */
import Combine
import Foundation
import SwiftUI
struct Card : Identifiable{
    let title : String
    let subtitle : String
    let imageName : String
    let isColorBlack : Bool
    var id : Int
    
  
}
class ViewModel : ObservableObject {
    var subscribtions = Set<AnyCancellable>()
    var removeFirstRowPublisher = PassthroughSubject<Void , Never>()
    
    
    var counter = 0
    let delayAmount = 0.04
    var numberOfColumns = 0
    var delay : Double {
        return Double(counter) * delayAmount
    }
    @Published var cards : [Card] =
        (0...120).map({ index in
         return
                Card.init(title: "Being\nProductive"
                          , subtitle: "The word productive often describes a person's capability to do a lot of work"
                          , imageName: Int.random(in: 1...3).description,
                          isColorBlack: true, id: index
                )
    
        })
        
    init(){
       removeFirstRowPublisher
    
        .sink(receiveValue: {[weak self ]_ in
            guard let self = self  , self.cards.count > self.numberOfColumns else{return}
            self.cards.removeSubrange(0...self.numberOfColumns)
        })
        .store(in: &subscribtions)
        
        
        
        
            
    }
    
    
    func updateNumberOfCoulmns(value : CGFloat){
        self.numberOfColumns =  Int(value / 280 )-1
        
    }
    
        
}




struct NavigationRowModel : Identifiable {
    var isSelected : Bool
    let title : String
    var id : Int
    
    static var someFakeRows : [NavigationRowModel] = [
        NavigationRowModel.init(isSelected: true , title: "Home", id: 0) ,
        NavigationRowModel.init(isSelected: false , title: "Books", id: 1) ,
        NavigationRowModel.init(isSelected: false , title: "Productivity", id: 2) ,
        NavigationRowModel.init(isSelected: false , title: "Snacks", id: 3) ,
    ]
}



struct CardXPositionPrefenceKeyValue  : Equatable {
   
    
    var point : CGFloat
    
    
}

struct CardXPositionPreferenceKey : PreferenceKey {

    static var defaultValue: [CGFloat] = []
    
    static func reduce(value: inout [CGFloat], nextValue: () -> [CGFloat]) {
        value.append(contentsOf: nextValue())
    }
    
    typealias Value = [CGFloat]
    
}
