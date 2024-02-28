import UIKit

// CONSOLICATION DAY 2


/*
 
 Las funciones permiten crear piezas de código reusable que realizan unas tareas específicas. Normalmente lafunciones pueden recibir valores que modifican la forma en la que trabajan (parámetros), pero esto no es obligatorio.
 
 */

func favoriteAlbum() {
    print("My favorite is Fearless")
}

/*
 
 Con este código, no se va a imprimir nada en el IDE, ya que no estamos llamando a la función, es decir, no se está ejecutando. Solo la hemos definido. Para que funcione, necesitamos llamarla
 
 */

favoriteAlbum()

/*
 
 Esto ya hará que se imprima en la consola el mensaje definido en la función.
 
 A esto, a ejecutar la función, se le denomina "llamarla.
 
 Para definir una función, usamos la palabra reservada func, después el nombre de la función, paréntesis de apertura y cierre, luego una llave, el código que se ejecuta dentro de la función y, por último, la llave de cierre.
 
 Para llamar a la función, usamos su nombre, seguido de dos paréntesis.
 
 Pero las funciones realmente no son tan sencillas. Retomando el ejemplo anterior, cómo podríamos hacer la función más interesante? Pasando un parámetro que permita modificar el álbum favorito cada vez que llamemos a la función.
 
 */


func myFavoriteAlbum(is name: String) {
    print("My favorite album is \(name)")
}

myFavoriteAlbum(is: "Elephant")

/*
 
 Aquí eestamos pasando dos parámetros que en realidad es uno mismo (para que fueran  parámetros, tendríamos que haber puesto una coma entre ellos).
 
 Lo que esto nos permite es hacer una lectura más natural al llamar a la función. Dentro de la función, usamos la segunda parte del parámetro (name) y al llamarla, usamos la primera parte (is).
 
 */


/*
 
 Valores de retorno
 
 Al usar la flecha después de los parámetros, podemos indicar que la función va a retornar un resultado y para ello indicamos el tipo de dato que será (string, bool, int, etc.).
 
 Esto servirá para que Swift se asegure de que retornamos algo. De lo contrario, el código fallará. Es decir, es una promesa que le hacemos a Swift.
 
 Para retornar el valor, tenemos que usar la palabra reservada "return"
 
 */


func albumIsTaylor(name: String) -> Bool {
    if name == "Taylor Swift" {return true}
    if name == "Fearless" {return true}
    if name == "Speak Now" {return true}
    
    return false
}

if albumIsTaylor(name: "Taylor Swift") {
    print("That's one of hers!")
} else {
    print("Who made that?!")
}

/*
 
Si la función retorna un valor y solo tiene una línea de código, podemos omitir la palabra "return" ya que Swift sabe que se tiene que retornar un valor, y que al haber una sola línea de código, eso es lo que hará
 
 */

func getMeaningOfLife() -> Int { 42 }

getMeaningOfLife()



// OPTIONALS


/*
 
Una opcional es algo que puede tener un valor concreto o ser nil, o sea, ausencia de valor.
 
 */


struct User {
    let name: String
    let age: Int?
}

/*
 
 En este struct ponemos un ? después de age porque no es necesario añadir este dato a nuestra "app", pero es posible añadirlo como usuario si queremos, así que nuestro código debe poder manejar ambas situaciones. Estamos creando un Int opcional.
 
 Una buen amanera de entender las opciones es pensar en una caja cerrada. No sabemos si dentro hay algo o no. Por eso usamos el interrogante.
 
 La manera de gestionar este código opcional es con lo que se llama Unwrapping Optionals (Desenvolver opcionales)
 
 */

/*
 
 Método uno: if let
 
 */

let user = User(name: "Sean", age: nil)

if let age = user.age {
    print("User's age is \(age)")
} else {
    print("No age detected")
}

/*
 
 Con las palabras clave if let, creamos una constante nueva (age) a la que le asignamos el valor de user.age.
 
 Aquí se abre una condicional. Si se cumple la condición, es decir, si el valor no es nil, se ejecuta el primer bloque de código.
 
 Si no, si el valor es nil, se ejecuta el segundo código de bloque.
 
 El problema de este método es que al darle prioridad a ejecutar el código, la legibilidad se puede complicar.
 
 */



/*
 
 Método dos: guard let
 
 */

let carlos = User(name: "Carlos", age: nil)

func check(age: Int?) {
    guard let age = age else {
        print("Age is nil")
        return
    }
    
    if age > 40 {
        print("You're old")
    }
}

check(age: user.age)

