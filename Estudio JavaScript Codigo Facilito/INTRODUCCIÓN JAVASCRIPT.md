
En JavaScript, como cualquier otro lenguaje de programación, vamos a querer trasladar la información del mundo real a nuestro código. Para ello, necesitamos entender qué tipos de datos existen en el lenguaje para poder representar la información que necesitamos.

### EXPRESION VS SENTENCIA:

- Una expresión es una combinación de valores, variables,operadores y funciones que es evalua para producir un resultado.

EJ:

```
5+3 -> Esta expresión suma los números 5 y 3, y devuelve el resultado de 8.

x*y -> Esta expresión multiplica dos variables x e y, y devuelve el resultado.

"Hola" + nombre -> Esta expresión concatena la cadena "Hola" con el valor de la varibale nombre y devuelve la cadena resultante.

```

- Una sentencia es una instrucción que realiza una acción en el programa.

Las sentencias pueden cambiar el estado de las variables, realizar operaciones de entrada/salida, controlar el flujo de ejecución del programa, entre otras acciones.

EJ:

````
a = b*2 , la sentencia es asignar el valor a la variable a y es una expresion proque produce un valor como resultado.
````



### TIPOS DE DATOS:

En JavaScript tenemos 9 tipos de datos que se dividen en dos grandes grupos: primitivos o no primitivos. Más adelante te contaré qué significa esto, pero por ahora, vamos a ver los tipos primitivos.

Dentro de los tipos primitivos tenemos 7 tipos de datos:

number
string
boolean
null
undefined
symbol
bigint

No te preocupes, no tienes ni recordarlos ni entenderlos todos ahora. En esta lección vamos a ver los tres primeros que son, sin ninguna duda, los que más vamos a usar al inicio del curso.

- Números:

Los números (tipo number) son los datos más básicos que podemos representar en JavaScript. En JavaScript, no hay una diferencia entre números enteros y números decimales, todos los números son de tipo number:

7
3.14
19.95
2.998e8
-1

- Valores primitivos:

    - number -> -100, 10, 3.0 
    - string -> "Hola",'abracadabra'
    - boolean -> true, false
    - null -> null
    - undefined -> Undefined
    - symbol -> Symbol()
    - bigint -> 10n

- Valores no primitivos:

    - Arrays
    - Objects


Todo en Javascript que no sea un valor primitivo es un objeto.

### Valores falsy, truthy y nullish:

- Valores falsy:

    1. false: Valor booleano falso
    2. 0: El número 0
    3. -0: El número 0 en negativo
    4. 0n: El BigInt cero
    5. "": Cadena de texto vacía
    6. null: Un valor nulo
    7. undefined: Un valor no definido
    8. NaN: Un valor que representa "Not a Number"

- Valores truthy:

Cualquier cosa que no sea falsy es truthy:

1. true: Valor booleano verdadero
2. 1: Cualquier numero que no se cero
3. "false": Cualquier cadena de texto que no sea vacia.
4. []: Un arreglo vacio
5. {}: Un objeto vacio
6. function(){}: Cualquier funcion
7. new Date(): Cualquier objeto de fecha
8. 42n: Cualquier BigInt diferente de cero


- Valores nullish:

1. Null
2. Undefined

### Operadores aritméticos:

Con los números, puedes usar los operadores aritméticos para realizar operaciones matemáticas. En JavaScript tenemos los siguientes operadores aritméticos:

+: suma
-: resta
*: multiplicación
/: división
%: módulo (resto de la división)
**: exponente
Al usar los operadores aritméticos, el resultado siempre será un número. Por ejemplo:

2 + 2 // 4
4 - 2 // 2
3 * 2 // 6
2 / 2 // 1
2 % 2 // 0
3 ** 3 // 27

¿Qué significa el // que ves en los ejemplos? Es un comentario. En JavaScript, los comentarios se escriben con // y todo lo que escribas después de // será ignorado por el navegador. Los comentarios son muy útiles para explicar qué hace nuestro código.

