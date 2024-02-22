import UIKit

// CLASES

//  !! Para más tarde: Mencionar + explicar Tipos de referencia vs Tipos de valor

/*
 
 Las clases son objetos parecidos a los structs en el sentido en el que permiten crear nuevos tipos y métodos, pero tienen 5 diferencias importantes respecto a los structs:
 
 */

// DIF 1: MEMBERWISE INITIALIZER
 
/*
 1 - La primera diferencia con los structs es en el memberwise initializer. Las clases SIEMPRE tienen que tener su inicializador propio (a menos que se hayan definido TODOS los valores por defecto; en este caso, no ahce falta inicializador).
 
 Init + self es lo que permite modificar las propiedades de una clase en la misma línea entre paréntesis al crear una instancia de esa clase
 */

class Dog {
    var name: String
    var breed: String
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

/*
 Crear instancias de una clase es exactamente igual que hacerlo con structs
 */

let goodBoy = Dog(name: "Boy", breed: "San Bernardo")


// DIF 2: CLASS INHERITANCE OR SUBCLASSING


/*
 
 2 - La segunda diferencia con los structs es que se puede crear una clase basada en otra clase ya existente. En este caso, heredará todas las propiedades y métodos de la clase original, y puede añadir los suyos propios
 
 A esto se le llama class inheritance o subclassing. La clase de la que hereda se llama superclase, y la nueva clase se llama subclase.
 
 La estructura es:
 
 */

class Superclass {
    
}

class Subclass: Superclass {
    
}


/*
 Ejemplo
 */

class Cat {
    var name: String
    var breed: String
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

class Egipcio: Cat {
    init(name: String) {
        super.init(name: name, breed: "Egipcio")
    }
}


/*
 
 Al crear la nueva clase "Egipcio", hereda las mismas propiedades que tenía Cat por defecto.
 
 Pero también podemos darle a "Egipcio" su propio inicializador. Como siempre va a tener la raza "Egipcio", podemos crear un nuevo inicializador que solo necesita la propiedad "name". Y podemos hacer que el inicializador de "Egipcio" llame directamente al inicializador de Cat para que suceda el mismo setup.
 
 Por razones de seguridad, Swift obliga a usar la expresión super.init() para subclases, en caso de que la superclase haga alguna función heredada importante al crearse
 
 Las subclases solo pueden heredar de una superclase
 
 */



// OVERRIDING O ANULACIÓN


/*
 Las subclases pueden reemplazar métodos de la superclases con sus propias implementaciones, lo que se conoce como overriding (anulación? cancelación?).
 */


class Duck {
    func makeNoise() {
        print("Quack!")
    }
}


class Oca: Duck {
}

let donald = Oca()
donald.makeNoise()
 
/*
 En este ejemplo, la subclase Oca hereda el método makeNoise() de la superclase Duck. Va a imprimir "Quack!"

 La anulación del método permite modificar la implementación de makeNoise() para la subclase Oca

 Para ello, swift necesita que usemos la sintaxis "override func" en lugar de "func". Esto sirve para evitar que se anule un método por accidente, y obtendremos un error si intentamos anular algo que no existe en la superclase
 
 */

class Ganso : Duck {
    override func makeNoise() {
        print("Cuac!")
    }
}

let alfonso = Ganso()
alfonso.makeNoise()



// CLASES FINALES

/*
 Aunque la herencia entre clases es muy útil, hay veces en las que no quieres permitir que otros desarrolladores construyan sus clases basándose en las tuyas.
 
 Swift tiene la palabra reservada "final" para este propósito. Cuando una clase se define como "final", ninguna subclase puede heredar propiedades ni métodos de ella. Es decir, ninguna subclase puede anular los métodos o cambiar su comportamiento, sino que tiene que usar los que tú has creado en ujn ppio.
 */

final class Oruga {
    var name: String
    var breed: String
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}



// DESCANSO: EJERCICIO MOUREDEV


/*
 Explora el concepto de clase y crea un ejemplo que implemente un inicializador, atributos y una función que los imprima (teniendo en cuenta las posibilidades de tu lenguaje). Una vez implementada, créala, establece sus parámetros, modifícalos e imprímelos utilizando su función
 */


class Cani {
    var name: String
    var apodo: String
    var location: String
    var visteChandal: Bool
    var llevaOros: Bool
    var tePicaElMovil: Bool
    init (name: String, apodo: String, location: String, visteChandal: Bool, llevaOros: Bool, tePicaElMovil: Bool) {
        self.name = name
        self.apodo = apodo
        self.location = location
        self.visteChandal = visteChandal
        self.llevaOros = llevaOros
        self.tePicaElMovil = tePicaElMovil
    }
    func suPrimoSurmano() {
        print(name, apodo, location, visteChandal, llevaOros, tePicaElMovil)
    }
}


var cabesa = Cani(name: "Rubén Rodríguez", apodo: "Cabesa", location: "Coria del Río", visteChandal: true, llevaOros: true, tePicaElMovil: false)
cabesa.suPrimoSurmano()


// DIF 3: QUÉ PASA AL COPIAR OBJETOS EN CLASE VS STRUCTS


/*
 Otra diferencia entre structs y clases es cómo se copian estos objetos. Al copiar un struct, tanto el original como la copia son objetos diferentes. Cambiar uno no modifica el otro. Pero al copiar un clase, el original y la copia apuntan a lo mismo, así que al cambiar uno, se modifica el otro.
 */


class Singer {
    var name = "A$AP ROCKY"
}

var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Montserrat Caballé"

print(singer.name)


/*
 Por la forma en la que funcionan las clases, tanto "singer" como "singerCopy" apuntan al mismo objeto en memoria, así que al imprimir singer.name lo que se mostrará es "Montserrat Caballé".
 
 Si fuera un struct, Singer no se habría modificado y seguiría mostrando "A$AP ROCKY", ya que serían objetos diferentes e independientes.
 
 Un buen truco para recordar cómo se comporta cada tipo de objeto es pensar en los structs como archivos de Excel independientes (lo puedes mandar por mail a otra persona, esa persona lo modifica y sus cambios no aparecen en tu archivo) y en las clases como un archivo de Sheets compartido por Google Drive (si alguien lo modifica en su ordenador, tú verás los cambios en el tuyo)
 */


// DIF 4: DESINICIALIZADORES

/*
 
 La cuarta diferencia son los desinicializadores, un código que se ejecuta cuando la instancia de una clase es destruida.
 
 El código es deinit, y es un método que va sin paréntesis.
 
 */

class Person {
    var name = "John Doe"
    init () {
        print("\(name) is alive!")
    }
    func printGreeting() {
        print("Hello, I'm \(name)")
    }
}

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}

/*
deinit {
    print("\(name) is no more!")
}
 
 class magicSpell {
    deinit {
        print("Good job, Hermione!")
    }
 }
  
*/


// DIF 5: MUTABILIDAD

/*
 La última diferencia entre clases y structs es la forma en la que tratan laconstantes. Si tienes una constante struct con una propiedad que sea una variable, la propiedad no puede modificarse porque la struct es una constante.
 
 Pero si se trata de una constante clase con una propiedad variable, esa propiedad puede modificarse. Por esta razón, las clases no necesitan la palabra reservada "mutating" con los métodos que modifican propiedades, eso es solo para las structs.
 
 Esto significa que se puede cambiar cualquier propiedad (variable siempre, eso sí) en una clase aunque esta clase esté creada como una constante
 */

class Verdura {
    var name = "Apio"
}

let patata = Verdura()
patata.name = "Patata"
print(patata.name)

/*
 Para evitar esto, hay que declarar la propiedad dentro de la clase como una constante
 
 class Verdura {
    let name = "Apio"
 }
 */
