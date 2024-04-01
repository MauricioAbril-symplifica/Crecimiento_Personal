### DEFINIR CLASES:

En Javascript las clases no existen, js es un lenguaje orientado a objetos basado en prototipos y se diferencia de java con las clases.

Las clases se introducen a js como una sintaxis alternativa para definir objetos, aunque la base de lenguaje de js siguen siendo los prototipos.

Para definir una clase se usa la palabra reservada class el nombre de la clase y un bloque con toda la definición.

EJ:
```
class Curso{
    constructor(titulo){
        this.titulo = titulo;
    }

    inscribir(){
        console.log("Inscrito")
    }
}
```
Los nuevos objetos a partir de una clase o una función constructura se le llama instanciar.

### DEFINIR METODOS Y PROPIEDADES:

La sintaxis para definir metodos y propiedades puede variar hay varias formas de realizar esto.

EJ:
```
class Curso{
    title="JS";
}

let c = new Curso();
console.log(c.title) -> "JS"
```
tambien se pueden definir la propiedades en el metodo constructor como lo vimos antes que es la manera correcta o mejor practica porque se puede hacer en cualquier metodo.

EJ:
```
class Curso{
    constructor(titulo){
        this.titulo = titulo;
    }

    inscribir(nombre){
        this.nombre = nombre;
    }
}

let c = new Curso();
c.inscribir("Mauricio")
console.log(c.nombre)-> "Mauricio" 
```
Otra sintaxis valida es hacer todo desde el constructor.

EJ:

```
class Curso{
    constructor(titulo){
        this.titulo = titulo;
        this.inscribir = function(nombre){
            this.nombre=nombre
        }
    }
}

Otra forma de hacerlo:

class Curso{
   titulo = "JS";
   inscribir = nombre => this.nombre = nombre;
}
```
### ALCANCE DE PROPIEDADES:

Las propiedades y metodos de una clase son publicos por defecto, sin embargo existe una sintaxis para hacer propiedades y metodos privados. Las propiedades o metodos privados contribuye al procesos de encapsulación de código en los que decimos que los objetos deben ser piezas aisladas y blindadas que hagan un trabajo que hagan su responsabilidad sin exponer los detalles.

EJ:
```
class Curso{
    #title = "Javascript";
    bienvenida(){
        console.log("Bienvenido al curso: "+ this.#title)
    }
}

let j = new Curso();
console.log(j.#title) -> Error metodo privado
j.bienvenida(); -> Bienvenido al curso: javascript; -> No hay error por que se usa dentro de la clase. -> Si hago el metodo privado me da un error.
```

### METODO CONSTRUCTOR:

El metodo constructor es un metodo especial que se ejecuta de manera automatica cuando instanciamos un nuevo objeto desde una clase, el constructor existe para ejecutar instrucciones de inicialización para el objeto que puede ser iniciar las propiedades del objeto,darles un valor inicial, ejecutar operaciones apenas se cree el objeto. En una clase de javascript se define con el nombre constructor. En javascript solo puedes tener un solo constructor. Este metodo puede recibir parametros que se asignan a las propiedades con los argumentos al utilizar el operador new.

EJ:
```
class Curso{
    constructor(titulo,color="yellow){
        this.titulo = titulo;
        this.color = color;
        console.log(arguments)
    }
}

new Curso("Curso profesional de Javascript");
```

### HERENCIA DE CLASES:

Este concepto permite que un objeto herede las propiedades y metodos de un objeto que llamamos padre. A partir de esto podemos modificar o agregar mas metodos en los objetos hijos.


EJ:

class Human{}

Para heradar de un clase padre a una clase hija usamos la palabra reservada extendes.

class Admin extends Human{} -> La clase admin herada la funcionalidad de la clase human que no sea privado.

EJ:
```
class Human{
    especie = "Humano";

}

class Admin extends Human{}

let admin = new Admin();
console.log(admin.especie) -> "Humano"
```
Se puede sobreescribir la funcionalidad del padre.

EJ:
```
class User{
    constructor(name){
        this.name = name
    }
    saludar(){console.log("Hola User")}
}

class Admin extends User{
    constructor(name){
        super(name);
    }
    saludar(){
        super.saludar();
        console.log("Hola soy admin");
    }
}
```
Para usar una propiedad o metodo de la clase padre dentro de algo que queremos sobrescribir o crear a partir de eso usamos la palabra reservada super.


### METODOS ACCESORES:

Para explicar la encapsulación del objeto podemos esconder propiedades del objeto y ofrecer metodos que nos permitan leerlos y modificarlos sin tener que acceder directamente a la propiedad. Para tener metodos accesosores podemos colocar la palabra reservadas get y set antes del nombre del metodo.

EJ:

````
class User{
    get nombre(){}
    set nombre(nombre){}
}

````

Los metodos que tiene get nos permite obtener o leer el valor de una propiedad. No se necesita llamar a los parentesis para ejecutarlos.

EJ:

````
class User{
    get nombre(){return "Mao"}
    set nombre(nombre){}
}

let user = new User();
console.log(user.nombre); -> "Mao"
````

Los metodos que tiene set nos permiten modificar el valor de una propiedad. y son llamados cuando usamos el operador de igualdad.

EJ:
```
class User{
    get nombre(){return "Mao"}
    set nombre(nombre){console.log("El usuario de nombre: "+nombre);}
}

let user = new User();
user.nombre = "Manuela" -> "El usuario de nombre: Manuela"
```

EJ:

```
class User{
    get nombre(){return this._nombre}
    set nombre(nombre){this._nombre=nombre;}
}

let user = new User();
user.nombre = "Emelina"
console.log(user.nombre) -> "Emelina"
```

Se uso _ en el nombre de las variables para no confundirnos con el nombre de los metodos accesores.


### METODOS Y PROPIEDADES ESTÁTICAS:

Es posible añadir metodos o propiedades estaticas si añadimos antes la palabra reservada _static_


EJ:
```
class Api{
    static ENDPOINT = "localhost:8080"
    static get(){console.log("Soy un metódo estático")}
}

Api.get(); -> "Soy un metódo estático"
console.log(Api.ENDPOINT) -> "localhost:8080"
````
Esto permite que al ser estatico permite llamar un metodo o propiedad llamando la clase sin tener que instanciar un objeto.