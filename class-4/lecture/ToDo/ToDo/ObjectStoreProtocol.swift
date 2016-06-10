//
//  ObjectStoreProtocol.swift
//  ToDo
//
//  Created by Michael Sweeney on 6/9/16.
//  Copyright © 2016 Michael Babiy. All rights reserved.
//

import Foundation

protocol ObjectStoreProtocol: class
{
    
    associatedtype Chore: Identity, NSCoding
    var errands : [Chore] { get set }
    
    
    func add(errand: Chore)
    func remove(errand: Chore)
    func objectAtIndex(index: Int) -> Chore
    func count() -> Int
    func allObjects () -> [Chore]
    func save(file: String)
    
}

extension ObjectStoreProtocol
{
    
    func add(errand: Chore)
    {
        self.errands.append(errand)
    }
    func remove(errand: Chore)
    {
        self.errands = self.errands.filter({ (thing) -> Bool in
            return errand.id != thing.id
        })
    }
    func objectAtIndex(index: Int) -> Chore
    {
        return self.errands[index]
    }
    func count() -> Int
    {
        return self.errands.count
    }
    func allObjects () -> [Chore]
    {
        return self.errands
    }
    func save(file: String){
        //NSKeyedArchiver.archiveRootObject(self.objects, toFile: file)
        NSKeyedArchiver.archiveRootObject(self.errands, toFile: file)
    }
}
