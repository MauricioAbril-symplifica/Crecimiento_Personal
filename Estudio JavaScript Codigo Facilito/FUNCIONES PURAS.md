FUNCIONES PURAS:

- Una mutación es la modificación del valor original.

EJ:

let arreglo = [1,2,3]
arreglo[0] = 2; -> Mutación

let valor = 2;
valor += 1; -> Mutación

- Una función pura es aquella que no produce efectos secundarios.

EJ: 

let edades = [20]

### FUNCION NO PURA ( MODIFICA EL ARGUMENTO ORIGINAL)

function modificador(edades){
    edades[0]=25;
    console.log("Dentro de la función: "+ edades);
}

console.log(edades); -> [20]
modificador(edades); -> "Dentro de la función: 25"
console.log(edades); -> [25]

### FUNCION PURA 

function modificadorPura(edades){
    let copia = [...edades]; -> Genera una copia de la variable original (shallow copy)
    copia[0] = 25; Modifico la copia pero no el valor original de la variable edades;
    console.log("Dentro de la función: "+ edades);
    return copia; 
}

console.log(edades); -> [20]
modificadorPura(edades); -> "Dentro de la función: 20"
console.log(edades); -> [20]
console.log(modificadorPura(edades)); -> [25]
