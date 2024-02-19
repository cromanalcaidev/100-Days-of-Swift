import UIKit

// CLOSURES

/* Swift permite usar funciones como otros tipos, como strings y enteros. Es decir, una función se puede asignar a una variable y después pasar esa misma función como un parámetro dentro de otra función.
 
 
 La estructura básica de una closure es:

 { (parameters) -> return type in statements}
 
 */
 

 
/* Ejemplo */

let driving = {
    print("I'm driving in my car")
}

/* esto crea una función sin nombre, y se la asigna a la constante "driving". Y ahora podemos llamar a driving como si fuera una función de la siguiente manera*/

driving()


// CÓMO INTRODUCIR PARÁMETROS EN CLOSURES


/* Los parámetros dentro de la closures van en un sitio distinto al de las funciones, dentro de las llaves de función, y a continuación van seguidos de la palabra clave in para que Swift sepa dónde empieza el cuerpo de la closure
 
 */

let drivingL = { (place: String) in
print("I'm going to \(place) in my car")
}

/* Ahora, al llamar a la función, no es necesario pasar el parámetro precedido de la etiqueta "place"*/

drivingL("London") // Simplemente se pasa el valor entre comillas (pq es un string en este caso)


// CÓMO RETORNAR VALORES DE UNA CLOSURE

/* Las closures también pueden retornar valores. Para ello, hay que escribir la flecha justo antes de la keyword "in"
 
 */
      
let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

let message = drivingWithReturn("London")
print(message)

// PASAR UNA CLOSURE COMO UN PARÁMETRO


/* Se puede pasar una closure como un parámetro. La sintaxis es un poco particular, eso sí
 */

let drivingParameters = {
    print("I'm driving in my car")
}

/*
 
 Para pasar el closure "drivingParameters" como un parámetro en una función, hay que especificar este parámetro como "() -> Void" en la función en la que queremos pasarlo. Esto significa que no acepta parámetros y retorna "Void", o nada.

 */

func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

/* Ahora podemos pasar el closure como un parámetro
 
 */

travel(action: driving)


// SINTAXIS TRAILING CLOSURE

/*
 Si el último parámetro de una función es una closure, Swift permite usar una sintaxis especial llamada Trailing Closure. En vez de pasar la closure como un parámetro en el lugar indicado, se puede pasar directamente después de las llaves de función
 */

