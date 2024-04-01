
### QUÉ ES LA PROGRAMACIÓN ASÍNCRONA:

En un lenguaje de programación asíncrono como JavaScript, las tareas pueden ejecutarse secuencialmente, esto significa que podemos indicar que algunas tareas se pasen a segundo plano y esperen a su turno para ser reanudadas y ejecutadas.

Esta característica del lenguaje existe para mejorar el rendimiento del mismo, porque nos permite aprovechar al máximo las capacidades del equipo en el que se está ejecutando nuestro código.

Por lo general las tareas que se esperan sean más tardadas, o que necesiten esperar respuesta de algún otro elemento del sistema, son candidatas a ser delegadas a este proceso de espera y ejecución.

JavaScript es un lenguaje de ejecución sobre un solo hilo, esto significa que sólo puede ejecutar una tarea a la vez. Cuando una operación tarda demasiado o está esperando la respuesta de otra, decimos que bloquea las demás instrucciones, precisamente porque JavaScript no puede ejecutar dos a la vez.

Para solucionar esto, JavaScript introduce el event loop, o ciclo de eventos. El event loop se compone de dos componentes principales, una cola de mensajes y un ciclo que se encuentra iterando esta cola de mensajes. La programación asíncrona en JavaScript funciona empujando ciertas operaciones a esta cola de actividades, para que no bloqueen la ejecución de código mientras terminan, el trabajo del event loop es estar preguntando las operaciones de la cola de actividades si ya han finalizado, y cuando lo hacen, reanuda la ejecución de dicha operación, la recupera por así decirlo.

Para que todo esto funcione, necesitas una forma de delegar ciertas operaciones a esta cola, y una forma de saber cuándo estas operaciones han terminado, para hacerlo JavaScript introdujo inicialmente el concepto de callbacks, y después el de promesas, finalmente a la sintaxis se introdujeron las funciones asíncronas, todos estos conceptos están diseñados para que esta comunicación entre el event loop, la cola de actividades y tu código, suceda.


### CALLBACKS:

Un callback es una función que se pasa como argumento a una función asíncrona, con la expectativa que dicha función se ejecutada una vez que la operación termine.

EJ:
```
npm install request
let request = require('request');
request('https://www.google.com',()=>console.log("Termine la petición");)
console.log("Yo sucedo despues");

En la ejecución sería asi:

Primero se ejecuta "Yo sucedo despues" y luego "Termine la petición", esto se debe que aunque estre primero la respuesta de "Termine la petición", al ser un callback solo se ejecuta hasta que se haya hecho la petición a la url y traiga la información necesaria.
```

### PROMESAS:

Las promesas surgen como una alternativa a la sintaxis de callbacks, esta sintaxis es un poco mas concisa, expresiva y fácil de entender, principalmente cuando se escribe código con varias peticiones asincronas en secuencia (Lo que se llama Callback hell que es una anidación de callbacks).

EJ:

```
npm install request-promise
let request = require('request-promise');
let promesa = request('https://www.google.com');
promesa.then(()=>console.log("Termine la petición");)
promesa.catch(err => console.log("Error"));
console.log("Yo sucedo despues");

```
Estas promesas se ejecutan cuando se cumpla el request correctamente, por medio de la promesas podemos capturar los errores.

Una promesa es un objeto que probablemente produzca un valor en el futuro,este valor puede ser el valor de una operación asincrona o un error arrojado durante la ejecución de este código.

Las promesas pasan por distintos estados:

1. Fullfiled(Completada): Significa que la promesa se completó con éxito. (.then hace su trabajo)
2. Rejected(Rechazada): Significa que la promesa no se completó con éxito. (.catch hace su trabajo)
3. Pending(Pendiente): Es el estado de la promesa cuando la operación no ha terminado. Aquí decimos que la promesa no se ha cumplido.
4. Settled(Finalizada): Cuando la promesa terminó ya sea con éxito o con algún error.

### CALLBACKS DE LAS PROMESAS:

