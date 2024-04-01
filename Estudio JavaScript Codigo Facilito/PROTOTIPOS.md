### PROGRAMACIÓN ORIENTADA A PROTOTIPOS:
A diferencia de java, el codigó se comparte a traves de las clases.
El prototipo es un objeto asociado a cualquier función, donde cada función incluye una propiedad prototype con un objeto para compartit código.

EJ:

```
function Course(){};
console.log(Course.prototype) -> Objeto

Course.prototype.inscribir = function(){
    console.log("Hola");
}

let curso = new Course(); -> Cuando lo instanciamos se relaciona la propiedad prototype con el objeto con el atributo de nombre __proto__ .
course.inscribir(); -> "Hola"

```

Esto funciona de la siguiente manera, al llamar al metodo inscribir, primero se intenta buscar este metodo dentro del objeto Course, sino lo encuentra, lo busca dentro del objeto prototype que tiene relacion con el objeto para llamarlo.

Existe una cadena de prototipos.

### CONCEPTOS DE PROTOTIPOS:

- Tenemos la propiedad prototype, todas las funciones tienen esta propiedad y apunta al prototype object.

- El prototype object es el objeto al que podemos asignar métodos y propiedades que queremos compartir en el prototype chain o cadena de prototipos.

- Cuando creamos un objeto de una función usando new, se asigna una propiedad proto que apunta al prototype de la función con la que se creó el objeto, también conocida como función constructora. Esto quiere decir que podemos decir que proto apunta al prototype de la función constructora.

- El prototype chain o la cadena de prototipos hace referencia al enlace que se crea entre prototipos que tienen su propio prototipo, que tienen su propio prototipo. Cuando buscamos un método o una propiedad en un objeto, se buscará inicialmente en el objeto y luego en la cadena de prototipos.

- El último eslabón de la cadena de prototipos es Object.prototype, este objeto es usado para definir métodos que compartan todos los objetos del lenguaje, ya que eventualmente la cadena de prototipos termina aquí.

- El prototipo de una función constructora apunta por defecto al prototype de Object, aunque esto puede ser modificado.

- Un dato interesante es que cualquier objeto creado con la notación JSON enlaza su propiedad proto al prototype de la función constructora Object.

### PROTOTIPOS EN LA PRÁCTICA:

Para sacar provecho al concepto de protipos podemos comenzar a pensar en el objeto prototype de una función constructura como un espacio para empezar a definir elementos que se compartiran entre todos los objetos que se generan a partir de esa función.

EJ:

````

function Course(){};
Course.prototype.inscribir = function(){
    console.log("Estoy compartiendo");
}

let js = new Course();
let ruby = new Course();

js.inscribir(); -> "Estoy compartiendo"
ruby.inscribir(); -> "Estoy compartiendo"

````

Los elementos del prototipo son compartidos no copiados ni duplicados, si se cambia el metodo del prototipo se cambia para todo. Despues de instanciar los objetos yo puedo seguir modificando o creando nuevos metodos para el prototipo.
Se puede compartir tanto metodos como información.

### HERENCIA DE PROTOTIPOS:

En Js el proceso de  herencia se realiza por protipos aunque existe sintaxis para usar clases internamente estas siguen usando prototipos. Podemos usar que objeto herede de otro usando Object.create. Todo se comparte por prototipos.

EJ:

````
function Couser(title){this.title = title};
let js = new Course("Curso JS");
let ruby = Object.create(js);
console.log(ruby); -> Object object{title:"Curso JS"}

````

EJ:

````
function Couser(title){this.title = title};
Course.prototype.inscribir = function(){console.log("Inscribir")};

function LiveCourse(date){
    this.published_at=date;
}

LiveCourse.prototype = Object.create(Course.prototype) // {__proto__:Course.prototype}
let js = new LiveCourse(new Date());
js.inscribir(); -> "Inscribir"


````



### RESUMEN:

- En JS la herencia de prototipos funciona al incluier el prototype de una clase en la cadena de prototipos de un objeto.

- Un objeto puede heredar de otro si lo usamos como primer argumento de Object.create.

- Una funcion constructora puede heredar de otra si usamos el prototype de la clase base como primer argumento de Object.create y asignamos ese resultado al prototype de la clase hija.
