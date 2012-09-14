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
argumentos para crear la signatura del método, a diferencia que en Java por
ejemplo. También es posible pasar valores por defecto y tener entonces
argumentos opcionales, por ejemplo:

    def sumar(a, b = 5)
      puts a + b
    end

Aquí podremos llamar la funcion con uno o con dos parametros, y si sólo damos
uno el segundo será un 5.


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


    roger.@edat # => Syntax error
    roger.edat # => Method missing

La clase sólo tiene un método que podemos llamar desde el exterior, que nos
sirve para hacer saludar a la persona. Dentro de este método introducimos dos
nuevos conceptos, primero `puts` nos sirve para imprimir un mensaje por la salida
estandard (STDOUT) igual que un `printf` en C o un `System.out.println("Hello,
World");` en Java. También usamos una sintaxi de ruby para juntar strings
llamada interpolación de strings. Así podemos crear una frase usando las
variables de estado del objeto.



Si volem fer-les visibles hem d'escriure nosaltres els metodes adients

class Person def edat @edat end

  def edat=(valor) @edat = valor end end

roger.edat # => 27 roger.edat = 32 roger.edat # => 32

Acabem d'afegir un getter i un setter per l'atribut edat. Noteu com ab ruby
podem definir el metode "edat=" que el llenguatge interpretarà acom auna
asignació. No es gaire comú en ruby fer servir els noms tipics de java com
"get_edat" o "set_edat", ja que el llenguatge ens dona maneres mes expresives
d'aconseguir el mateix resultat.

En ruby els noms dels metodes poden tenir caràcters especials, per exemple si
un metode retorna cert o fals es molt comú que el nom del metode acabi en
interrogant:

class Person def adult?  @edat >= 18 end end

Els ultims son dos exemples de com ruby intenta ser un llenguatge molt
fàcilment llegible, una persona ha de ser capaç de saber que fa el codi ruby
nomes llegint-lo, sense necesitat de indagar en complexitats ocultes. En ruby
els noms de metodes son molt expressius (o ho hauríen de ser).


- En ruby qualsevol cosa és un objecte d'alguna classe, i tots els objectes
  responen a mètodes, i tots els metodes retornen alguna cosa (encara que
  sigui nil).

roger = Person.new(27, "Roger") roger.class # => Person

Tot són objectes, mirem-ho:

"Hello world".class # => String 1.class # => Fixnum


- Es un llenguatge que explota el "duck typing":

"Cuando veo un ave que camina como un pato, nada como un pato y suena como un
pato, a esa ave yo la llamo un pato."

Com que no tenim tipus estrictes com hem vist abans, qualsevol cosa pot ser
considerada qualsevol cosa. La operació de suma entre strings està
implementada, però també la multiplicació. No hi ha "errors" com a tal, només
coses que tu fas que funcionin o no. Podríem definir el metode "+" a la clase
Person d'abans i fariem que es poguesin sumar persones, nosaltres donem el
significat.

"Hola" + " mundo" # => "Hola mundo"

"Hola, " * 3 # => "Hola, Hola, Hola, "

class Person def +(another_thing) puts "Segur que vols sumar el #{@name} amb
#{another_thing} ???" end end

roger + "una taula" # => Segur que vols sumar el Roger amb una taula ???


- Els metòdes dins les clases tenen diferents visibilitats, public, protected
  o privat. Igual que amb  java el significat es el que podeu preveure, public
  son metodes que pot executar tothom desde fora idesde dins, protected només
  son accessibles desde dins la clase o subclases, i private només desde dins
  de la propia clase.

class Person

  # A partir de la paraula private els metodes seràn privats # Per cert,
  comentaris començen amb el caràcter # en la mateixa linia.  private

  def some_internal_method end end



- Herència: A Ruby com a qualsevol altre llenguatge orientat a objectes hi ha
  herència, de manera que jo podria crear aquesta nova clase a partir de
  l'anterior:

class Child < Person def adult?  false end end

No hi ha herència multiple, només podem heredar d'una classe. Subclasses poden
sobreescriure metodes per canviar-ne el comportament, així com definir nous
mètodes.


- Operadors bàsics:

- sumar, resta, divisió, multiplicació, potència, modul, i per més coses
  matemàtiques fer servir Math.sqrt(9) per exemple.
- Lògics: &&, || i !. També es poden utilitzar les versions amb paraules com
  and, or i not.
- Asignació i asignació utilitzant la propia variable:

   a = 3 a += 2 # => 5

   Funciona amb tots els operadors anterior:

   a *= 2  # a = a * 2 b = false   a &&= b   # a = a && b a ||= b   # a = a ||
   b

Com hem dit abans les variables son dinàmicament tipades (conversió entre
tipus automàtica), de manera que si avaluem el numero 2 com a boolean el
resultat serà cert: "!2 # => false", "45 && true # => true"


- Sentències de control:

El mateix que tots coneixeu:

- if, else, end

- unless !! El contrari que if. Aixo es un exemple més dels esforços de ruby
  per ser molt llegible, ja que a vegades la logica s'expresa millor amb un
  "unless something" que amb un "if !something".

- El if i el unless es poden fer servir "inline" escribint-los al final de
  l'expressió:

   i = 5 puts "Executat" if i == 5

- loop do; end. Un bucle infinit, fàcil.

- while(condition) do; end. Executa el bloc mentre la condició sigui certa. En
  la primera iteració ja s'avalua la condicio, de manera que si la condicio es
  falsa el bloc mai s'executarà. En ruby no tenim un "until", que es la versió
  en que el condicional s'avalua després d'executar el codi.

- break i next -> Quan s'executa dins de un bucle, break acabarà el bucle i
  next fara que es continui a partir de la seguent iteració.

- Les crides a mètodes es poden fer amb o sense parèntesis. Només son
  obligatoris quan hi ha ambiguitat de sintaxi.

- return: Serveix per sortir del mètode actual tornant el valor donat. Notar
  que en ruby el retorn es sempre implícit, no cal escriure "return".
  Simplement el metode retornarà l'ultima expresió avaluada dins del seu cos.

def exemple 7 end

exemple # => 7


- Iteradors! Com en java, c++ i altres llenguatges, en ruby també tenim
  iteradors per fer bucles. Pero el seu ús es transparent, no s'han de
  manipular manualment. L'exemple mes clar és iterar sobre un array dels que
  hem vist abans:

foo = [ 1, 2, 3, 4, 5 ]

foo.each do |x| puts "El numero: #{x}" end

Així podem iterar sobre qualsevol colecció d'objectes. El codi que escribim
entre el do i el end serà executat per cada element de l'array, que ens ve
donat a la variable x.

Un altre exemple es aquest:

10.times do |i| puts i end

És una manera fàcil d'executar un bucle un determinat nombre de vegades. També
podem fer-ho sobre una variable:

foo = 6 foo.times do |i| puts i end




I molt més!

- Moduls i mixins
- Blocks i yield
- lambda's i Procs
- Metaprogramació
- Singleton classes
- Exceptions and handling errors
- Stdlib
