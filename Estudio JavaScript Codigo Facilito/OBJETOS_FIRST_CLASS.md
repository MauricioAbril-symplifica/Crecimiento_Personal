### OBJETOS FIRST CLASS:
- Para que un objeto pueda ser considerado como objeto de primera clase tiene que cumplir con las siguientes porpiedades:

    * Debe ser posible retornarlo
    * Debe ser posible asignarlo a una variable
    * Debe ser posible enviarlo como argumento

En javascript es común enviar funciones como argumentos de otra.


EJ:

function executor(funcion){
    funcion();
}

funcion sayHello(){
    console.log("Hello World");
}

executor(decirHola); -> "Hello World"

Cuando se envia como argumento una funcion no se colocan los parentesis(Los parentesis son solo para ejecutar o llamar la función).


