import UIKit

// STRUCTS

/*
 
 Es como jugar a ser dios, creas tus propios tipos de datos. Swift te permite hacer esto de dos maneras, y la más común son las estructuras, o structs.
 
 Las structs pueden tener sus propias varibales, constantes y funciones.
 
 Vamos a crear una:
 

struct Sport {
    var name: String
}
 
*/

/*
 Así se define el tipo. Y ahora se puede crear una instancia
 */

/*
 como name y lasagna son variables, su valor puede cambiar, al igual que cualquier otra variable
 */


/*
var tennis = Sport(name: "tennis")
print(tennis.name)
*/

// PROPIEDADES COMPUTADAS

/*
 Dentro del struct Sport creado antes, vemos una propiedad: name, que almacena un String. Esto se llama propiedades almacenadas. Y Swift tiene otro tipo de propiedades distintas llamadas "propiedades computadas". Esta propiedad puede correr código en su valor y SIEMPRE necesita tener un tipo explícito (: String, Int, Bool). Las constantes NO pueden ser propiedades computadas.
 */


struct Sport {
    var name: String
    var isOlympicSport: Bool
    
    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}

let chessBoxing = Sport(name: "ChessBoxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)


// OBSERVADORES DE PROPIEDADES

/*
 Los observadores de propiedades permiten ejecutar el código antes o después los cambios de propiedades.
 */

//struct Progress {
//    var task: String
//    var amount: Int
//}

/*
 Ahora podemos crear una instancia de este struct y actualizar su progreso
 */

//var progress = Progress(task: "Loading Data", amount: 0)
//progress.amount = 30
//progress.amount = 80
//progress.amount = 100


/*
 
 Buscamos que Swift imprima un mensaje cada vez que la variable amount cambie, y podemos usar la propiedad observadora didSet para eso. Esto ejecutará un código cada vez que la variable amount cambie
 
 */


struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}

/*
 la propiedad willSet permite ejecutar una acción ANTES de que una propiedad cambie, pero no se usa tanto
 */

var progress = Progress(task: "Loading Data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100


// MÉTODOS

/*
 Los structs pueden tener funciones dentro de ellos, y esas funciones pueden usar las propiedades del struct como necesiten. Las funciones que están dentro de un struct se llaman Métodos, pero siguen usando la palabra clave func para iniciarse
 
 */

struct City {
    var population: Int
    
    func collectTaxes () -> Int {
        return population * 1000
    }
}

/*
 este método pertenece al struct, así que lo llamamanos en instancias del struct de esta forma
 */

let london = City(population: 9_000_000)
london.collectTaxes()


