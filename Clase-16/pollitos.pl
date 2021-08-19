%%% Punto 1 %%%

gallina(ginger, 10, 5).
gallina(babs, 15, 2).
gallina(mac, 8, 7).
gallina(bunty, 23, 6).
gallina(turuleca, 15, 1).

gallo(rocky, animalDeCirco).
gallo(fowler, piloto).
gallo(oro, arrocero).

rata(nick).
rata(fetcher).

viveEn(delSol, turuleca).
viveEn(delSol, oro).
viveEn(delSol, nick).
viveEn(delSol, fetcher).
viveEn(delSol, rocky).

viveEn(tweedys, ginger).
viveEn(tweedys, babs).
viveEn(tweedys, bunty).
viveEn(tweedys, mac).
viveEn(tweedys, fowler).

granja(Granja) :-
  viveEn(Granja, _).



%%% Punto 2 %%%

puedeCederle(GallinaTrabajadora, GallinaHaragana) :-
  gallina(GallinaTrabajadora, _, 7),
  gallina(GallinaHaragana, _, HuevosHaraganes),
  HuevosHaraganes < 3.



%%% Punto 3 %%%

animalLibre(Animal) :-
  animal(Animal),
  not(viveEn(_, Animal)).

animal(Animal) :-
  gallina(Animal, _, _).

animal(Animal) :-
  gallo(Animal, _).

animal(Animal) :-
  rata(Animal).



%%% Punto 4 %%%
valoracionDeGranja(Granja, ValoracionGranja) :-
  granja(Granja),
  findall(ValoracionAnimal, valoracionDeQuienesVivenEn(Granja, ValoracionAnimal), ValoracionesAnimal),
  sumlist(ValoracionesAnimal, ValoracionGranja).

valoracionDeQuienesVivenEn(Granja, ValoracionAnimal) :-
  viveEn(Granja, Animal),
  valoracionAnimal(Animal, ValoracionAnimal).

valoracionAnimal(Rata, 0) :-
  rata(Rata).

valoracionAnimal(Gallina, Valoracion) :-
  gallina(Gallina, Peso, Huevos),
  Valoracion is Peso * Huevos.

valoracionAnimal(Gallo, 50) :-
  puedeVolar(Gallo).

valoracionAnimal(Gallo, 25) :-
  gallo(Gallo, _),
  not(puedeVolar(Gallo)).

puedeVolar(Gallo) :-
  gallo(Gallo, animalDeCirco).

puedeVolar(Gallo) :-
  gallo(Gallo, piloto).

%% Nota: No lo vimos en clase, pero si miramos con ojo
%% muy fino, hay una mini repetición de lógica cuando
%% hacemos gallo(Gallo, ...) dos veces.
%% Podría resolverse así:

%% puedeVolar(Gallo) :-
%%   gallo(Gallo, Profesion),
%%   profesionVoladora(Profesion).
%%
%% profesionVoladora(animalDeCirco).
%% profesionVoladora(piloto).



%%% Punto 5 %%%

granjaDeluxe(Granja) :-
  granjaPiola(Granja),
  estaLibreDeRatas(Granja).

granjaPiola(Granja) :-
  granja(Granja),
  findall(Animal, viveEn(Granja, Animal), Animales),
  length(Animales, CantidadDeAnimales),
  CantidadDeAnimales > 50.

granjaPiola(Granja) :-
  valoracionDeGranja(Granja, 1000).

estaLibreDeRatas(Granja) :-
  not(hayRatas(Granja)).

hayRatas(Granja) :-
  viveEn(Granja, Rata),
  rata(Rata).

%% Al final de la clase me pidieron resolver
%% estaLibreDeRatas/1 con forall:

%% estaLibreDeRatas(Granja) :-
%%  granja(Granja),
%%  forall(viveEn(Granja, Animal), not(rata(Animal))).



%%% Punto 6 %%%

buenaPareja(Animal, OtroAnimal) :-
  vivenEnLaMismaGranja(Animal, OtroAnimal),
  esBuenaParejaDe(Animal, OtroAnimal).

vivenEnLaMismaGranja(Animal, OtroAnimal) :-
  viveEn(Granja, Animal),
  viveEn(Granja, OtroAnimal),
  Animal \= OtroAnimal.

esBuenaParejaDe(Animal, OtroAnimal) :-
  buenaParejaPorEspecie(Animal, OtroAnimal).

esBuenaParejaDe(Animal, OtroAnimal) :-
  buenaParejaPorEspecie(OtroAnimal, Animal).

buenaParejaPorEspecie(Gallina, OtraGallina) :-
  gallina(Gallina, Peso, _),
  gallina(OtraGallina, Peso, _),
  puedeCederle(Gallina, OtraGallina).

buenaParejaPorEspecie(Gallo, OtroGallo) :-
  puedeVolar(Gallo),
  not(puedeVolar(OtroGallo)).

buenaParejaPorEspecie(Rata, OtraRata) :-
  rata(Rata),
  rata(OtraRata).



%%% Punto 7 %%%

escapePerfecto(Granja) :-
  granja(Granja),
  forall(gallinaQueViveEn(Gallina, Granja), gallinaPonedora(Gallina)),
  forall(viveEn(Granja, Animal), buenaPareja(Animal, _)).

gallinaQueViveEn(Gallina, Granja) :-
  gallina(Gallina, _, _),
  viveEn(Granja, Gallina).
 
gallinaPonedora(Gallina) :-
  gallina(Gallina, _, Huevos),
  Huevos > 5.
