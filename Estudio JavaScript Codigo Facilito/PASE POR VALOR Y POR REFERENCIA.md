### PASE POR VALOR Y POR REFERENCIA:

- Un valor es pasado como referencia, cuando el parametro 
apunta a las misma dirección quel argumento original, de manera que cuando modificamos este valor el argumento original tambien cambia.

- Pasamos un argumento como valor cuando pasamos una copia del argumento original, esta copia esta en una dirección distinta del argumento original, una modificación no afecta al parametro original. Cualquier valor que no sea un arreglo o un objeto es pasado por valor, es decir numeros, strings , etc..

EJ: 
Argumento por valor:

let edad = 20;

function modificador(edad){
    edad=25;
    console.log("Dentro de la función: "+ edad);
}

console.log(edad); -> 20
modificador(edad); -> "Dentro de la función: 25"
console.log(edad); -> 20

Como vemos no se modifica la variable edad, cuando se ejecuta la función.


Argumento por referencia:

let edades = [20]

function modificador(edades){
    edades[0]=25;
    console.log("Dentro de la función: "+ edades);
}

console.log(edades); -> [20]
modificador(edades); -> "Dentro de la función: 25"
console.log(edades); -> [25]

Como vemos se modifica la variable original(A esto se le llama mutación).
