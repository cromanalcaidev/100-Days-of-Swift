import UIKit

// Write a function called isOldEnoughToDrink. Given a number, in this case an age, isOldEnoughToDrink returns whether a person of this given age is old enough to legally drink in the United States.

func isOldEnoughToDrink (age: Int) -> Bool {
    age >= 21 ? true : false
}


// Write a function called isOldEnoughToDrinkAndDrive. Given a number, in this case an age isOldEnoughToDrinkAndDrive returns whether a person of this given age is old enough to legally drink and drive in the United States.

func isOldEnoughToDrinkAndDrive (edadd: Int) -> String {
    if edadd >= 21 {
        return "Puede beber y conducir, pero que no lo haga todo a la vez"
    } else if edadd < 21 && edadd >= 16 {
        return "Puede conducir, pero aún no puede beber"
    } else {
        return "Back to the crib"
    }
}


// Write a function called checkAge. Given a person's name and age, checkAge returns one of two messages:

func checkAge (name: String, age: Int) -> String {
    age >= 21 ? "Welcome, \(name)!" : "Go home, \(name)!"
}


// Write a function called getFullName. Given a first and a last name, getFullName returns a single string with the given first and last names separated by a single space.

func getFullName (name: String, surname: String) -> String {
    return "\(name) \(surname)"
}


// Write a function called getLengthOfWord. Given a word, getLengthOfWord returns the length of the given word.

func getLenghtOfWord (word: String) -> Int {
    var count = word.count
    return count
}


