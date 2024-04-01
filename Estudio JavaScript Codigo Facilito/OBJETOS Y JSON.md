OBJETOS Y JSON:

### QUE ES LA PROGRAMACIÓN ORIENTADA A OBJETOS:

La programación orientada a objetos es un paradigma de programación basado en la creación de objetos que pueden contener datos y funciones.

Se dice que la programación orientada a objetos busca que representemos nuestro código y algoritmos con objetos, como en la vida real.

Este paradigma está basado, principalmente en los principios de abstracción, encapsulación o encapsulamiento, herencia y polimorfismo.

El propósito central de la programación orientada a objetos es que los objetos que definimos para nuestros algoritmos sean independientes, que no expongan sus detalles y que se puedan usar e integrar con otros objetos.

Un objeto es una combinación de propiedades o atributos que describen al objeto y una serie de métodos o acciones que puede ejecutar el objeto. Cada objeto en nuestro programa es capaz de almacenar información en sus propiedades y de modificarlas de manera independiente a otros objetos. Esto quiere decir que aunque tuviera dos objetos similares, digamos dos marcadores, cada uno puede modificar sus propiedades sin que estas modificaciones afecten al otro objeto, aún cuando ambos son del mismo tipo.


De eso se trata separar nuestro código en objetos, de crear pequeños objetos, simples, con responsabilidades sencillas, que en conjunto, puedan solucionar problemas complejos, ayudándonos así a separar dicho problema en distintas responsabilidades.

### DECLARAR UN OBJETO JSON:

- Una forma de declarar un objeto es usar el JavaScript Object Notation (JSON).

Para declarar un objeto en JavaScript tenemos que usar unas llaves({}), dentro de estas llaves se agregan las propiedades y métodos.

EJ:

let curso = {
    titulo:"Curso profesional de JS",
    formato: "Video",
    bloques : ["Introducción","Funciones"],
    inscribir: function(){
        console.log("Inscrito");
    }
};

Para obtener el valor de las propiedades de un objeto podemos usar lo siguiente:

console.log(curso.titulo); -> "Curso profesional de JS"
console.log(curso["formato"]); -> Video
curso.inscribir(); -> "Inscritos";

El valor de una propiedad puede ser reasignado, colocando el nombre del objeto punto y la propiedad.

EJ:

curso.titulo = "Curso de Java";
curso["inscribir"] = function(){console.log("Inscribir v2")}

console.log(curso.titulo); -> "Curso de Java"
curso.inscribir(); -> "Inscribir v2"

### SHORTHAND SYNTAX:

- Este shorthand se utiliza cuando necesitas asignar a una propiedad del objeto que tiene el mismo nombre de la variable (esto se puede hacer tambien solo colocando el nombre de la variable).

EJ:

let nombre = "Mauricio";
let usuario = {nombre:nombre};
console.log(usuario.nombre); -> "Mauricio"

Esto se puede apartir de ecmascript 2015
let nombre = "Mauricio";
let usuario = {nombre};
console.log(usuario.nombre); -> "Mauricio"

- Otro shorthand syntax es que en vez de colocar toda la declaracion de una función anomima, se puede colocar de la siguiente manera.

EJ:

let nombre = "Mauricio";
let usuario = {
        nombre,
        saludar:function(){console.log("HOLA")}
    };
usuario.saludar(); -> "HOLA

let usuario = {
    nombre,
    saludar(){console.log("HOLA")}
}

usuario.saludar(); -> "HOLA

### DUPLICAR O COMBINAR OBJETOS:

- Con el spread operator se puede duplicar o combinar objetos, este operador se puede usar sobre cualquier iterable. El spread operator permite en un array extender los elementos, en un objeto sirve para dulicar lo que tiene el objeto.

EJ:

let user = {
    edad:20,
    nombre:"Mauricio"
}

let copia = {...user}
console.log(copia); -> {edad:20,nombre:"Mauricio"}

- Se le puede agregar más propiedades a la copia.

EJ:

let user = {
    edad:20,
    nombre:"Mauricio"
}

let admin = {...user,permisos:true};

