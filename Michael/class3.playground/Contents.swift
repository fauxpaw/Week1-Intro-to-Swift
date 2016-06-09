//: Playground - noun: a place where people can play

import UIKit
//Declare Identity protocol with id function
//Declare a ToDo class that conforms to Identity protocol… Define your own model scheme (variable it contains, etc)
//Define ObjectStore protocol with these functions: add:, remove:, objectAtIndex:, count, allObjects.
//Extend ObjectStore protocol to provide basic implementation for functions
//    Create Store singleton that will conform to ObjectStore protocol and implement requirements
//Demonstrate adding / removing of ToDo items.



protocol Identity
{
    var id: String {get set}
}

class ToDo: Identity
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
}

protocol ObjectStoreProtocol: class
{
    
    associatedtype Chore: Identity
    var errands : [Chore] { get set }

    
    func add(errand: Chore)
    func remove(errand: Chore)
    func objectAtIndex(index: Int) -> Chore
    func count() -> Int
    func allObjects () -> [Chore]
    
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
}

class Store: ObjectStoreProtocol
{
    static let dataBase = Store()
    private init(){}
    
    typealias Chore = ToDo
    var errands = [Chore]()
}


let itemOne = ToDo(errand: "Walk dog", numberOfHours: 5)
let itemTwo = ToDo(errand: "Homework", numberOfHours: 6)
let itemThree = ToDo(errand: "Eat Dinner", numberOfHours: 3)
Store.dataBase.add(itemOne)
Store.dataBase.add(itemTwo)
Store.dataBase.add(itemThree)


for errand in Store.dataBase.allObjects(){
    print(errand.display())
}


//get ToDO object at index 0
Store.dataBase.objectAtIndex(0)
Store.dataBase.allObjects()
//remove item
Store.dataBase.remove(itemThree)
Store.dataBase.allObjects()