Al igual que las matemáticas, las operaciones siguen un orden de precedencia. Por ejemplo, si queremos calcular el resultado de 2 + 2 * 3, primero se multiplicará 2 * 3 y luego se sumará 2 + 6. El resultado será 8.

También puedes usar paréntesis para cambiar el orden de las operaciones.

2 + 2 * 3 // 8
(2 + 2) * 3 // 12

### Cadenas de texto:

La cadena de texto (tipo string) es otro tipo de dato muy común. En JavaScript, las cadenas de texto se representan entre comillas simples, dobles o acentos graves:

'Estás aprendiendo JavaScript'

"JavaScript te va a gustar"

`Esto es una cadena de texto`
Las comillas simples y dobles funcionan igual, pero al usar acentos graves podemos escribir cadenas de texto que ocupen varias líneas:

`Esto es una cadena de texto
que ocupa varias líneas. Puedes escribir
tantas líneas como quieras`
En clases posteriores, veremos cómo funcionan, algunos métodos interesantes y sus diferencias.

### Concatenación:

Para unir dos cadenas de texto, podemos usar el operador +:

'Estás aprendiendo ' + 'JavaScript' // 'Estás aprendiendo JavaScript'
Como ves, el operador + de concatenación de cadenas de texto es visualmente el mismo que el operador + de suma de números. El operador + funciona de forma diferente dependiendo del tipo de dato que estemos usando.

### Booleanos:

Los booleanos representa sólo dos valores: true (verdadero) o false (falso). Por ejemplo:

¿La luz está encendida (true) o apagada (false)?
¿Está lloviendo (true) o no está lloviendo (false)?
¿Está el usuario logueado (true) o no está logueado (false)?
Estos son ejemplos de preguntas que podemos responder con un valor booleano.

true
false

### VARIABLES:

- let:

A la hora de crear programas, es vital poder almacenar la información para poder utilizarla en un futuro. En JavaScript, usamos variables para conseguirlo.

Para crear una variable podemos usar la palabra reservada let y le damos un nombre a la variable. Por ejemplo:

````
let numero;
````

Tenemos una variable llamada numero pero no le hemos asignado ningún valor. Para asignarle un valor, usamos el operador de asignación =:


```
let numero = 1

```



- Constantes const;

Las constantes son variables que no pueden ser reasignadas. Para crear una constante, usamos la palabra reservada const:

EJ:

````
const PI = 3.1415;

````

Como no se pueden reasignar, las constantes siempre deben ser inicializadas con algún valor. Esto es otra diferencia respecto a let, que no es necesario inicializarla con un valor.

- Variables var

En JavaScript, también podemos crear variables usando la palabra reservada var. Es la forma más antigua y es normal que encuentres muchos tutoriales que lo usen. Sin embargo, a día de hoy, no es recomendable usar var ya que tiene comportamientos extraños que pueden causar errores en tu código.

En una clase posterior te explicaré cuál es la diferencia entre let, const y var además de por qué, siempre que puedas, deberías evitar var.


### NULL Y UNDEFINED:

La particularidad de estos dos tipos de datos es que cada uno sólo tiene un valor. El tipo null sólo puede tener el valor null y el tipo undefined sólo puede tener el valor undefined.

- La diferencia entre null y undefined

Mientras que null es un valor que significa que algo no tiene valor, undefined significa que algo no ha sido definido. Por ejemplo, si creamos una variable sin asignarle ningún valor, su valor será undefined:

EJ:

````
let rolloDePapel // -> undefined
````


También podemos asignar directamente el valor undefined a una variable:

EJ:

````
let rolloDePapel = undefined // -> undefined
````

En cambio, para que una variable tenga el valor null, sólo podemos conseguirlo asignándole explícitamente ese valor:

EJ:

```
let rolloDePapel = null
```