console.log(admin); -> {edad:20,nombre:"Mauricio",permisos:true}

- Se puede combinar dos o más objetos:

let user = {
    edad:20,
    nombre:"Mauricio"
}

let permisos = {
    nivel:2
}

let combinar = {...user,...permisos};
console.log(combinar); -> {edad:20,nombre:"Mauricio",nivel:2}

- Los objetos de la derecha reemplazan a los de la derecha cuando las propiedades estan repetidas:

EJ:

let user = {
    edad:20,
    nombre:"Mauricio"
}

let permisos = {
    nivel:2
}

let replaceProperties = {...user,...permisos,nombre:"Cody"};

console.log(replaceProperties); -> {edad:20,nombre:"Cody",nivel:2}

- Otra maneras de duplicar un objeto:

EJ:

let user = {
    edad:20,
    nombre:"Mauricio"
}

let copia = Object.assign({},user);
console.log(copia); -> {edad:20,nombre:"Mauricio"}

- En Object.assign el primer argumento es la fuente y los demás argumentos son los targets a combinar.

EJ:

let user = {
    edad:20,
    nombre:"Mauricio"
}

let copia = Object.assign(user,{permisos:true});
console.log(copia); -> {edad:20,nombre:"Mauricio",permisos:true};

- Utilizar Object.assign tiene metodos accesores que son los getters y los setter, el spread operator no los tiene.


### DESTRUCTURING ASSIGNMENT:

- Podemos asignar las propiedades de un objeto a variables independientes usando el destructuring.
Para asignar por destructuración se necesita declarar la variable y colocar las llaves, dentro de las llaves los nombres de las variables(atributos del objeto) que se van a separar.

EJ:

let user = {name:"Uriel", edad:20};

let { name } = user;

console.log(name) -> "Uriel"

- No es obligatorio para destructurar llamar la variable igual que el atributo, se puede destructurar tambien de la siguiente manera:

EJ:

let user = {name:"Uriel", edad:20};

let {name:nombrePerro } = user;

console.log(nombrePerro) -> "Uriel"

- Se puede colocar valores por defecto.

EJ:

let user = {name:"Uriel", edad:20};

let {name: nombreUsuario, apellido = 'Hernandez' } = user;

console.log(apellido); -> "Hernandez"

- Esta destructuración se puede combinar con el spread operator.

EJ:

let user = {name:"Uriel", edad:20};

let {name, ...rest } = user;

console.log(name); -> "Uriel"
console.log(rest); -> {edad:20}

- El destructuring se puede usar bien, cuando pasamos a la funcion un objeto pero solo necesitamos una propiedad del objeto. Tambien se pueden usar otros nombres como en los ejemplos anterores

EJ:

let user = {name:"Uriel", edad:20};

function saludar({name}){
    console.log(name);
}

saludar(user); -> "Uriel";

- Esta sintaxis de destructuring tambien se puede usar sobre arreglos, lo que cambia es que en vez de usar llaves se usan corchetes, la cuestion es que el orden en que se definan los nombres toma el valor de la posición del arreglo. tambien se pueden usar el spread operator y tambien en funciones.

EJ:

let calificaciones = [10,9,8];

let [matematicas,programacion,ciencias] = calificaciones;

console.log(ciencias); -> 8


### FUNCIONES CONSTRUCTORAS:

- En JavaScript tambien podemos construir objetos a partir de funciones, cualquier función de hecho puede usarse para instanciar un objeto.

Para instanciar un objeto apartir de una funcion necesitamos la función y utilizar el operador new y luego la función ejecutandose.

EJ:

function Hola(){
    console.log(this);
}

let objeto = new Hola();

Cuando se ejecuta se ve de la siguiente manera:

Hola{};
[object Object]{....}


EJ:

function Course(title){
    this.title=title;
    this.inscribir=function(){}
}

let objeto = new Course("Curso de JS");
console.log(objeto) -> [object Object]{ title: 'Curso de JS', inscribir: [Function (anonymous)] }

Se pueden crear muchos objetos , pero cada objeto comparte su propio estado.




