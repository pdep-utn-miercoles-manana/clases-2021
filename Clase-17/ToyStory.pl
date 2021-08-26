% Relaciona al duenio con el nombre del juguete

duenio(andy, woody, 8).
duenio(sam, jessie, 3).

% Relaciona al juguete con su nombre
% los juguetes son de la forma:
%   deTrapo(tematica)
%   deAccion(tematica, partes)
%   miniFiguras(tematica, cantidadDeFiguras)
%   caraDePapa(partes)

juguete(woody, deTrapo(vaquero)).
juguete(jessie, deTrapo(vaquero)).
juguete(soldados, miniFiguras(soldado, 60)).
juguete(monitosEnBarril, miniFiguras(mono, 50)).
juguete(buzz, deAccion(espacial, [ original(casco) ])).
juguete(seniorCaraDePapa, caraDePapa([ original(pieIzquierdo), original(pieDerecho), repuesto(nariz) ])).

% Dice si un juguete es raro

esRaro(deAccion(stacyMalibu, [sombrero])).

% Dice si una persona es coleccionista
esColeccionista(sam).

%%%%%%%%%%%%%%%
%% Punto 1.a %%
%%%%%%%%%%%%%%%

tematica(Juguete, Tematica) :-
  juguete(_, Juguete), % Para que sea inversible para el juguete.
  tematicaJuguete(Juguete, Tematica).

tematicaJuguete(deTrapo(Tematica), Tematica).
tematicaJuguete(deAccion(Tematica, _), Tematica).
tematicaJuguete(miniFiguras(Tematica, _), Tematica).
tematicaJuguete(caraDePapa(_), caraDePapa).

%%%%%%%%%%%%%%%
%% Punto 1.b %%
%%%%%%%%%%%%%%%

esDePlastico(Juguete) :-
  juguete(_, Juguete),
  esDePlasticoJuguete(Juguete).

esDePlasticoJuguete(miniFiguras(_, _)).
esDePlasticoJuguete(caraDePapa(_)).

%%%%%%%%%%%%%%%
%% Punto 1.c %%
%%%%%%%%%%%%%%%

esDeColeccion(Juguete) :-
  juguete(_, Juguete),
  esDeColeccionJuguete(Juguete).

esDeColeccionJuguete(trapo(_)).

esDeColeccionJuguete(Juguete) :-
  esAccionOCaraDePapa(Juguete),
  esRaro(Juguete).

esAccionOCaraDePapa(caraDePapa(_)).
esAccionOCaraDePapa(accion(_, _)).

%%%%%%%%%%%%%
%% Punto 2 %%
%%%%%%%%%%%%%

amigoFiel(Duenio, NombreJuguete) :-
  jugueteQueNoEsDePlastico(Duenio, NombreJuguete, Anio),
  forall(jugueteQueNoEsDePlastico(Duenio, _, OtroAnio), Anio >= OtroAnio).

jugueteQueNoEsDePlastico(Duenio, NombreJuguete, Anio) :-
  duenio(Duenio, NombreJuguete, Anio),
  juguete(NombreJuguete, Juguete),
  not(esDePlastico(Juguete)).

%%%%%%%%%%%%%
%% Punto 3 %%
%%%%%%%%%%%%%

superValioso(NombreJuguete) :-
  juguete(NombreJuguete, Juguete),
  esDeColeccion(Juguete),
  tieneTodasPiezasOriginales(Juguete),
  not(esDeColeccionista(NombreJuguete)).

tieneTodasPiezasOriginales(Juguete) :-
  forall(pieza(Juguete, Pieza), esOriginal(Pieza)).

esDeColeccionista(NombreJuguete) :-
  duenio(Persona, NombreJuguete, _),
  esColeccionista(Persona).

pieza(Juguete, Pieza) :-
  piezas(Juguete, Piezas),
  member(Pieza, Piezas).

piezas(accion(_, Piezas), Piezas).
piezas(caraDePapa(Piezas), Piezas).

esOriginal(original(_)).

%%%%%%%%%%%%%
%% Punto 4 %%
%%%%%%%%%%%%%

