//
//  Book.swift
//  ALPHACampFinal
//
//  Created by MBPrDyson on 4/29/16.
//  Copyright © 2016 MBPrDyson. All rights reserved.
//

import Foundation
import UIKit

class Book {
    var bookName:String?
    var bookPic:String?
    var bookShopAdd:String?
    var bookShopTel:String?
    var bookIntroUrl:String?
    var bookInfo:String?
    var bookIndex:String?
    
    func convertToDictonary() -> [String:String] {
        var result:[String:String] = [:]
        result["bookName"] = self.bookName
        result["bookPic"] = self.bookPic
        result["bookShopAdd"] = self.bookShopAdd
        result["bookShopTel"] = self.bookShopTel
        result["bookIntroUrl"] = self.bookIntroUrl
        result["bookInfo"] = self.bookInfo
        
        return result
    }
}