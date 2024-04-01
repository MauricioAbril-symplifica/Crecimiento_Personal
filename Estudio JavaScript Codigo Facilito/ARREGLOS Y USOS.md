### ARREGLOS

- Un arreglo es una colección datos agrupados en una sola estructura.

EJ:

let calificacion = [10,9,8,7,9]; -> Arreglo de datos (Se puede guardar cualquier dato)

La longitud del arreglo es la cantidad de datos que almacena, en este caso es 5.
Cada elemento dentro del arreglo ocupa una porsición, la posición empieza desde cero, en este caso el arreglo calificacion en la posición 0 es 10 y en la posición 4 es el último 9.


### CONCEPTOS BÁSICOS DE LOS ARREGLOS:

- Para declarar un arreglo, la forma más simple es utilizar parentesis cuadrados.

EJ:

let array = ["rails","laravel","django",1,{},function(){},[1,23]];

- Para visualizar un elemento del arreglo en especifico, llamamos a la variable que almacena la información y le colocamos parentesis cuadrados y dentro de ellos la posición del elemento (tener en cuenta que la posición empieza desde cero.), si queremos llamar a un elemento y ese elemento es tambien un arreglo, se llama de la misma manera anterior y si se quiere un elemento especificio del segundo arreglo se vuelven a colocar parentesis cuadrado y su posición.

EJ:

let array = ["rails","laravel","django",1,{},function(){},[1,23]];

array[0] -> "rails"
array[6] -> [1,23]
array[6][0] -> 1
array[6][1] -> 23

- Para reemplazar valores, podemos realizar lo siguiente, llamar el arreglo con la posición del elemento a cambiar, colocar un igual para asignarle un nuevo valor.

EJ:

let array = ["rails","laravel","django",1,{},function(){},[1,23]];

array[0] -> "rails"
array[0] = "React";
array[0] -> "React"

- Para agregar un nuevo valor al arreglo al final, se usa el método push, se coloca el nombre de la variable donde se almacena el arreglo punto push y entre parentesis el valor a colocar.

EJ:

let array = ["rails","laravel","django",1,{},function(){},[1,23]];

array.push(5);
array -> ["rails","laravel","django",1,{},function(){},[1,23],5]

- Para agregar un nuevo valor al arreglo al principio, se usa el método unshift, se coloca el nombre de la variable donde se almacena el arreglo punto unshift y entre parentesis el valor a colocar.

EJ:

let array = ["rails","laravel","django",1,{},function(){},[1,23]];

array.unshift(10);
array -> [10,"rails","laravel","django",1,{},function(){},[1,23]]

- Para eliminar elementos de un arreglo, podemo usar el método pop, que elimina el elemento que esta al final o podemos usar shift que elimina el elemento que esta al comienzo.

EJ:

let array = ["rails","laravel","django",1,{},function(){},[1,23]];

array.pop();
array -> ["rails","laravel","django",1,{},function(){}]

array.shift();
array -> ["laravel","django",1,{},function(){}]

### RECORRER UN ARREGLO:

- La forma más sencilla de recorrer un arreglo es usando el ciclo for.

EJ:

for(let i = 0;i < array.lenght;i++){
    console.log(array[i])
}

### OPERACIONES FUNCIONES CON ARREGLOS:

- En versiones modernas de JavaScript, los arreglos poseen una seri de métodos que nos permiten realizar operaciones para recorrerlos, inspeccionarlos o modificarlos.

Estas operaciones se introducen en la revisión de 2009. Lo que tienen en común las operaciones forEach,map,reduce,filter y find, es que son métodos que puedes usar en cualquiera arreglo, y que operan a través de funciones que enviamos como argumento para estos métodos.

### RECORRER UN ARREGLO CON FOREACH:

- Este método forEach permite recorrer un arreglo. No tiene que devolver nada

EJ:

let lenguajes = ["rails","laravel","django"];

lenguajes.forEach(element => console.log(element)); -> "rails","laravel","django"
lenguajes.forEach(function(element){
    console.log(element) -> "rails","laravel","django"
});

-> Hace lo mismo, el ejemplo -> forEach puede recibir tambien el indice y el array

EJ:

let lenguajes = ["rails","laravel","django"];

lenguajes. forEach((element,indice,array)=>console.log(`Este elemento ${element} esta en la posición ${indice} y pertenece a este arreglo ${array}`));

### MODIFICAR ARREGLOS CON MAP:

- Este método lo que hace es generar un nuevo arreglo luego de aplicar una operación de modificación para cada elemento de la colección original. Tiene que devolver algo si o si. No altera el arreglo original. Este metodo tambien puede recibir el indice y el array

EJ1:

let numeros = [2,3,5,1,34];

let cuadrados = numeros.map(function(numero){
    return numero###numero;
})

console.log(cuadrados); -> [4,9,25,1,1156];

/###
2 => [4]
3 => [4,9]
5 => [4,9,25]
1 => [4,9,25,1]
34 => [4,9,25,1,1156]
cuadrados = [4,9,25,1,1156]
###/


