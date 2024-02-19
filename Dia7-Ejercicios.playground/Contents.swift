import UIKit

// Write a function called getLengthOfWord. Given a word, getLengthOfWord returns the length of the given word.

func getLengthOfWord (inputWord: String) -> Int {
    let wordLength = inputWord.count
    return wordLength
}


// Write a function called getLengthOfTwoWords. Given 2 words, getLengthOfTwoWords returns the sum of their lengths.

func getLengthOfTwoWords (inputWord1: String, inputWord2: String) -> Int {
    let wordSum = inputWord1.count + inputWord2.count
    return wordSum
}


// Write a function called isSameLength. Given two words, isSameLength returns true if the given words have the same length. Otherwise it returns false.

func isSameLength (inputWord1: String, inputWord2: String) -> Bool {
    return inputWord1.count == inputWord2.count ? true : false
}


// Write a function called isGreaterThanTen. Given a number, isGreaterThanTen returns true if it is greater than 10, otherwise it returns false.

func isGreaterThanTen (inputNum: Int) -> Bool {
    return inputNum > 10 ? true : false
}


// Write a function called isLessThan30. Given a number, isLessThan30 returns true if the given number is less than 30. Otherwise it returns false.

func isLessThan30 (inputNum: Int) -> Bool {
    return inputNum < 30 ? true : false
}


//Write a function called equalsTen. Given a number, equalsTen returns true if the given number is 10. Otherwise it returns false.

func equalsTen (inputNum: Int) -> Bool {
    return inputNum == 10 ? true : false
}


// Write a function called isLessThan. Given 2 numbers, isLessThan returns true if num2 is less than num1. Otherwise it returns false.

func isLessThan (num1: Int, num2: Int) -> Bool {
    return num1 > num2 ? true : false
}


// Write a function called isGreaterThan. Given 2 numbers, isGreaterThan returns true if num2 is greater than num1. Otherwise it returns false.

func isGreaterThan (num1: Int, num2: Int) -> Bool {
    return num1 < num2 ? true : false
}


// Write a function called isEqualTo. Given 2 numbers, isEqualTo returns true if num2 is equal to num1. Otherwise it returns false.

func isEqualTo (num1: Int, num2: Int) -> Bool {
    return num1 == num2 ? true : false
}


// Write a function called isEven. Given a number, isEven returns true if it is even. Otherwise it returns false.

func isEven (inputNum: Int) -> Bool {
    return inputNum % 2 == 0 ? true : false
}


// Write a function called isEven. Given a number, isEven returns true if it is even. Otherwise it returns false.

func isOdd (inputNum: Int) -> Bool {
    return inputNum % 2 == 1 ? true : false
}


// Write a function called areBothOdd. Given 2 numbers, areBothOdd returns true if both numbers are odd, otherwise it should return false.

func areBothOdd (num1: Int, num2: Int) -> Bool {
    return num1 % 2 == 1 && num2 % 2 == 1 ? true : false
}


//Write a function called isEitherEven. Given 2 numbers, isEitherEven returns true if one of the numbers is even, otherwise it should return false.

func isEitherEven (num1: Int, num2: Int) -> Bool {
    return num1 % 2 == 0 || num2 % 2 == 0 ? true : false
}


// Write a function called isOddLength. Given a word, isOddLength returns true if the length of the given word is odd, otherwise it returns false.

func isOddLength (inputStr: String) -> Bool {
    return inputStr.count % 2 == 1 ? true : false
}


// Write a function called isEvenLength. Given a word, isEvenLength returns true if the length of the given word is even, otherwise it returns false.

func isEvenLength (inputStr: String) -> Bool {
    return inputStr.count % 2 == 0 ? true : false
}


// Write a function called computeAverageLengthOfWords. Given two words, computeAverageLengthOfWords returns the average of their lengths.

func computeAverageLenghtOfWords (inputStr1: String, inputStr2: String) -> String {
    return "The average length of \(inputStr1) and \(inputStr2) is \((inputStr1.count + inputStr2.count) / 2) characters"
}


// Write a function called isEvenAndGreaterThanTen. Given a number, isEvenAndGreaterThanTen returns true if the number is both even and greater than 10, otherwise it returns false.

func isEvenAndGreaterThanTen (num1: Int) -> Bool {
    num1 % 2 == 0 && num1 > 10 ? true : false
}


// Write a function called average. Given two numbers, average returns their average.

func average (num1: Int, num2: Int) -> Int {
    return (num1 + num2) / 2
}


// Write a function called computeAreaOfATriangle. Given the base and height of a triangle computeAreaOfATriangle returns its area.

func computeAreaOfATriangle (base: Int, height: Int) -> String {
    var area = (base * height) / 2
    return "The area of your triangle is \(area) square meters"
}


// Write a function called cube. Given a number, cube returns the cube of that number.

func cube (inputNum: Int) -> Int {
    var hyperCube = inputNum * inputNum * inputNum
    return hyperCube
}


// Write a function called square. Given a number, square should return the square of the given number.

func square (inputNum: Int) -> Int {
    return inputNum * inputNum
}
