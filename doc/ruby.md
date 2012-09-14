Ruby es un lenguage de programación interpretado y no compilado, lo que nos
permite ir ejecutando el código a medida que se va leyendo. Esto permite la
existencia de programas que van leyendo entrada por el teclado y ejecutando el
codigo en ruby on-demand. El interprete que viene con ruby es `irb`, que
podremos usar para jugar con el lenguage:

    4 + 2 #=> 6

Es un lenguage debil y dinamicamente tipado, lo que significa que no hace
falta especificar ningún tipo al declarar variables, y que una variable puede
cambiar de tipo en qualquier momento. Podeis ver las variables como
contenedores de "cosas", cualquier cosa.

    foo = 23
    bar = "Hola mundo"
    foo = "String"

Existen unos pocos tipos básicos de datos, los más comunes que podemos
encontrar en qualquier lenguage:

  - números enteros: 1, 4 -8
  - números de coma flotante: 1.1, -9.6
  - cadenas de texto: "Hola mundo", "Jony officer"
  - cierto o falso: true, false
  - el valor null: nil

Ruby también tiene otro tipo de dato más especial: el símbolo. Se escribe con
dos puntos delante del nombre, por ejemplo: `:estado`, `:color`, `:etiqueta`.
Los simbolos son lo mismo que strings, y como no hay diferencia entre estos
dos tipos de datos, usar uno u otro es sólo una questión de semantica. Los
simbolos deben usarse para describir cosas que no van a cambiar. Por ejemplo
si estamos haciendo un programa que trabaja con motores, el motor puede estar
en uno de dos estados:

    estado = :running
    estado = :sleeping

No hay más opciones posibles para esta variable, o es un valor o es el otro,
asi que usamos simbolos. En cambio el nombre de una persona sería un string.

Ruby tiene una sintaxi muy fácil para definir colecciones y diccionarios
(arrays i hashes). Estos tipos de datos siempre han estado disponibles en
otros lenguages de programación, porque son imprescindibles, pero en ruby
además estan integrados dentro del lenguage y de una forma muy fácil de usar.


    array = [1, 2, 3, "Hola", [ 1, 2], 5.4, 1, 2]

    array[0] #=> 1
    array[1] #=> 2

    array[4] #=> [1, 2]

    array.first #=> 1
    array.last #=> 2

    array.size #=> 8


Los arrays son colecciones de cosas, de qualquier tipo, y pueden tener
elementos repetidos. Se puede acceder a ellos como mostramos en el ejemplo, y
tienen muchos métodos utiles como `size`, `reverse` y otros.


    hash = { "clave" => "valor", "foo" => 89, 23 => 99 }

Los hash son diccionarios no ordenados de claves/valor. Como veis tanto las
claves como los valores de cada par pueden ser qualquier tipo de dato.

    hash["clave"] # => "valor"
    hash[23] # => 99

    hash.keys # => ["clave", "foo", 23]
    hash.values # => ["valor", 89, 99]

Los valores de los hash són accesibles a partir de las llaves en tiempo
constante, y también existen muchos métodos útiles para manipular hashes.


    hash = {:edad => 27, :name => "Roger Campos", :working_at => "Itnig"}

    hash[:edad] # => 27

Aunque podemos usar qualquier cosa como llave de un hash, normalmente usamos
precisamente símbolos como llaves. En el ejemplo anterior usamos un hash para
representar la información de una persona. Esto sería el equivalente a un
Struct en C. Los símbolos son ideales para este uso ya que para referirnos a
la edad de una persona siempre lo haremos con `:edad`.


Podemos definir métodos en ruby con la palabra `def`:

    def sumar(a, b)
      resultado = a + b
      puts resultado
    end

    sumar(2,3) # => 5

Esta función imprime por pantalla la suma de las variables que le pasemos. Los
métodos en ruby se definen sólo por su nombre, no se tienen en cuenta los
argumentos para crear la signatura del método, a diferencia de Java por
ejemplo. También es posible pasar valores por defecto y tener entonces
argumentos opcionales, por ejemplo:

    def sumar(a, b = 5)
      puts a + b
    end

Aquí podremos llamar la funcion con uno o con dos parametros, y si sólo damos
uno el segundo será un 5.

Existe una instrucción de control llamada `return` que, como ya sabreis, nos
sirve para salir de un método y devolver algun valor.

    def devuelve_5
      return 5
    end

    foo = devuelve_5
    puts foo # => 5


Es importante notar que si no se usa `return` en un método, automaticamente
se devuelve el resultado de la última expresión evaluada. En ruby nunca vamos
a ver un `return` como el anterior en ningún sitio, esta característica del
retorno implícito debe ser la mas usada de todos los programas Ruby, y es que
es muy cómoda. El ejemplo anterior se quedaría en esto:

    def devuelve_5
      5
    end

La unica excepción entonces para usar `return` es si queremos, por alguna
razón, salir antes de tiempo del método y no ejecutarlo entero.


