# Paradigmas de Programación

|Paradigma|Lenguaje            |
|---------|--------------------|
|Funcional|Haskell (GHC)       |
|Lógico   |Prolog (Swi-Prolog) |
|Objetos  |Wollok              |

## ¿Qué es?

### Paradigmas

* Conjunto de ideas o conceptos que dan sentido/forma a algo.
* Forma que la gente percibe algo.
* Conjunto de ideas para solucionar un problema.
* Conjunto de órdenes autoimpuestas por alguien para resolver un problema o encontrar una solución.
* **Marco conceptual**.

### De

* Preposición

### Programación

* Un lenguaje para decirle a la compu qué hacer.
* Codificar un algoritmo.
* Codificar un algoritmo con el fin de solucionar un problema.
* Codificar un algoritmo para que una computadora pueda ejecutarlo.
* **Es el arte de construir un programa computacional para la resolución de un problema**.

### Paradigma de Programación

Es el arte de construir un programa computacional para la resolución de un problema dentro de un marco conceptual.

#### Paradigma Imperativo

* Funciones -> devuelven sí o sí
* Procedimientos -> No devuelve
* Secuencialidad
* Estructuras
* Tipo de datos
* Módulos - Modularización
* Tokens
* Toma de decisiones

### Si quiero ir de Medrano a Campus, ¿qué formas tenemos?

####  Caminando
  1. Salir de Medrano 951
  1. Dirigirse al sur por Av. Medrano hacia Lavalle.
  1. Girar a la derecha con dirección a Lavalle
  1. Continuar por Av. Estado de Israel
  1. Continuar por Av. Angel Gallardo
  1. Girar a la izquierda con dirección a Av. Acoyte
  1. Girar a la derecha con dirección a Dr. Juan Felipe Aranguren
  1. Girar a la izquierda con dirección a Federico García Lorca
  1. Continuar por Emilio Mitre
  1. Girar levemente a la derecha para continuar por Emilio Mitre
  1. Girar a la derecha con dirección a Av. Eva Perón
  1. Girar a la derecha para continuar en Av. Eva Perón. Bordear la rotonda.
  1. Girar a la izquierda hacia Av. Lacarra
  1. Continuar por Av. Lacarra
  1. Girar a la derecha con dirección a Dellepiane Nte.
  1. Girar a la derecha hacia Dellepiane Sur
  1. Girar a la derecha con dirección a Dellepiane Sur
  1. Girar a la derecha con dirección a Mozart
  1. Entrar a Mozart 2300

####  En vehículo motorizado propio
  1. Salir de Medrano 951
  1. Dirigirse al sur por Av. Medrano hacia Lavalle.
  1. Girar a la derecha con dirección a Av. Rivadavia
  1. Girar a la izquierda con dirección a Av. La Plata
  1. Girar a la derecha con dirección a Zuviría
  1. Girar a la izquierda en la 3ª intersección hacia Viel.
  1. Girar a la derecha para acceder a la rampa en dirección a Ruta Nacional 3/Ruta Nacional 5/Ruta Nacional 7/Aerop. Ezeiza/Ruta Nacional 205/Autopista 1
  1. Incorporarse a Au 25 de Mayo
  1. Mantenrse a la izquierda en la bifurcación para permanecer en Au 25 de Mayo y sigue las señales de Autopista Riccheri/Aeropuerto Ezeiza.
  1. Continuar por Au Luis Dellepiane
  1. Tomar la salida hacia Av.Roca/Riachuelo
  1. Girar a la izquierda con dirección a Dellepiane Nte.
  1. Girar a la izquierda con dirección a Av. Escalada
  1. Girar a la izquierda con dirección a Dellepiane Sur
  1. Girar a la derecha con dirección a Mozart
  1. Entrar a Mozart 2300

####  Transporte público (La responsabilidad de saber que trayecto hacer es del conductor)
  1. Salir de Medrano 951.
  1. Dirigirse al sur por Av. Medrano hacia Lavalle.
  1. Girar a la derecha en Rocamora.
  1. Ir a la parada del 145 (ex línea 36).
  1. Subir al bondi.
  1. Pagar el bondi.
  1. Bajarse en la puerta de campus.
  1. Entrar a Mozart 2300.

  * **Motor**: Quién tiene la responsabilidad de saber como hacer las cosas. El conductor en este caso

####  En Uber (La responsabilidad de saber que trayecto hacer es del conductor)
  1. Salir de Medrano 951.
  1. Pedir Uber.
  1. Subir al Uber.
  1. Pagar el Uber.
  1. Bajar del Uber.
  1. Entrar a Mozart 2300.

  * **Motor**: Quién tiene la responsabilidad de saber como hacer las cosas. El conductor en este caso

####  Portal (La responsabilidad de teletrasportarme es del portal)
  1. Salir de Medrano 951.
  1. Meterse al portal
  1. Salir del portal
  1. Entrar a Mozart 2300.

  * **Motor**: El portal

En todos los casos el problema se resolvió, pero depende el paradigma que usemos lo resolvemos de distintas maneras. Delegarle la responsabilidad a un tercero que sepa CÓMO resolver el problema hace que nosotros tengamos que ocuparnos solo de QUÉ problema resolver sin perder el foco en cómo. En este caso ir de Medrano a campus.

### Problema cerca de la solución

```cpp
int[] numerosPares(int[10] unosNumeros) {
  int k = 0
  int a[];
  for (int i = 0 ; i < 10 ; i++) {
    if (unosNumeros[i] % 2 == 0) {
      a[k++] = unosNumeros[i];
    }
  }
  return a;
}
```

```cpp
int[] numerosPares(int[10] unosNumeros) {
  int posicion = 0;
  int pares[];
  for (int i = 0 ; i < 10 ; i++) {
    if (esPar(unosNumeros[i])) {
      int a[] = [12];
      pares[posicion++] = unosNumeros[i];
    }
  }
  return pares;
}

int unNumero = 12;

bool esPar(int unNumero) {
  return unNumero % 2 == 0;
}
```

La segunda se entiende más si la lee un tercero o mi yo del futuro porque tiene mejores nombres. Hace que sea más ***EXPRESIVA***

La segunda, al tener **MENOS detalles algorítmicos** es más ***DECLARATIVA***. Esto se logra **delegando** / modularizando

La primera, al tener **MÁS detalles algorítmicos** es más ***IMPERATIVA***. Hay muchas órdenes, se piensa mucho en como resolver mi problema, perdiendo el foco del problema principal a resolver.


```haskell
numerosPares unosNumeros = filter even unosNumeros
```

Como se ve, es mucho más declarativo ya que no me tengo que encargar de la lógica de filtrado ni de saber si el número es par. Nuevamente teniendo herramientas que me actuén de motor y me abstraigan de CÓMO resolver el problema no perdemos en foco de QUÉ problema resolver. En este caso, filtrar los números pares.