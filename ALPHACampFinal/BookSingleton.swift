//
//  BookSingleton.swift
//  ALPHACampFinal
//
//  Created by MBPrDyson on 4/29/16.
//  Copyright © 2016 MBPrDyson. All rights reserved.
//

import Foundation
import Firebase
import PKHUD

class Books {
    var bookArray:[Book] = []
    private let myRef = Firebase(url: "https://shining-heat-7573.firebaseio.com")
    
    func load() {
        // Read data and react to changes
        
        myRef.queryOrderedByChild("Book").observeEventType(.ChildAdded, withBlock: {
            snapshot in
            
            //print(snapshot)
            
            let book = Book()
            book.bookIndex = snapshot.key
            book.bookName = snapshot.value.objectForKey("bookName") as? String
            book.bookPic = snapshot.value.objectForKey("bookPic") as? String
            book.bookShopAdd = snapshot.value.objectForKey("bookShopAdd") as? String
            book.bookShopTel = snapshot.value.objectForKey("bookShopTel") as? String
            book.bookIntroUrl = snapshot.value.objectForKey("bookName") as? String
            book.bookInfo = snapshot.value.objectForKey("bookInfo") as? String
            
            Books.myBooks.bookArray.append(book)
            
        })
        
    }
    
    
    func save(bookName:String , bookPic:UIImage , bookShopAdd:String , bookShopTel:String , bookIntroUrl:String , bookInfo:String) {
        let index = self.getBookDataIndex()
        let book = Book()
        book.bookName = bookName
        book.bookPic = UIImageJPEGRepresentation(bookPic, 1.0)?.base64EncodedStringWithOptions(NSDataBase64EncodingOptions())
        book.bookShopAdd = bookShopAdd
        book.bookShopTel = bookShopTel
        book.bookIntroUrl = bookIntroUrl
        book.bookInfo = bookInfo
        
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
    
    func initBookData() {
        for i in 1...5 {
            self.save("BookName" + String(i) ,
                      bookPic: UIImage(named: "warrior")!,
                      bookShopAdd: "ShopAdd" + String(i),
                      bookShopTel: "ShopTel" + String(i),
                      bookIntroUrl: "IntroUrl" +  String(i),
                      bookInfo: "Info" + String(i))
        }
    }
    
    init() {
        self.initBookDataIndex()
    }
    
    static let myBooks = Books()
}