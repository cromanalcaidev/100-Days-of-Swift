import UIKit

// PROTOCOLOS

/*
 
 Los protocolos son una forma de describir qué propiedades y métodos necesita algo.
 
 Después le decimos a Swift qué tipos usan ese protocolo. A esto se le llama adoptar o adherirse a un protocolo.
 
 Por ejemplo, podemos crear una función que acepte algo con una propiedad "id", sin que nos importe qué tipo de datos se usan.
 
 Vamos a empezar creando un protocolo "Identifiable" que requiera que todos los datos que lo adeopten tengan un string "id" que pueda leerse ("get") o escribirse ("set")
 
 */

protocol Identifiable {
    var id: String { get set }
}

/*
 
 No es posible crear instancias de este protocolo, ya que no es algo que se pueda crear o usar, sino que es una descripción de lo que queremos. Lo que sí podemos crear es un struct que se adhiera a este protocolo
 
 */

struct User: Identifiable {
    var id: String
}

/*
 
 Y por último, escribimos una función displayID() que adepte cualquier objeto marcado como "Identifiable)
 
 */

func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}


/*
 Los protocolos pueden ser { get set }, es decir, variables que permiten ser read-written, o ser { get }, es decir, read-only. Usar solamente { set } no está permitido
 */


// HERENCIA DE PROTOCOLO

/*
 Un protocolo puede heredar de otro. Es más, a diferencia de las clases, un protocolo puede heredar propiedades de diferentes protocolos a la vez, además de recibir las personalizaciones/cambios que queramos.
 
 Vamos a definir 3 protocolos:
 
 - Payable: necesita conformar tipos para implementar un método calculateWages()
 - NeedsTraining: necesita conformar tipos para implementar un método study()
 - HasVacation: Necesita conformar tipos para implementar el método takeVacation()
 
 */


protocol Payable {
    func calculateWages() -> Int
}


protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}


/*
 Ahora podemos crear un protocolo único, Employee, que los junte todos.
 */


protocol Employee: Payable, NeedsTraining, HasVacation { }

/*
 
 No hay que escribir nada más, solo abrir y cerrar llaves. Y ahora podemos crear nuevos tipos de este único protocolo en vez de tener que hacerlo de tres protocolos individuales
 
 */



// EXTENSIONES


/*
 Las extensiones permiten añadir métodos a tipos que ya existen para que hagan cosas que original no hacen.
 
 Por ejemplo, se puede crear una extensión squared() al tipo Int para que regrese el cuadrado de un número
 */

extension Int {
    func squared() -> Int {
        return self * self
    }
}

let number = 8
number.squared()

/*
 Swift no permite almacenar propiedades en extensiones, así que hay que usar propiedades computadas en su lugar. Por ejemplo, podemos añadir al tipo Int una nueva propiedad computada isEven que regrese true si le pasan un número par
 */


extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}


//EXTENSIONES DE PROTOCOLOS


/*
 
 Los protocolos permiten describir qué métodos debería tener algo, pero no proporcionan el código que va dentro.
 
 Las extensiones permiten proporcionar el código que va dentro de un método, pero solo afecta a un tipo de dato, ya que el método no se puede aplicar a muchos datos a la vez.
 
 Las extensiones de protocolo solucionan estos dos problemas a la vez. Son como las extensiones normales, solo que en vez de extender un tipo específico (como Int), se puede extender todo un protocolo para que todos los tipos incluidos vean los cambios aplicados.
 
 Un tipo puede adherirse a tantos protocolos como quiera el programador.
 
 */


let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])

/*
 En Swift, los arrays y los set se adhieren a un protocolo llamado Collection, así que podemos escribir una extensión de ese protocolo para añadir el método summarize(), que imprima la colección
 */



extension Collection {
    func summarize() {
        print("There are \(count) of us:")
        for name in self {
            print(name)
        }
    }
}

/*
 Ahora, tanto los Arrays como los Sets podrán  usar este método
*/

pythons.summarize()
beatles.summarize()


// PROGRAMACIÓN ORIENTADA A PROTOCOLO


/*
 Las extensiones de protocolo pueden proporcionar implementacoines por defecto a nuestros propios métodos de protocolo. Esto hace que sea más fácil que los tipos se adhieran a un protocolo, y permite una técnica llamada "programación orientada a protocolos" - Para crear el código alrededor de los protocolos y las extensiones de protocolo
 */

protocol Identificable {
    var id: String { get set }
    func identify ()
}

/*
 Aunque podríamos hacer que todos los tipos adheridos escriban su propio método identify(), las extensiones de protocolo nos permiten proporcionar un default
 */


extension Identificable {
    func identify () {
        print("My ID is \(id).")
    }
}


/*
 Ahora, cuando creemos un tipo qeu se adhiera a Identificable, automáticamente obtiene acceso a identify()
 */

struct Usuario: Identificable {
    var id: String
}

let carlos = Usuario(id: "cromanalcaidev")
carlos.identify()

/*
 Las extensiones de protocolo son implementación de métodos por defecto, pero tus tipos aún pueden proporcionar sus propios tipos
 */
