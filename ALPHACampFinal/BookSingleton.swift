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
    private let myRef = Firebase(url: "https://shining-heat-7573.firebaseio.com/Books")
    
    func load() {
        // Read data and react to changes
        
        myRef.queryOrderedByChild("Book").observeEventType(.ChildAdded, withBlock: {
            snapshot in
            
            print(snapshot)
            
            let book = Book()
            book.bookIndex = snapshot.key
            book.bookName = snapshot.value.objectForKey("bookName") as? String
            book.bookPic = snapshot.value.objectForKey("bookPic") as? String
            book.bookShopAdd = snapshot.value.objectForKey("bookShopAdd") as? String
            book.bookShopTel = snapshot.value.objectForKey("bookShopTel") as? String
            book.bookIntroUrl = snapshot.value.objectForKey("bookName") as? String
            book.bookInfo = snapshot.value.objectForKey("bookInfo") as? String
            
            Books.myBooks.bookArray?.append(book)
        })
    }
    
    
    func save() {
        let index = self.getBookDataIndex()
        let book = Book()
        book.bookName = "NAME890"
        book.bookPic = "PICjkld"
        book.bookShopAdd = ""
        book.bookShopTel = ""
        book.bookIntroUrl = "URL__123qwe"
        book.bookInfo = "INFO__erds"
        
        let saveRef = myRef.childByAppendingPath(String(index))
        saveRef.setValue(book.convertToDictonary())
    }
    
    private func initBookDataIndex() {
        let userDefault = NSUserDefaults.standardUserDefaults()
        if userDefault.objectForKey("index") == nil {
            userDefault.setObject(1, forKey: "index")
            userDefault.synchronize()
        }
    }
    
    private func getBookDataIndex() -> String {
        let userDefault = NSUserDefaults.standardUserDefaults()
        let index =  userDefault.objectForKey("index") as! Int
        self.addBookDataIndex()
        return String(index)
    }
    
    private func addBookDataIndex() {
        let userDefault = NSUserDefaults.standardUserDefaults()
        if userDefault.objectForKey("index") != nil {
            let index = ( userDefault.objectForKey("index") as! Int ) + 1
            userDefault.setObject(index, forKey: "index")
            userDefault.synchronize()
        }
    }
    
    init() {
     self.initBookDataIndex()
    }
    
    static let myBooks = Books()
}