Ruby es un lenguage orientado a objetos, así que vamos a empezar ahora
mostrando como definir una clase. Usaremos el ejemplo anterior y haremos una
clase para describir una persona, ahora en vez de hacerlo con un hash será un
objecto de la clase Person.

    class Person
      def initialize(edad, name)
        @edad = edad
        @name = name
      end

      def saludar
        puts "Hola, me llamo #{@name} y tengo #{@edad} años"
      end
    end


    roger = Person.new(27, "Roger")
    roger.saludar # => Hola, me llamo Roger y tengo 27 años


NOTA: Añadir `# encoding: utf-8` al principio del archivo para definir el
encoding del código, ya que usamos una `ñ` en el código.

La sintaxi para definir una clase es con la palabra `class` seguido del nombre
de la clase. El método especial `initialize` es el constructor de la clase
igual como tenemos en java y otros lenguages orientados a objectos, este
método es el que se llama cuando creamos objectos con `Person.new`.

Las variables de instancia en las clases ruby se escriben con una `@` al
principio, en el ejemplo usamos dos variables de instancia para mantener el
estado del objeto persona. Estas variables són internas del objecto y no son
accesibles desde el exterior:


    roger.@edad # => Syntax error
    roger.edad # => Method missing

La clase sólo tiene un método que podemos llamar desde el exterior, que nos
sirve para hacer saludar a la persona. Dentro de este método introducimos dos
nuevos conceptos, primero `puts` nos sirve para imprimir un mensaje por la salida
estandard (STDOUT) igual que un `printf` en C o un `System.out.println("Hello,
World");` en Java. También usamos una sintaxi de ruby para juntar strings
llamada interpolación de strings. Así podemos crear una frase usando las
variables de estado del objeto.


Si queremos hacer visible la variable `edad` de los objectos Person al
exterior, debemos añadir los comúnmente llamados "getters" i "setters":

    class Person
      def edad
        @edad
      end

      def edad=(valor)
        @edad = valor
      end
    end

    roger.edad # => 27
    roger.edad = 32
    roger.edad # => 32

Ahora sí podemos modificar la edad de las personas desde fuera de la clase.
Notad que en Ruby podemos definir metodos como `edad=` que el lenguage
interpretará como una asignación. No es usual tener metodos con nombres como
`get_edad` o `set_edad` ya que el propio lenguage tiene formas mejores de
expresar el mismo significado, es mejor usar el operador de asignación `=`
para dar valores a variables que no inventar-se una forma nueva de hacer lo
mismo.

De hecho en ruby los métodos pueden tener carácteres especiales, por ejemplo
si un método va a devolver `true` o `false`, también es muy usual que el
metodo termine con un signo de interrogación.

    class Person
      def adult?
        @edad >= 18
      end
    end


Acabamos de ver dos claros ejemplos donde Ruby intenta ser un lenguage muy
fácilmente legible. Una persona tiene que ser capaz de entender qué hacer un
codigo Ruby solo con leerlo, sin tener que indagar en complejidades ocultas.
Cuando se usan métodos no tenemos que dudar de qué hace o para qué sirve, y en
ese sentido el nombre `adult?` deja claro que es una pregunta. Si fuera solo
`adult` no estaria tan claro, quizás es un metodo para convertir una persona
en adulto?


En ruby cualquier "cosa" es un objeto de alguna clase. Los objetos
interaccionan entre ellos mediante llamadas a métodos, y todo método devuelve
algun valor (aunque sea nil). Estas son algunas reglas básicas del
funcionamiento del lenguage pero que son realmente una base muy importante.
Podemos demostrar esto con algunos ejemplos:

    roger = Person.new(27, "Roger")
    roger.class # => Person

El método `class` puede llamarse sobre cualquier objeto para conocer de qué
clase es. Veamos que pasa con otros tipos de datos:

    "Hola mundo".class # => String
    42.class # => Fixnum
    nil.class # => NilClass

Y toda, o casi toda interacción entre objetos se realiza mediante llamadas a
métodos. Tanto es así que las operaciones básicas como sumar, por ejemplo,
también són en realidad métodos de la clase Fixnum:

    4 + 1  # => 5

    4.+(1) # => 5

Las dos versiones anterior són equivalentes, tan sólo que en el segundo caso
usamos la version explícita llamando al método "+" (con el punto) con un
argumento (el número 1).


Ruby es un lenguage que explota el principio de "duck typing":

    "Cuando veo un ave que camina como un pato, nada como un pato y suena como un
    pato, a esa ave yo la llamo un pato."

Como el tipado de las variables es débil como hemos visto antes, cualquier
cosa puede actuar como cualquier cosa. Los métodos no se preocupan por el
"tipo" de sus argumentos, simplemente actuan. La operación de sumar entre
Strings por ejemplo está definida, pero también lo esta la multiplicación de
strings. Todo puede funcionar o no según lo que tu quieras. Podríamos definir
el método de suma en la clase Person y hacer que se pudieran sumar personas,
lo que sea que eso signifique.

    "hola" + " mundo" # => hola mundo
    "hola, " * 3      # => hola, hola, hola,

    def sumar(a, b)
      a + b
    end

    sumar(5, 5) # => 10
    sumar("hola", " mundo") # => "hola mundo"

