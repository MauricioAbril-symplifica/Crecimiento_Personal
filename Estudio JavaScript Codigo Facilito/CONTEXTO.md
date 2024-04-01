
### EL CONTEXTO EXPLICADO:

Cuando hablamos de contexto nos referimos al valor que tiene la palabra reservada this.
Cuando el inteeprete evalua esta palabra dependiendo de donde esta, que objeto es, dependiendo que funcion es puede adoptar un valor diferente.

Cuando hablamos de this = contexto; 

el valor del contexto en el alcance global es: window en el navegador

EJ:

console.log(this)

Cuando no estamos dentro un objeto, el contexto global es donde se esta ejecutando el codigo, si estamos en el un objeto, el contexto es todo el objeto.

cuando usamos this dentro de una funciòn this sigue siendo del contexto global.

Una función que esta dentro del objeto global se puede llamar desde el objeto global.

EJ:

function demo(){
    console.log(this);
}

Mi contexto global es window.

puedo llamar la función desde window.demo();

El valor del contexto contexto comienza a cambiar cuando definimos una funcón dentro de un objeto:

EJ:

let objeto ={
    demo:function(){
        console.log(this);
    }
}

objeto.demo(); -> Al ejecutar esto el valor de this es el objeto que llama demo, es decir el objeto creado con nombre 'objeto'. -> EL valor del contexto es el objeto que ejecuta la función (en donde se ejecuta).

Si guardo la función de un objeto en una variable o le paso a otra función como argumento, la función del objeto pierde la referencia del contexto original y pasa como global.

EJ:

let estudiante ={
    nombre:"Mauricio",
    saludar:function(){console.log("Hola soy" + this.nombre)}
}

estudiante.saludar(); -> "Hola soy mauricio";

let f = estudiante.saludar;
f(); -> "Hola soy undefined" -> Se perdio el contexto 



### ARROW FUNCTIONS:

Existe una sintaxis alternativa para declarar funciones sin la palabra function y se ve de la siguiente pantalla:

EJ:

let hola = () => {console.log("Hola Mundo")};

let hola = () => console.log("Hola Mundo");

El nombre de la función adopta el nombre de la variable, la segunda caracteristica es que las llaves pueden omitirse si la función es de una sola línea y se crea un retorno implicito (no es necesario la palabra return). Se coloca despues de los parametros que van dentro de un parentesis si esta vacío o hay mas de un parametro o si apenas hay un parametro puede ir sin parentesis la siguiente sintaxis => para saber que es una función flecha despues de eso va el codigo.


### ARROW FUNCTION Y EL CONTEXTO:
 
 Tienen una sintaxis más corta que la declaración con function.
 Heredan el valor del this del contexto en el que fueron creadas, y no se reasigna.


 EJ:

 let estudiante ={
    nombre:"Mauricio",
    saludar:function(){console.log("Hola soy " + this.nombre)},
    saludarAlt: () => console.log("Hola soy " + this.nombre)
}

estudiante.saludar() -> "Hola soy Mauricio" -> El contexto lo usa del objeto estudiantes
estudiante.saludarAlt() -> "Hola soy undefined" -> Usa el contexto global, porque no se insatancio este objeto por ende no fue creada edentro de estudiantes.

Si creo una funcion constructura cada vez que se instnacie va a tener el contexto correcto.

Un arrow function adopta el valor del contexto en la creación, en la definición de la función y no lo adopta y no lo modifica en la ejecución. Las funciones declaradas con function adoptan el valor del contexto en la ejecución y no en la creación

### BIND, CALL, APPLY :

Javascript ofrece metodos que podemos deliberadamente asignar el valor del "this" estos son bind,call y apply.

EJ:

function Estudiante(){
    nombre:"Mauricio",
    saludar:function(){console.log(this)}
}

let e = new Estudiante();

e.saludar(); -> Estudiante{nombre:"Mauricio",
    saludar:function(){console.log(this)}}

+ Inmediata: call y apply
+ Lazy: bind

- Metodo Call:

e.saludar.call({},1,2) -> El valor de this adopta lo que se pase en call, lo que va despues de la primera coma son argumentos. En pocas palabras lo que recibe call es el objeto y luego los argumentos. Se ejecuta la función enseguida

- Metodo Apply:
El metodo apply es muy parecido a call, lo unico que cambia es como se envia los argumentos. 

e.saludar.apply({},[1,2]) -> Se envia los argumentos dentro de un array

- Metodo Bind:

Bind nos permite asignar el valor de this sin que la función se ejecute, bind retorna una nueva función para la que el valor de this a sido definido y no debería cambiar.

let nuevaFuncion = e.saludar.bind({});

nuevaFuncion() -> Solo ejecuta la función cuando se llama

El metodo bind se utiliza dentro de la función constructora sobrescribiendo la propieda de la función usando bind para que en cualquier punto se user el this como contexto siempre del objeto.