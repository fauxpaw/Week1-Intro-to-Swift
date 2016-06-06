//: Playground - noun: a place where people can play

import UIKit

//Problem #1
//Write a function that takes in a string, checks if it can be converted to a number and if possible, returns a number

func stringCheck(string: String) -> Int?
{
    return Int(string)
}

stringCheck("6")
stringCheck("shenanigans")

//Problem #2
//Write a function that takes in a tuple (code, message) and returns a string by using interpolation

func tupleToString(code: Float, message: String) -> String
{
    return String(code) + String(message)
}

tupleToString(3.9, message: " is your GPA")
//Problem #3
//Write a function that take in a string, and returns a message: “String contains n characters”

func stringCounter(string: String)
{
    print("Your string contains  + \(string.characters.count) +  characters.")
}

stringCounter("hello")

//Problem #4
//Write a function that takes in a string and reverses it. Use a simple for loop

func theOlReverse(string: String)
{
    //var charCount = string.characters.count
    var newString = ""
    for character in string.characters
    {
        newString = String(character) + newString
    }
    print(newString)
}


theOlReverse("OMG PLZ WORK!")

