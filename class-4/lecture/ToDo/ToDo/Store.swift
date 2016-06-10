//
//  Store.swift
//  ToDo
//
//  Created by Michael Sweeney on 6/9/16.
//  Copyright © 2016 Michael Babiy. All rights reserved.
//

import Foundation

class Store: ObjectStoreProtocol
{
    static let dataBase = Store()
    private init()
    {
        if let
            data = NSData(contentsOfFile: String.archivePath(.Default)),
            storedItems = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? [ToDo] {
            self.errands = storedItems
        }

    }
    
    typealias Chore = ToDo
    var errands = [Chore]()
}

