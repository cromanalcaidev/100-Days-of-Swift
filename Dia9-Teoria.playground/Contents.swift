import UIKit

//STRUCTS - SEGUNDA PARTE

// MÉTODOS MUTANTES

/*
 
 Si un struct se ha creado con una propiedad que es una variable, pero al crear la instancia de ese struct, la creamos como una constante, no podremos cambiar la propiedad.
 
 Swift, cuando creamos un struct, no tiene ni idea de si vamos a usarlo con constantes o variables, así que va a lo seguro: no permite que los métodos que creamos modifiquen las propiedades a menos que lo especifiquemos explícitamente con la keyword mutating
 
 */

struct Persona {
    var name: String
    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}


var person = Persona(name: "Ed")
person.makeAnonymous()


// PROPIEDADES Y MÉTODOS DE LOS STRINGS

/*
 
 Los strings son, surprise motherfuckers, structs (*pretends to be shocked*).
 
 Así que tienen sus propios métodos y propiedades que nos sirven para manipularlos
 
 */

let string = "Do or do not, there is no try."

print(string.count) // devuelve el número de caracteres

print(string.hasPrefix("Do")) // Devuelve true si el string empieza por unas letras específicas

print(string.uppercased()) // Devuelve un string todo en mayúsculas

print(string.sorted()) // Devuelve el string en un array, ordenado alfabéticamente (tb con caracteres)

print(string.contains("try")) // devuelve true si el string contiene otro string específico, el que va entre paréntesis


// PROPIEDADES Y MÉTODOS DE LOS ARRAYS

/*
 
 Los arrays tb son, surprise motherfuckers, structs (*pretends to be shocked* de nuevo).
 
 Así que tienen sus propios métodos y propiedades que nos sirven para manipularlos
 
 */

var toys = ["Woody"]

print(toys.count) // para leer el número de elementos en el array

toys.append("Buzz") // Para añadir un nuevo elemento

toys.firstIndex(of: "Buzz") // Para localizar la primera vez que aparece un elemento, recuerda que los arrays pueden repetir elementos, no son únicos

print(toys.sorted()) // Como en los strings, los ordena alfabéticamente

toys.remove(at: 0) // elimina un elemento de un array en la posición seleccionada

print(toys.contains("Buzz")) // devuelve true si el array contiene un valor concreto


// INICIALIZADORES

/*
 El método init() es un inicializador que permite crear instancias de un struct con valores específicos para sus propiedades. Es una función especial dentro de un struct que prepara la instancia para su uso, estableciendo estados iniciales o valores predeterminados para sus propiedades.
 
    Importante: el init no puede completarse hasta que haya dado valor a TODAS las propiedades del struct
 
 La palabra reservada self es útil para evitar ambigüedades cuando la propiedad del struct y el parámetro del init comparten nombre. En este ejemplo no comparten nombre para ver a qué hace referencia cada cosa
 */


struct NombreDelStruct {
    var propiedad1Struct: String
    var propiedad2Struct: Int

    init(propiedad1Init: String, propiedad2Init: Int) {
        self.propiedad1Struct = propiedad1Init
        self.propiedad2Struct = propiedad2Init
    }
}


struct Persone {
    var name: String
    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

let pepe = Persone(name: "Pepe")
print(pepe)




// PROPIEDADES LAZY

/*
 Swift permite que algunas propiedades aparezcan solo cuando sea necesario (para optimizar la performance). Vamos a verlo con un ejemplo
 */

struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

/*
 vamos a pasar este struct dentro de otro
*/

struct Personae {
    var name: String
    var familyTree = FamilyTree()
    init(name: String) {
        self.name = name
    }
}

var ed = Personae(name: "Ed")

/*
 En caso de no necesitar el familyTree para una persona particular, podemos omitirlo con la palabra reservada lazy. Swift solo va a mostrar el print "Creating family tree!" cuando sea explícitamente nombrado
 */

struct Person {
    var name: String
    lazy var familyTree = FamilyTree()
    init(name: String) {
        self.name = name
    }
}

// -->

ed.familyTree



// PROPIEDADES ESTÁTICAS Y MÉTODOS

/*
 
 Hasta ahora, hemos creado propiedades y métodos para instancias individuales de structs, pero Swift también permite compartir propiedades y métodos específicos con todas las instancias de un struct al declararlos con la keyword static
 
 */



struct Student {
    static var classSize = 0
    var name: String
    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}

/*
 Como la propiedad classSize pertenece al struct y no a la instancia, tenemos que leerla usando Student.classSize
 */

print(Student.classSize)


/*
 Los métodos static funcionan igual que las propiedades static. Solo hay que añadir la palabra "static" delante de func yourMethod ()
 */


// ACCESS CONTROL

/*
 
 El control dea cceso permite restringir qué código puede usar métodos y propiedades. Esto es importante porque a lo mejor quiero que la gente no lea una propiedad directamente
 
 */

/*
struct Personita {
    var id: String
    init(id: String) {
        self.id = id
    }
}

let cabesa = Personita(id: "12345")

 */
 
/*
 para hacer el id privado, solo hay que usar la keyword private
 */


struct Personita {
    private var id: String
    init(id: String) {
        self.id = id
    }
    func identify() -> String {
        return "My social security number is \(id)"
    }
}

/*
 por el contrario, la keyword public permite que todo el resto del código acceda a una propiedad o un método
 */


