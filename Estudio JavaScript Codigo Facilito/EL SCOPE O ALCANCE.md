### EL SCOPE O ALCANCE:

- EL SCOPE GLOBAL:

Hace referencias a las variables, funciones y objetos que pueden ser usadas y accedidas desde cualquier parte del código.

No es recomendable tener variables globales, ya que se pueden reasignar en cualquier parte y esto podría traer bugs.

- EL SCOPE LOCAL:

Hace referencias a las variables, funciones y objetos que estan dentro de un bloque es decir este entre {} (o dentro de una función) y solo se pueden usar o ser accedidas si se esta dentro de esta.

NOTA: Siempre declarar las variables con let,const y en el peor de los casos var, porque sino el comportamiento es diferentes para los scopes y puede que siempre sea global.