La forma en la que obtemos el valor de una promesa y podemos ejecutar código cuando esta finalizado es enviando funciones a metodos especificios de las promesas que ejecutaran dichas funciones cuando la operación asincrona finalice. 

Existe tres metodos en una promesa que podemos añadir código a que se evalue en distintos estados de la promesa:

1. .then() -> Cuando la promesa se ejectuto con éxito (fullfiled).
2. .catch() -> Cuando la promesa fue rechazada o finalizó con algún problem (rejected o settled).
3. .finally() -> Que ejecuta codigo sin importar que la promesa se ejecuto con exito o fallo.

Es común de ejecutar los metodos de las promesas de manera encadena, ya que retorna la misma promesa.

EJ:

```
npm install request-promise
let request = require('request-promise');
let promesa = request('https://www.google.com');
promesa.then(()=>console.log("Termine la petición");) -> Se puede colocar dos funciones en then la primera cuando se ejecuta correctamente y otra cuando falla la promesa, pero es mejor manejar el fallo de la promesa con catch
        .catch(err => console.log("Error"))
        .finally(()=> console.log("Finalicé));

console.log("Yo sucedo despues");

```

El .finally() su usa más que todo para hacer limpieza o cerrar algunas de la cosas utilizadas al ejecutar la promesa(EJ: Cerrar la base de datos luego de una consulta, reiniciar un formulario, etc).


### CREAR PROMESAS:

Las promesas son objetos, decimos que una operación asincrona retorna un objeto del tipo promesa. Este objeto eventualmente puede usarse par obtener el resultado de una operación asíncrona o un error.

Para construir una promesa se necesita instanciar una clase de tipo Promise. y lleva como argumento un una función a la que se le conoce como executor ,esta función tiene 2 parametros uno llamado resolve y otro reject. Luego dentro del bloque de código se coloca como argumento de resolve lo que devuelve si la promesa fue exitosa y como argumento de reject lo que devuelve si la promesa fue rechazada.

EJ:

```
let promesa = new Promise(function(resolve,reject){
    resolve(10);
    rejecte("Algo salió mal");

});

```

Ahora vamos a cambiar los ejemplos anteriores de request pero ahora con promesas.

EJ:

```
npm install request
let request = require('request');

function leerPagina(url){
    return new Promise(function(resolve,reject){
        request(url,function(error,response){
            if(error)return reject(error);
            resolve(response)

        })
    });
}

let promesa = leerPagina('https://www.google.com');
promesa.then(()=>console.log("finalice")).catch(err => console.log(err));

```

### RESOLVER MULTIPLES PROMESAS:

Como solucionar multiples promesas que no dependen entre si.

EJ:

```
let p1 = new Promise((resolve,reject) => setTimeout(resolve,500,"Hola Mundo"));
let p2 = new Promise((resolve,reject) => setTimeout(resolve,600," Segundo Hola Mundo"));

function finalizado(){
    console.log("Todo finalizo")
}


p1.then(function(resultado){ -> El valor de resultado es lo que viene de la promesa con resolve.
    console.log(resultado);
})

Si necesito que todas las promesas hayan finalizado para ejecutar otra función podemos hacerlo de la siguiente manera, si alguna falla se va para el catch:

Promise.all([p1,p2]).then(resultados => {
    console.log(resultados);
    finalizado();
}).catch(e => console.log(err));

```


### ENCADENAR PROMESAS:

Para encadenar promesas, necesitamos que la funciones que encadenemos retornen promesas.

EJ:

```

function primerPromesa(){
    return new Promise((resolve,reject) => setTimeout(resolve,500,"Hola Mundo"));
}

function segundaPromesa(r2){ -> Pasamos la respuesta de la primera promesa para comunicar todo se puede hacer.
    console.log(r2)
  return new Promise((resolve,reject) => setTimeout(resolve,600," Segundo Hola Mundo"));
};


primerPromesa().then(segundaPromesa).then(r => console.log())

function finalizado(){
    console.log("Todo finalizo")
}


```


