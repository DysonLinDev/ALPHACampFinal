//
//  BookSingleton.swift
//  ALPHACampFinal
//
//  Created by MBPrDyson on 4/29/16.
//  Copyright © 2016 MBPrDyson. All rights reserved.
//

import Foundation
import Firebase

class Books {
    var bookArray:[Book]?
    private let myRef = Firebase(url: "https://shining-heat-7573.firebaseio.com/")
    
    func load() {
        // Read data and react to changes
        
        myRef.observeEventType(.ChildAdded, withBlock: {
            snapshot in
            print(snapshot)
//            print("\(snapshot.key) -> \(snapshot.value)")
        })
    }
    
    static let myBooks = Books()
}