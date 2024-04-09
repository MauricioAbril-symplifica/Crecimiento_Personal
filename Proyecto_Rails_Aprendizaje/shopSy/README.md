# README
Rails es un framework MVC.

Modelo -> Consultas, Validaciones, relaciones
Vista -> Devolver al usuario html,pdf,cdv,json
Controlador -> Lógica

Para crear este proyecto se corrieron los siguientes comandos:

1. rails new shopSy -d postgresql -> Comando para crear el proyecto, el comando opcional o flag -d postgresql es para especificar la base de datos, sino se especifica se crea con sqlite.
2. rails db:create -> Crea las bases de datos
3. rails s -> Es el comando par correr el proyecto en un server local (rails server)
4. rails generate model (Nombre del modelo en singular) (Atributos...):(Tipo de dato)
5. rails db:migrate  -> Migrar las tablas creadas a la base de datos escogida
6. rails c (rails console) -> Abrir la consola de ruby y esto nos permite crear comandos a ejecutar para insertar datos o hacer modificaciones. -> Ejemplo: Modelo.create(atributos...:valor a insertar), Modelo.all (trae todo lo que tenemos en la base de datos con ese modelo)
7. Para generar migraciones se coloca el siguiente comando: rails generate migration (nombre de la migración) se tiene que crear cada vez que modifiquemos algo en la base de datos, luego de hacer la migracion y cambio en los archivos, ejecutar rails db:migrate
8. rails active_storage:install -> Genera una migración (Crea una tabla donde se van a almacenar todas las rutas de los archivos que subamos ( no guardamaos los archvios en nuestra base de datos como tal) sino las rutas donde estan alojados)
9. Para limipiar la base de datos si todavia no tenemos información importante o de pruebas para que la migración no falle se usa este comando: rails db:reset



## CONCEPTOS

#### ROUTER

- En la carpeta Config, en el archivo routes.rb se colocan los metodos y endpoints de la url y hacia que controlador van dirigidos y el metodo index.

EJ:

```
    get '/products', to: 'products#index'
```

#### CONTROLADOR

- Se crea el controlador en la carpeta app/controllers, dentro del archivo se coloca
el siguiente formato:

````
class nombreDelArchivodelControlador(PascalCase) < ApplicationController -> Es decir hereda de ApplicationController

end
````

dentro del controlador se coloca los métodos.

EJ:
```
class EjemploSy < ApplicationController 
    def index
        Logica de lo que se hace
    end
end
```

#### VISTA

- La vista es lo que vamos a devolver al usuario. Se declaran dentro de la carpeta app/views. Se crea un archivo con el nombre del metodo.html.erb -> el . erb es para que acpete sintaxis de ruby. Se coloca la sintaxis para que la vista reconozca la sintaxis ruby de esta manera <%= código ruby %>

 Si <%= (Se coloca el igual) Se imprime, sino no se imprime y se ejecuta por debajo


#### MODELO

- Los modelos van a hacer todo lo relacionado con las bases de datos, como consultas, validaciones, inserciones,relaciones etc..

Se usa el siguiente comando :

```
    rails generate model (Nombre del modelo en singular) (Atributos...):(Tipo de dato)
```
Esto crea una migración para crear la tabla y sus atributos con los cuales se van a manejar los datos.

Tambien crea un modelo dentro de app/models -> se busca el nombre del modelo creado y eso lo crea el modelo que herada de la clase ApplicationRecord -> Libreria de ActiveRecord -> ORM 

Para crear las tablas en nuestra base de datos usamos el siguiente comando:

```
rails db:migrate 
```

 #### PARTIAL

 - Un partial son porciones de html que pueden ser reutilizadas en cualquiera de nuestras vistas. Todos los partials van con barra baja(_) al principio.

 Se colocan en donde se quiere compartir el codigo:  <%= render 'shared/header' %>
 #### GEMA
 Una gema es una libreria de codigo escrito en ruby.

 Se usa en este caso bundle add (nombre de la gema)

 #### TURBO
 Turbo es una herramienta desarrollada por Basecamp que se integra con Ruby on Rails. Turbo agrega funcionalidades avanzadas de interacción enriquecida al motor de Rails, permitiendo construir aplicaciones web modernas y dinámicas sin necesidad de utilizar frameworks de JavaScript complejos.

 Turbo en Rails es una interfaz para trabajar con las funcionalidades de Turbo y aprovechar al máximo las capacidades de interacción enriquecida que ofrece esta herramienta en el desarrollo de aplicaciones web con Rails.

 ## INITIALIZERS
Es código que se va a ejecutar cuando se arranque la aplicación


## CONFIG -> ARCHIVO APPLICATION.RB
- En application.rb se declara toda la configuración de toda nuestra aplicación, desde ahí se declara que idiomas van aser permitidos en nuestra aplicación. 

Se coloca el siguiente comando:

````
    config.i18n.available_locales = [:en, :es];
````
Donde i18n es la abreviatura para la internacionalización. En ruby los dos puntos se utilizan para denotar simbolos.

Todas las traduciones van en la carpeta config/locales y ahi se crea un archivo con el nombre del lenguaje. EJ: es.yml o en.yml

Para usar las traducciones en las vista se usa el siguiente formato:

```
<h2><%= t('.title')%></h2> -> La etiqueta html que renderiza,luego va la sintaxis de rails para mostrar alguna accion, se le coloca la t('.variable') que es la forma en que se sabe que se va a traducir
```
## GENERAR TODO MODELO, VISTA Y CONTROLADOR 
Se puede generar todo esto con un comando.

```
rails generate scaffold NombreDelModelo atributo:tipo de atributo
```
## GENERAR RELACIONES

Se crea una migración, y se coloca despues del nombre de la migración la referencia de la tabla.

EJ:

````
rails generate migra
tion AddCategoryToProducts category:references
````
Luego de crear la migración se usa el comando para hacer los cambios en la base de datos rails db:migrate. Luego vamos a los modelo y colocamos como es la relación.

````
belongs_to :category -> En este caso decimos que un producto pertenece a una categoría

has_many :products, dependent:  :restrict_with_exception -> En este caso el modelo category se dice que tiene varios productos, se coloca una accion que si se borra una categoria lance una excepción
````

## INSTALAR TAILWIND 

Para instalar tailwindcss se corre el siguiente comando:

```
bundle add tailwindcss-rails
rails tailwindcss:install  
```

luego ya para correr el proyecto no usamos rails s sino bin/dev






