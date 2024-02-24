import UIKit

// OPCIONALES

// HANDLING MISSING DATA - CÓMO MANEJAR DATOS QUE AÚN NO CONOCEMOS


/*
 
 Swift tiene una solución para generar placeholders de datos que aún no conocemos: las opcionales. La anotación especial "?" y la asignación de un valor "nil". Este último significa, literalmente, missing.
 
 Al declarar algo como opcional, le estamos dando la capacidad de manejar o gestionar la ausencia de valor.
 
 */


var age: Int? = nil

/*
 
 De momento, no está almacenando nada, pero más tarde podemos actualizar la variable
 
 */

age = 38

// UNWRAPPING OPTIONALS

/*
 Qué pasa si intentamos usar algún método con un dato opcional? Que Swift no lo permitirá por no considerarlo seguro.
 
 Por eso hay que acceder al opcional con una condicional y preguntarle si hay algo. A esto se le llama unwrapping
 
 Para ello, es normal usar la sintaxis if let, lo que desenvuelve (unwrap) el opcional con una condición.
 */


var name: String? = nil

if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.")
}


/*
 Si la variable name tiene un valor (un string), este se añadirá a la constante unwrapped como un string y podremos leer su propiedad count dentro de la condición. Si name está vacío, se ejecutará el código else.
 
 Importante: solo es posible desenvolver o unwrap datos valores opcionales. Si lo hacemos con valores no opcionales, tendremos un error.
 */


// UNWRAPPING CON GUARD

/*
 Una alternativa a if let es guard let, que también desenvuelve opcionales.
 
 La diferencia respecto a if let es que en caso de que no haya un valor, que este sea nil, la palabra return permite "romper" y no ejecutar el código que viene despues. Es una especie de raya en la arena y permite tener un código más limpio (se puede ir de madre si abusamos de if let, lo que se llama the pyramid of doom).
 
 Otra diferencia entre if let y guard let es que la opcional unwrapped permanece usable después del código guard
 
 */

func greet (_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }
    print("Hello, \(unwrapped)!")
}

greet("Carlos")

/*
 guard let permite enfrentarse a problemas al inicio de la función y después salir de ellas inmediatamente. Esto significa que el resto de la función se ejecuta si todo es correcto.
 
 Es común usar tanto if let como guard let para desenvolver opcionales en una constante con el mismo nombre. Por ejemplo:
 
 guard let name = name else {return }
 
 */



//FORCE UNWRAP

/*
 
 Otro manera menos segura de desenvolver una opcional es forzar a que swift lo haga. Para ello, hay que usar el símbolo de exclamación.
 
 */


let str = "5"
//let num = Int(str)


/*
 en este caso, num es un Int opcional porque Swift no sabe si el string de str es, por ejemplo, "fish" en vez de "5"
 
 Aquí lo que podemos hacer es, como sabemos que el código es seguro, forzar a Swift a que desenvuelva el resultado
 */


let num = Int(str)!
print(num)

/*
 
 Swift va a ejecutar el código y a forzar el unwrap inmediatamente, y todo irá bien en este caso. Pero si hay un error, si ese string no es un Int después de aplicar el método Int(), el código crasheará
 
 */



// OPCIONALES DESENVUELTAS IMPLÍCITAMENTE

/*
 Al igual que con las opcionales normales y corrientes, las opcionales implícitamente desenvueltas pueden contener un valor o ser nil. Sin embargo, a diferencia de las opcionales normales, las implícitamente desenvueltas no necesitan ser desenvueltas para poder usarlas, ya que podemos tratarlas como si no fueran opcionales.
 
 Para crearlas, hay que añadir una exclamación después de escribir su tipo
 */


let edad: Int! = nil

/*
 Como ya se comportan como si estuvieran desenvueltas, no hay que usar if let o guard let. Sin embargo, si las usamos y no tienen valor (si este es nil), el código crasheará.
 
 Estas variables existen porque a veces una variable empieza como nil, pero siempre tendrá un valor después de que tengamos que usarla. Como ya sabemos que va a tener un valor para cuando la necesitemos, es útil no tener que escribir if let todo el rato.
 
 Dicho esto, es mejor usar opcionales normales y corrientes en lugar de la implícitas.
 */



// NIL COALESCING


/*
 Es un tipo de operador que desenvuelve y regresa el valor de una opcional si es que lo hay. Si no hay valor, si la opcional es nil, se usa un valor por defecto que indicamos nosotros. En cualquier caso, el resultado no es una opcional, ya que el valor será el que tenga asignado o el valor por defecto que indiquemos.
 */


func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

/*
 si llamamos esta función con un id de 15 obtendremos nil porque el usuario no se reconoce, pero el nil coalescing nos permite proporcionar un valor por defecto de "Anonymous" de esta forma
 */


let user = username(for: 15) ?? "Anonymous"

print(user)


/*
 Esta funcionalidad va a comprobar el valor que retorna la función username(). Si es un string, va a desenvolverlo y colocarlo en user, pero si el valor es nil, le asignará "Anonymous"
 */



// ENCADENAMIENTO OPCIONAL


/*
 Swift tiene un atajo al usar opcionales.
 
 Si queremos acceder a un objeto tipo a.b.c y b es opcional, podemos escribir un ? después de esa opcional para activar el encadenamiento opcional: a.b?.c
 
 Cuando se ejecute ese código, Swift va a comprobar si b tiene un valor, y si este es nil, el resto de la línea será ignorado y Swift retornará nil. Pero si b tiene un valor, Swift va a desenvolverlo y la ejecución continuará
 */


let names = ["John", "Paul", "George", "Ringo"]


/*
 
 Vamos a usar la propiedad first, que devuelve el primer elemento de un array si hay uno, o nil si el array está vacío. Después vamos a pasarle el método uppercased() para transformarlo todo a mayúsculas
 
 */


let beatle = names.first?.uppercased()

print(beatle)


/*
 se peuden encadenar tantos elementos como sea necesario:
 
 someOptionalArray?.first?.lowercased()
 */




