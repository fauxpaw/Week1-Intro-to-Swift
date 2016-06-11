//: Playground - noun: a place where people can play

import UIKit

//convert an int to a base 16 number (aka hexadecimal)
func findHex (input: Int) -> String {
    
    return "0x\(convertToBase16(input))"
}

func convertToBase16(input: Int) -> String{
    let dict = [10: "A", 11: "B", 12: "C", 13: "D", 14: "E", 15: "F"]
    let quotient = input/16
    let remainder = input % 16
    
    if input < 10
    {
        return "\(input)"
    }
    else if remainder > 9
    {
        return "\(convertToBase16(quotient))\(dict[remainder]!)"
    }
    else
    {
        return "\(quotient)\(remainder)"
    }
    
}

convertToBase16(9)

convertToBase16(32)
convertToBase16(53)
convertToBase16(54)
convertToBase16(55)
convertToBase16(62)
convertToBase16(1452)
convertToBase16(54)

findHex(1452)
findHex(62)
findHex(919162387162387613)
findHex(7462741274687)



//take string, check at startIndex and endIndex to see if characters match. if they match, continue to next character
//if characters do not match, return

let string = "pathfinder" //is not pal
let otherString = "racecar" //is pal

func checkTwoCharacters (input: String) -> Bool {
    
    if !input.isEmpty {
        //convert string to lowercase
        let wordCopy = input.lowercaseString
        var count = 0
        //specify current pointers to corresponding characters
        var startIndex = wordCopy.startIndex
        var endIndex = wordCopy.endIndex.predecessor()
        
        //for as long as the characters match, we will move to the next set of characters
        while (wordCopy[startIndex] == wordCopy[endIndex]) && (count < wordCopy.characters.count/2 )
        {
            count+=1
            startIndex = startIndex.successor()
            endIndex = endIndex.predecessor()
        }
        
        return count == wordCopy.characters.count/2
    }
    //if input is empty string declare false
    return false
}


func checkArrayForPalandrome(input: [String]) -> [String]{
    return input.filter{checkTwoCharacters($0)}
}

checkTwoCharacters("")

checkTwoCharacters("string")
checkTwoCharacters("racecar")
checkTwoCharacters("mom")
checkTwoCharacters("moom")
checkTwoCharacters("laksjdflkasjdflkajsfdlkasjlfkjasdlkfj")


let myArray = ["sun", "moon", "racecar", "firehouse", "dad", "Mom"]

checkArrayForPalandrome(myArray)

//convert roman numeral string to int

let romanDictionary = ["I": 1, "V" : 5, "X" : 10, "L": 50, "C": 100, "D": 500, "M": 1000]

func romanToArabic(input: String) -> [Int]? {
    var intArray = [Int]()
    for character in input.characters {
        guard let int = romanDictionary[String(character)] else { return nil}
        intArray.append(int)
    }
    return intArray
    
    
}


func evaluateIntArray(arr : [Int])-> Int{
    
    var runningTotal = 0

    if !arr.isEmpty
    {
        //work right to left
        var currentIndex = arr.count - 1
        runningTotal = arr[currentIndex]
        
        while (currentIndex-1) >= 0{
            arr[currentIndex] <= arr[currentIndex-1] ? (runningTotal += arr[currentIndex-1]) : (runningTotal -= arr[currentIndex-1])
            currentIndex -= 1
        }
    }
    return runningTotal
}

func combiner (input: String) -> Int{
    guard let arrayOfInts = romanToArabic(input) else { return 0}
    return evaluateIntArray(arrayOfInts)
    
}

//arr[inx] <= arr[inx-1] ? (acc += arr[inx-1]) : (acc -= arr(inx-1))
//inx-=1

evaluateIntArray([10,1])
evaluateIntArray([10,50,1,1,1])

combiner("XLIII")
combiner("hello")
combiner("what")
combiner("IX")
combiner("IXIXIXIX")//invalid roman still returns a value
combiner("LI")
combiner("XIIIIII")//invalid roman


