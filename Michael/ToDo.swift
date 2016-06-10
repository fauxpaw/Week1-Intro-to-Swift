//
//  ToDo.swift
//  ToDo
//
//  Created by Michael Sweeney on 6/9/16.
//  Copyright © 2016 Michael Babiy. All rights reserved.
//

import Foundation

class ToDo: NSObject, Identity, NSCoding
{
    var errand : String
    var numberOfHours : Int
    var id: String
    var createdOn = NSDate()
    var completeBy: NSDate
    
    init(errand: String, numberOfHours : Int){
        self.errand = errand
        self.numberOfHours = numberOfHours
        self.id = NSUUID().UUIDString
        self.completeBy = NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.Hour, value:numberOfHours, toDate: createdOn, options: NSCalendarOptions(rawValue: 0))!
    }
    func display() -> String{
        return "Created \(self.errand) on \(createdOn) to be completed in \(numberOfHours)hrs and therefore your due date will be \(completeBy)) with id of \(self.id)"
    }

    
    //MARK: NSCoding
    required convenience init?(coder aDecoder: NSCoder)
    {
        guard let errand = aDecoder.decodeObjectForKey("errand") as? String else { fatalError("No errand.") }
        guard let numberOfHours = aDecoder.decodeObjectForKey("numberOfHours") as? Int else { fatalError("No hours given.") }
        
        // After we get all of our data, let's initialize the actual object.
        self.init(errand: errand, numberOfHours: numberOfHours)
    }
    
    func encodeWithCoder(aCoder: NSCoder)
    {
        aCoder.encodeObject(self.errand, forKey: "errand")
        aCoder.encodeObject(self.numberOfHours, forKey: "numberOfHours")
    }
}
