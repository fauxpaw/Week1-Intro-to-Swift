//: Playground - noun: a place where people can play

import UIKit

//Problem #1 
//Write a function that takes in an array of strings, checks if array contains “Earth”, if not, adds it otherwise returns


var planets = ["Mercury", "Venus","Earth", "Mars"]
func earthCheck(inout arrayOfPlanets: Array<String>) -> Array<String>
{
    for elementValue in arrayOfPlanets {
        if elementValue == "Earth" {
            print("array contains Earth! Aborting...")
            return arrayOfPlanets
        }
        else {
            arrayOfPlanets.append("Earth")
        }
    }
    return arrayOfPlanets
}

earthCheck(&planets)


//Problem #2
//Use reduce to create single string from the above array. [“Venus”, “Earth”] would produce “Venus, Earth”

var arrayToReduce = ["Venus", "Earth"]
var reducedString = arrayToReduce.reduce("") { (result, planet) -> String in
    return result + planet + ", "
}
let sliceEnding = reducedString.removeAtIndex(reducedString.endIndex.predecessor().predecessor())
print(reducedString)

//Problem #3
//Declare and implement a dictionary that can contain as values Strings, Ints, etc

var myDictionary = [String: Int]()
//fill dictionary with key/value pairs of type string/int
myDictionary["John"] = 60000
myDictionary["Paul"] = 40000
myDictionary["Tiffany"] = 90000
myDictionary
//check number of pairs in dictionary
myDictionary.count

//update a key with a new value (use literal or updateValueForKey)
myDictionary["Paul"] = 75000
myDictionary
//does case matter? (yes)
myDictionary["paul"] = 2873498237
myDictionary
//remove a pair
myDictionary["paul"] = 0
myDictionary
//not quite.... (use nil or removeValueForKey)
myDictionary["paul"] = nil
myDictionary


//Problem #4
//Declare a dictionary of string values. Declare a function that takes in a string and searches dictionary for it. Use filter

var employees: [ String : Int] = ["Paul": 1, "John" : 2, "Tiffany" : 3]

//arr1.filter { (planet) -> Bool in
//    return planet == "earth"

func employeeSearch(employeeName: String){
    employees.filter { (key: String, employeeNumber: Int) -> Bool in
    return key == employeeName
    }
}

employeeSearch("Paul")

//Problem #5
//Write examples for union, intersect, subtract, exclusive Or set operations
let setA: Set = ["dog", "cat", "bird", "fish"]
let setB: Set = ["horse", "ferret", "pikachu", "dog"]

//union
setA.union(setB)
setB.union(setA)
//intersect
setA.intersect(setB)
setB.intersect(setA)
//subtract
setA.subtract(setB)
setB.subtract(setA)
//exclusive
setA.exclusiveOr(setB).sort()
setB.exclusiveOr(setA).sort()


//Problem #6
//Write a function that counts repeating words and prints out the count of each

let originalArray = ["Sun", "Moon", "Star", "Asteroid", "Comet", "Star", "Star", "Comet"]
let setArray = Set(originalArray)
var wordDuplicates = [[String]]()

func idAndCountMultipleStrings (collection: Set<String>)
{
    print(collection)
    for element in collection {
        wordDuplicates.append(originalArray.filter { (word) -> Bool in
            word == element
            })
    }
    
    for array in wordDuplicates {
        if array.count > 1 {
            print("The word '\(array[0])' appears \(array.count) times in the given list.")
        }
    }
}

idAndCountMultipleStrings(setArray)
wordDuplicates

//Problem #7
//Add two numbers without using “+”

var sum = Int()
var temp = Int()
func adder(var num1: Int, var num2: Int){
    if num1 < num2 {
        temp = num1
        num1 = num2
        num2 = temp
    }
    while num1 < num2 {
        num1 += 1
        print(num1)
    }
    sum += num1
    sum += num2
    print(sum)
}

adder(6, num2: 145)




