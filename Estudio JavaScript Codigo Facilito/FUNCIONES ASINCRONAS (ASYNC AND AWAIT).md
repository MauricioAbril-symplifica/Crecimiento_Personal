### FUNCIONES ASÍNCRONAS:

Cuando programamos en JavaScript, constantemente trabajamos con operaciones asíncronas como solicitudes a un servicio web, cálculos, eventos, etc.

La complejidad de las operaciones asíncronas es que no se sabe cuándo van a terminar, por lo que debe existir un mecanismo que nos informe sobre si una tarea ha sido completada o no, qué resultado produjo y si se completó con éxito o hubo un error, y en caso de que haya habido un error, de qué error se trata.

Para solucionar esto se han introducido distintas estrategias, objetos y estructuras que permitan trabajar en un flujo de operaciones asíncronas, inicialmente teníamos los callbacks, funciones que se asignaban y eran llamadas cuando la operación asíncrona había retornado.
Eventualmente se introdujeron las promesas, objetos pensados para valores asíncronos con funcionalidad adicional pensada precisamente para trabajar con 1 o varias operaciones asíncronas en un programa.


Las promesas, como aprendimos antes, introdujeron incontables mejoras por sobre los callbacks, sin embargo, la sintaxis puede parecer confusa y poco legible, además de que es un concepto que puede ser desafiante para nuevos desarrolladores de JavaScript.

En versiones más nuevas del lenguaje se introdujo el concepto de funciones asíncronas, dentro de las que trabajar con promesas se vuelve más simple con el uso de la palabra reservada await.

En este bloque conocerás los detalles de las funciones asíncronas, la sintaxis, cómo funcionan y cómo puedes usarlas para manejar operaciones asíncronas, como podrás ver más adelante, esto significará que el código de manejo de operaciones asíncronas se vuelve más expresivo y sencillo, sin perder por supuesto la funcionalidad correspondiente.

### ASYNC:

Las funciones asíncronas se declaran con la palabra reservada async antes de la definicion de una función.

EJ:

```
async function suma(valor1,valor2){
    return valor1 + valor2;
}

```

Con la palabra async siempre se devuelve un promesa. Todo esto trabaja en conjunto cuando tambien se usa la palabra reservada await.

### AWAIT:

La palabra reservada await hace que la ejecución del código espere a que una promesa sea resuelta evitando a que constantemente se escriba .then y escriiendo funciones anonimas.
await solo funcion si se usa dentro de una función con la palabra reservada async


EJ:

````
async function showInfoGithub(){
    let response = await fetch('https://api.github.com/users/mauro9735/repos');
    let repos = await response.json();
    console.log(repos);
}

showInfoGithub();
````

Así se haria si se encadenara promesas donde es mas claro hacerlo con await.

EJ:

```
async function showInfoGithub(){
    fetch('https://api.github.com/users/mauro9735/repos').then(r => r.json()).then(()=>{
        console.log(repos);
    })
}

showInfoGithub();

```

### MANEJAR ERRORES CON PROMESAS:

Para manejar errores con async | await usamos lo que se llama bloques try and catch. Todas las promesas que fallen entraran al bloque catch.

EJ:

````
async function showInfoGithub(){
    try{
        let response = await fetch('https://api.github.com/users/mauro9735/repos');
        let repos = await response.json();
        console.log(repos);
    }catch(err){
        console.log(err)
    }
}

showInfoGithub()

````