duoDinamico(Duenio, NombreJuguete1, NombreJuguete2) :-
  duenio(Duenio, NombreJuguete1, _),
  duenio(Duenio, NombreJuguete2, _),
  NombreJuguete1 \= NombreJuguete2,
  buenaParejaSimetrico(NombreJuguete1, NombreJuguete2).

buenaParejaSimetrico(Nombre1, Nombre2) :- buenaPareja(Nombre1, Nombre2).
buenaParejaSimetrico(Nombre2, Nombre1) :- buenaPareja(Nombre1, Nombre2).

buenaPareja(woody, buzz).
buenaPareja(Nombre1, Nombre2) :-
  tematicaNombre(Nombre1, Tematica),
  tematicaNombre(Nombre2, Tematica).

tematicaNombre(Nombre, Tematica) :-
  juguete(Nombre, Juguete),
  tematica(Juguete, Tematica).

%%%%%%%%%%%%%
%% Punto 5 %%
%%%%%%%%%%%%%

felicidad(Duenio, FelicidadTotal) :-
  duenio(Duenio, _, _),
  findall(Felicidad, felicidadDuenioPorUnJuguete(Duenio, Felicidad), Felicidades),
  sumlist(Felicidades, FelicidadTotal).

felicidadDuenioPorUnJuguete(Duenio, Felicidad) :-
  duenio(Duenio, NombreJuguete, _),
  juguete(NombreJuguete, Juguete),
  felicidadJuguete(Duenio, Juguete, Felicidad).

felicidadJuguete(_, trapo(_), Felicidad) :-
  felicidadJugueteDeTrapo(Felicidad).

felicidadJuguete(_, miniFiguras(_, Cantidad), Felicidad) :-
  Felicidad is 20 * Cantidad.

felicidadJuguete(_, caraDePapa(Partes), Felicidad) :-
  member(Parte, Partes),
  felicidadSegunParte(Parte, Felicidad).

felicidadJuguete(Duenio, Juguete, 120) :-
  esDeAccionDeColeccionYdeColeccionista(Duenio, Juguete).

felicidadJuguete(Duenio, Juguete, Felicidad) :-
  not(esDeAccionDeColeccionYdeColeccionista(Duenio, Juguete)),
  felicidadJugueteDeTrapo(Felicidad).

esDeAccionDeColeccionYdeColeccionista(Duenio, accion(Tematica, Partes)) :-
  esDeColeccion(accion(Tematica, Partes)),
  esColeccionista(Duenio).

felicidadJugueteDeTrapo(100).

felicidadSegunParte(original(_), 5).
felicidadSegunParte(repuesto(_), 8).

%%%%%%%%%%%%%
%% Punto 6 %%
%%%%%%%%%%%%%

puedeJugarCon(Duenio, NombreJuguete) :-
  duenio(Duenio, NombreJuguete, _).

puedeJugarCon(Duenio, NombreJuguete) :-
  puedePrestarle(OtroDuenio, Duenio),
  puedeJugarCon(OtroDuenio, NombreJuguete).

puedePrestarle(OtroDuenio, Duenio) :-
  cantidadJuguetes(Duenio, Cantidad),
  cantidadJuguetes(OtroDuenio, OtraCantidad),
  OtraCantidad > Cantidad.

cantidadJuguetes(Duenio, Cantidad) :-
  juguetesDe(Duenio, NombresJuguetes),
  length(NombresJuguetes, Cantidad).

juguetesDe(Duenio, NombresJuguetes) :-
  duenio(Duenio, _, _),
  findall(NombreJuguete, duenio(Duenio, NombreJuguete, _), NombresJuguetes).

%%%%%%%%%%%%%
%% Punto 7 %%
%%%%%%%%%%%%%

podriaDonar(Duenio, NombresJuguetes, FelicidadTope) :-
  juguetesDe(Duenio, NombresJuguetes),
  felicidad(Duenio, Felicidad),
  FelicidadTope >= Felicidad.

%%%%%%%%%%%%%
%% Punto 8 %%
%%%%%%%%%%%%%

% Se usa polimorfismo en los siguientes predicados:
%   tematica/2.
%   esDePlastico/1.
%   esDeColeccion/1.
%   pieza/2.
%   felicidad/2.