Podemos definir un método que suma los dos argumentos pasados, no importa qué
sean. Esto es un claro ejemplo de la aplicación del "duck typing". Para que el
método de `sumar` funcione tan solo hace falta que el primer argumento pasado
responda al método `+` y nada más. No nos importan los tipos, sino el
comportamiento definido en los objetos.


    class Person
      def +(another_thing)
        puts "Seguro que quieres sumar a #{@name} con #{another_thing} ???"
      end
    end

    roger + "una mesa" # => Seguro que quieres sumar a Roger con una mesa ???


Los métodos dentro de las clases tienen diferentes visibilidades posibles,
igual que en Java tenemos public, protected y private. Los publicos són
llamables desde el exterior, los protected sólo desde dentro de la clase o
subclases y los private sólo dentro de la propia clase.

    class Person

      private

      def some_internal_method
      end
    end


Herencia: En ruby así como en cualquier otro lenguage de programación
orientado a objetos tenemos herencia entre clases. Por ejemplo puedo definir
una nueva clase `Child` a partir de la anterior `Person` así:

    class Child < Person
      def adult?
        false
      end
    end

Las subclases pueden re-definir metodos ya existentes o bien definir nuevos.
No hay herencia múltiple en Ruby, solo podemos heredar de una clase, aunque
existen métodos para conseguir el mismo resultado.


# Operadores basicos en Ruby:

- sumar, restar, dividir, multiplicar, potencia y modulo. Como ya hemos visto
  antes estas operaciones pueden realizarse entre los tipos básicos de datos o
  bien entre objetos si nosotros definimos el comportamiento.

      1 + 1
      4 * 5
      10 / 2
      2 ** 8
      5 % 2

- Logicos: &&, || y !. También pueden usarse sus equivalentes en palabras, es
  decir: and, or y not.

      true || false
      5 || false

  Ruby efectua automaticamente la avaluación de tipos cuando tienen que
  compararse o operar con booleans:


      !2         # => false
      45 && true # => true


- Asignación y asignación abreviada con un operador:

      a = 3
      a += 2 # => 5

  Funciona con todos los operadores anteriores:

      a *= 2  # a = a * 2
      b = false
      a &&= b   # a = a && b
      a ||= b   # a = a || b



# Sentencias de control

- if, elsif, else, end. Lo que todo el mundo conoce, no hace falta poner paréntesis.

    if a > 4
      puts "A mayor que cuatro"
    elsif a > 1
      puts "A es mayor que 1 pero menor o igual a 4"
    else
      puts "O no"
    end

- unless. Ruby tambíen tiene la version contraria al `if`. Esto es otro
  ejemplo de los esfuerzos de ruby por ser más legible y facilmente
  entendible, ya que a menudo la logica se expresa mejor con un `unless
  condition` que con un `if !condition`.

- También es común usar `if` y `unless` en su version 'one-liner' al final de
  una expresión:

    i += 1 if i > 5      # Incrementamos i sólo si es mayor que 5
    i -= 1 unless i < 0  # Decrementamos i sólo si es menor que 0


- loop do; end. Un bucle infinito, no muy práctico la mayoria de las veces,
  sólo para hacer "daemons".

    loop do
      # Mi super código
      break if finished?
    end

- break i next. Cuando se usan dentro de un bucle, `break` nos hará salir del
  bucle y `next` hace que la siguiente iteración empieze inmediatamente, sin
  esperar a terminar el bloque.

- Los métodos pueden ser llamados sin usar paréntesis ya tengan o no
  parámetros. Sólo son obligatorios cuando hay ambiguidad en la sintaxi.


- while(condition) do; end. Ejecuta el código mientras la condición sea
  cierta.

- until(condition) do; end. Lo mismo que la versión anterior pero con la
  logica invertida, ejecuta el código mientras la condición sea falsa.


# Iteradores

Al igual que Java, C++ y otros lenguages Ruby también trabaja con iteradores.
Son una forma fácil de hacer bucles, y es que a la práctica el 95% de
iteraciones que se hacen són usando iteradores. En ruby los iteradores son
trnasparentes al programador, no hay que manipular-los directamente. Podemos
empezar con el ejemplo de un Array que hemos visto al principio:

    foo = [ 1, 2, 3, 4, 5 ]

    foo.each do |x|
      puts "El numero: #{x}"
    end

Esta misma técnica la podemos usar para iterar sobre cualquier coleción de
objetos. El código que escribamos entre el "do" y el "end" será ejecutado por
cada uno de los elementos del array, que nos viene dado en la variable `x`.

Otro ejemplo es este iterador que nos dan los números:

    10.times do |i|
      puts i
    end

Es una manera fácil de tener un bucle que se ejecuta diez veces, i tendrá los
valores del 0 al 9.


# Mucho más

Ruby es mucho más de lo que hemos visto hasta ahora:

- Modulos y mixins
- Blocks y yield
- lambda's y Procs
- Metaprogramacion
- Singleton classes
- Exceptions and handling errors
- Stdlib