/*
 
 Guard permite tener una salida temprana de la función. Si la opcional que estamos comprobando es nil, guard permite salir de la función con la keyword "return". Pero si la opcional tiene un valor, se ejecuta el código que viene después de cerrar las llaves.
 
 En este caso, correrá la condicional de if age > 40.
 
 Por optimizar, en la línea 155 podríamos opner guard let age else (eliminar el "= age", que en este caso es exactamente el mismo nombre).
 
 En resumen, guard let es una manera muy sencilla de optimizar la legibilidad del código. Al darle prioridad al unwrapping de la opcional, Swift (y nosotros) ve fácilmente si el código se va a ejecutar o no.
 
 */



/*
 
 Método tres: nil coalescing
 
 */

//let age = user.age ?? 0
//let name = user.name ?? "Not given"
print(name)

/*
 
 Es genial para proporcionar un valor por defecto en caso de que el valor sea nil. Así nos evitamos que el código crashee.
 
 No siempre queremos usar un valor por defecto, pero a veces es útil.
 
 */



/*
 
 Método cuatro: foce unwrapping
 
 */

// let age = user.age! // si forzamos el unwrapping mientras age es nil, obtenemos un error Fatal error: Unexpectedly found nil while unwrapping an Optional value

/*
 
Solo usar este método cuando estemos seguros de que la opcional tiene un valor. De lo contrario, el código fallará.
 
 */



/*
 
 Bonus track: optional chaining
 
 */

struct User2 {
    let name: String
    let age: Int
}

var optionalUser: User2?
// let name = optionalUser?.name


/*
 
 Esto sirve para cuando un objeto de por sí es opcional.
 
 En este caso, el usuario sería un opcional. Si el usuario es nil, el nombre será un nil.
 
 Lo podríamos desenvolver de cualquier manera que queramos.
 
 */

let name = optionalUser?.name ?? "Not given"

if let newName = optionalUser?.name {
    print(newName)
}

/*
 
 El optional chainging permite correr un código solo si la opcional tiene un valor. Es decir, todo lo que viene después del interrogante se ejecutará SOLO si la opcional tiene un valor. En caso contrario, no se ejecutará.
 
 
 */





// ENUMERACIONES (ENUMS)


/*
 
 Las Enums son grupos de valores relacionados entre sí. Otra manera de definirlos es que son la manera en la que nosotros como programadores podemos definir nuestro propio tipo de valores en Swift.
 
 Como es un grupo de valores que está formado por casos, se suele trabajar con switch statements.
 
 */

enum SocialPlatform {
    case twitter
    case facebook
    case instagram
    case linkedIn
}

func shareImage(on platform: SocialPlatform) {
    switch platform {
    case .twitter:
        print("This is where the code would go to share the image on Twitter")
    case .facebook:
        print("This is where the code would go to share the image on Facebook")
    case .instagram:
        print("This is where the code would go to share the image on Instagram")
    case .linkedIn:
        print("This is where the code would go to share the image on LinkedIn")
    }
}

shareImage(on: .linkedIn)
shareImage(on: .twitter)

//*
// 
// También se pueden llenar los enums con constantes
// 
// */
//
//enum SFSymbols {
//    static let location = UIImage(systemName: "mappin.and.ellipse")
//    static let repos = UIImage(systemName: "folder")
//    // [...]
//}


/*
 
 Las enums nos permiten definir nuevos tipos de datos, y después definir posibles valores que almacenen. Se ve más claro con un caso como el del tiempo que hace
 
 */


enum WeatherType {
    case sun, cloud, rain, wind, snow
}


func whatsTheWeatherLike(today weather: WeatherType) -> String {
    if weather == .sun {
        return "Sun's coming out today"
    } else {
        return "Sun's not coming out today"
    }
}

print(whatsTheWeatherLike(today: .cloud))

/*
 
 Al pasar el parámetro cuando llamamos la función podríamos poner whatsTheWeatherLike.cloud, lo mismo que en la condicional de if weather, pero Swift reconoce la enum y es capaz de saber que estamos accediendo a uno de los casos con la inferencia de tipos.
 
 */

func checkTheWeather (weather: WeatherType) -> String? {
    switch weather {
    case .sun:
        return nil
    case .cloud, .rain:
        return "Sun is not coming out today, you know?"
    case .wind, .snow:
        return "Winter's not gone yet"
    }
}


print(checkTheWeather(weather: .cloud))



// STRUCTS


/*
 
 Las structs son tipos de datos complejos. Esto significa que están hechos de múltiples valores.
 
 Primero definimos un struct, que es un tipo propio de dato. Y después podemos crear instancias de este struct (copias) y llenarlas con valores propios.
 
 */

struct Person {
    var clothes: String
    var shoes: String
}


/*
 
 Cuando definimos un struct, Swfit facilita mucho la tarea de crearlos porque genera automáticamente lo que se llama un inicializador de miembro (memberwise initializer). Esto significa que permite crear un struct pasándole valores iniciales como propiedades
 
 */


let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
let other = Person(clothes: "short skirts", shoes: "high heels")
