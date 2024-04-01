ARGUMENTOS DE FUNCIONES:

Para recibir información en una función se les pasa argumentos.

Los parametros son los datos necesarios que se defienen al momento de declarar una función.

EJ: function nombreFunction(parametro){}

Los argumentos son los que se le pasa a la función al momento de llamar a la función.

EJ: nombreFunction(Argumento);

NOTA: No se valida los argumentos que se pasan, se pueden enviar muchos.

Se pueden colocar parametros por defectos en una función en caso de que no se pase ningun argumento.

EJ: function cuadrado(numero=20){}

Si no se cuantos parametros colocar, puedo usar la palabra reservada arguments y dejar la funcion vacia.

EJ: function sumaTodos(){
    console.log(arguments)
}

