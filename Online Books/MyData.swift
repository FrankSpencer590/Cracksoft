//
//  MyData.swift
//  Online Books
//
//  Created by Samuel Miller on 17/06/2018.
//  Copyright © 2018 Cracksoft. All rights reserved.
//

import UIKit

class MyData: NSObject {
    var bookContent = "This is a good book"
    var selectedBook = "No Title"
    static let sharedInstance = MyData()
}