EJ2:

let numerosString = ["10","5","4","3"];
let numerosNuber = numeros.map(function(numString){
    return parseInt(numString)
})

console.log(numerosNumber); => [10,5,4,3];

### FILTRAR ELEMENTOS CON FILTER:

Este método nos permite quitar elementos de una arreglo aplicando una condición. Este método devuelve un nuevo array sin modificar el original.


EJ:

let numeros = [8,3,4,10,5,3];

let numerosPares = numeros.filter(n=> n%2===0);

console.log(numerosPares); -> [8,4,10];

let numerosImPares = numeros.filter(n=> n%2); -> Esta condición trae los numeros impares porque cuando es  el resultado (residuo) es 0 osea no tiene residuo porque es par, cero se considera falsy.

console.log(numerosImparesPares); -> [3,5,3];

### REDUCIR UN ARREGLO A UN SOLO ELEMENTO CON REDUCE:

- En terminos técnicos reduce nos permite aplicar una operación de reducción para un arreglo y así reducirlo a un solo valor. Devuelve un valor, el primero el elemento que se le pasa a la función es un acumulador, y luego pasa el elemento.

EJ:

let numeros = [1,2,3,4,5];

let suma = numeros.reduce(function(acc,elemento){
    return acc + elemento;
},0)

console.log(suma); -> 15

let nombres = ["Uriel, "Cody"];

let html = nombre.reduce((acc,nombre) => {
    return acc + "<li>" + nombre + "</li>;
},"")

console.log(html); -> "<li>Uriel</li><li>Cody</li>"


### BUSCAR ELEMENTOS CON UNA ARREGLO

- Método IndexOf: Busca un elemento de un arreglo y si lo encuentra devuelve la posición del elemento encontrado.Para hacer la busqueda hace uso de la entidad de la igualdad estricta (===). Si no lo encuentra o no esta el elemento a buscar devuelve como resultado -1.

EJ:

let arreglo = ["ruby","java","go"];

console.log(arreglo.indexOf("ruby")); -> 0
console.log(arreglo.indexOf("JavaScript")); -> -1


- Método includes: Busca un elemento del arreglo y si lo encuentra devuelve un Booleano ( true or false), dependiendo si esta el elemento buscado o no.Para hacer la busqueda hace uso de la entidad de la igualdad estricta (===). Este método permite pasar un segundo argumento para saber desde que posición empezar a buscar.

EJ:

let arreglo = ["ruby","java","go"];

console.log(arreglo.includes("ruby")); -> True
console.log(arreglo.includes("JavaScript")); -> False
console.log(arreglo.includes("ruby",1)); -> False

- Método find: Permite pasar una función para realizar la busqueda cuando necesitamos condiciones más complejas para hacer la busqueda que la operación de estricta igualdad. Esto devuelve el elemento que se busca, si se encuentra, sino devuelve undefined.

EJ:

let arreglo = ["ruby","java","go"];

let respuesta = arreglo.find(function(elemento,posicion,arreglo){
    return elemento === "ruby";
})

let respuesta2 = arreglo.find(function(elemento,posicion,arreglo){
    return elemento === "rubys";
})

console.log(respuesta); -> "ruby"
console.log(respuesta2); -> "undefined"

- Método findIndex: Permite pasar una función para realizar la busqueda cuando necesitamos condiciones más complejas para hacer la busqueda que la operación de estricta igualdad. Esto devuelve la posición en que se encuentra, sino este devuelve -1 ya que no encontró el elemento.
EJ:

let arreglo = ["ruby","java","go"];

let respuesta = arreglo.findIndex(function(elemento,posicion,arreglo){
    return elemento === "ruby";
})

let respuesta2 = arreglo.findIndex(function(elemento,posicion,arreglo){
    return elemento === "rubys";
})

console.log(respuesta); -> 0
console.log(respuesta2); -> -1

- Método some: Es método que te permite pasar una función parasaber si existe algun elemento , sin importar la posición. Este devuelve un Booleano (true or false) dependiendo si lo encuentra o no. Usa la condición de estricta igual (===).

EJ:

let arreglo = ["ruby","java","go"];


let respuesta = arreglo.some(function(elemento,posicion,arreglo){
    return elemento === "ruby";
})

console.log(respuesta); -> true


// REPASO:

indexOf -> === -> Posición
includes -> === -> true | false
find -> función -> elemento encontrado
findIndex -> función -> posición
some -> función -> true | false

### SPREAD Y REST SINTAX:

- Cualquier objeto de Javascript que puede ser separados en elementos es un iterable.


- El spread syntax(...) permite esparcir los elementos de un arreglo, cadena de texto, cualquier objeto que pueda ser separado.

EJ: 

let arreglo = [1,2,3,4];

console.log(arreglo); -> [1,2,3,4];
console.log(...arreglo) ->  1
                            2
                            3
                            4

- El rest parameter (...) permite agrupar los elementos en un arreglo.

EJ: 

function demo(...arr){
    console.log(arr);
}

demo(10,2); -> [10,2]



