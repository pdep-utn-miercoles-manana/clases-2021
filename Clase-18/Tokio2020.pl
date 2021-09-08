% Tokyo 2020
%
% Queremos poder representar en Prolog la información relacionada a los Juegos Olímpicos
% Tokyo 2020, los cuales, lógicamente, se desarrollan en Tokyo durante el año 2021.
%
% Los protagonistas de los Juegos son los atletas. Cada atleta tiene un nombre, edad y país que representa,
% y compiten en disciplinas, las cuales pueden ser en equipo, como por ejemplo voleyMasculino, o
% individuales, como lo es natacion400MetrosFemenino.
%
% Es común que algunos atletas compitan en múltiples disciplinas; una atleta podría hacerlo en
% carrera100MetrosLlanosFemenino y carrera400MetrosConVallasFemenino, por ejemplo.
%
% El sueño de cada atleta es lograr obtener una medalla. Queremos poder saber qué medallas (oro, plata y
% bronce) entrega una disciplina. Pero, para saber a quiénes las entrega, hay que considerar si la
% disciplina es individual o en equipo. Por ejemplo, argentina (como equipo) ganó la medalla de bronce
% en voleyMasculino, pero dalilahMuhammad (como atleta individual) se llevó la de plata en
% carrera400MetrosConVallasFemenino.
%
% Finalmente, tenemos información sobre los eventos. Cada evento pertenece a cierta disciplina, cierta
% ronda, y tiene ciertos participantes. Nuevamente, esto depende de la naturaleza de la disciplina. Por
% ejemplo, tanto argentina como paisesBajos participaron en la final de hockeyFemenino, mientras que hubo
% ocho atletas que, individualmente, participaron en la ronda 2 de 100MetrosEspaldaMasculino.
%
% Modelar los atletas, las disciplinas, en cuál compite cada uno, las medallas y los eventos minimizando la
% repetición de lógica y respetando las consideraciones mencionadas. Dar un par de ejemplos incluyendo
% disciplinas individuales y por equipos.
%
% Desarrollar, de forma que los predicados pedidos sean inversibles, respetando los conceptos del paradigma
% lógico:

%%%%%%%%%%%%%%%%%%%%%%%
% Punto 1
%%%%%%%%%%%%%%%%%%%%%%%

% atleta(Atleta, Edad, Pais).
atleta(matiasAle, 39, argentina).
atleta(dalilahMuhammad, 31, estadosUnidos).
atleta(sebastianSole, 30, argentina).
atleta(federicoPereyra, 33, argentina).

% compite(Atleta, Disciplina).
compite(dalilahMuhammad, carrera100MetrosLlanosFemenino).
compite(dalilahMuhammad, carrera400MetrosConVallasFemenino).
compite(sebastianSole, voleyMasculino).
compite(federicoPereyra, voleyMasculino).

% disciplina(Disciplina, Tipo).
disciplina(carrera100MetrosLlanosFemenino, individual).
disciplina(carrera400MetrosConVallasFemenino, individual).
disciplina(voleyMasculino, equipo).

% evento(Ronda, Disciplina, PaisOAtleta).
evento(faseDeGrupos, voleyMasculino, argentina).
evento(cuartosDeFinal, voleyMasculino, argentina).
evento(semiFinal, voleyMasculino, argentina).
evento(tercerPuesto, voleyMasculino, argentina).

evento(ronda1, carrera100MetrosConVallasFemenino, dalilahMuhammad).

evento(ronda1, carrera400MetrosConVallasFemenino, dalilahMuhammad).
evento(ronda2, carrera400MetrosConVallasFemenino, dalilahMuhammad).

% medalla(Medalla, Disciplina, PaisOAtleta).
medalla(bronce, voleyMasculino, argentina).
medalla(plata, carrera100MetrosLlanosFemenino, dalilahMuhammad).
medalla(plata, carrera400MetrosConVallasFemenino, dalilahMuhammad).

%%%%%%%%%%%%%%%%%%%%%%%
% Punto 2
%%%%%%%%%%%%%%%%%%%%%%%

% vinoAPasear/1: se cumple para un atleta que no compite en ninguna disciplina.

vinoAPasear(Atleta) :-
  atleta(Atleta, _, _),
  not( compite(Atleta, _) ).

%%%%%%%%%%%%%%%%%%%%%%%
% Punto 3
%%%%%%%%%%%%%%%%%%%%%%%

% medallasDelPais/3: nos dice en qué disciplinas ganaron medallas cuáles países. Recordar que un país
% puede obtener medallas en disciplinas por equipo o también a través de atletas que lo representen.

medallasDelPais(Medalla, Disciplina, Pais) :-
  medalla(Medalla, Disciplina, PaisOAtleta),
  disciplina(Disciplina, Tipo),
  paisSegunTipoDeDisciplina(Tipo, PaisOAtleta, Pais).

paisSegunTipoDeDisciplina(equipo, Pais, Pais).

paisSegunTipoDeDisciplina(individual, Atleta, Pais) :-
  atleta(Atleta, _, Pais).

%%%%%%%%%%%%%%%%%%%%%%%
% Punto 4
%%%%%%%%%%%%%%%%%%%%%%%

% participoEn/3: relaciona en qué rondas y disciplinas se desempeñó un atleta. Para disciplinas
% individuales, dependerá de en qué eventos estuvo (puede haber participado en las rondas 1 y 2, por ejemplo, pero no haber pasado a la ronda 3); para disciplinas en equipo, se considera que los atletas de
% la disciplina participan siempre que su país participe en la ronda. Por ejemplo, si argentina participa
% en octavosDeFinal de voleyMasculino, todos los atletas argentinos que se desempeñen en voleyMasculino
% participan en esa ronda.

participoEn(Ronda, Disciplina, Atleta) :-
  evento(Ronda, Disciplina, PaisOAtleta),
  atletaSegunDisciplina(Disciplina, PaisOAtleta, Atleta).

atletaSegunDisciplina(Disciplina, PaisOAtleta, Atleta) :-
  disciplina(Disciplina, Tipo),
  compite(Atleta, Disciplina),
  atletaSegunTipoDeDisciplina(Tipo, PaisOAtleta, Atleta).

atletaSegunTipoDeDisciplina(individual, Atleta, Atleta).

atletaSegunTipoDeDisciplina(equipo, Pais, Atleta) :-
  atleta(Atleta, _, Pais).

%%%%%%%%%%%%%%%%%%%%%%%
% Punto 5
%%%%%%%%%%%%%%%%%%%%%%%

% dominio/2: se cumple para un país y una disciplina si todas las medallas en esa disciplina fueron
% entregadas a atletas del mismo país. Naturalmente, esto sólo puede ocurrir en disciplinas individuales.

dominio(Pais, Disciplina) :-
  atleta(_, _, Pais),
  disciplina(Disciplina, individual),
  forall(medalla(_, Disciplina, Atleta), atleta(Atleta, _, Pais)).

%%%%%%%%%%%%%%%%%%%%%%%
% Punto 6
%%%%%%%%%%%%%%%%%%%%%%%

% medallaRapida/1: es verdadero para las disciplinas cuyas medallas se definieron en un evento a ronda
% única.

medallaRapida(Disciplina) :-
  evento(Ronda, Disciplina, _),
  not(otraRondaDistinta(Ronda, Disciplina)).

otraRondaDistinta(Ronda, Disciplina) :-
  evento(OtraRonda, Disciplina, _),
  OtraRonda \= Ronda.

%%%%%%%%%%%%%%%%%%%%%%%
% Punto 7
%%%%%%%%%%%%%%%%%%%%%%%

% noEsElFuerte/2: relaciona a un país con las disciplinas en las que no participó o sólo participó en una
% ronda inicial. En los casos de disciplinas por equipos, esa ronda es faseDeGrupos; en los casos de
% disciplinas individuales, es la ronda 1.

noEsElFuerte(Pais, Disciplina) :-
  atleta(_, _, Pais),
  disciplina(Disciplina, _),
  forall(participoPais(Ronda, Disciplina, Pais), primeraRonda(Ronda, Disciplina)).
  % No es necesario contemplar el caso de que no haya participado un país en ninguna ronda
  % ya que si el antecedente del forall es falso, el forall es verdadero.

participoPais(Ronda, Disciplina, Pais) :-
  participoEn(Ronda, Disciplina, Atleta),
  atleta(Atleta, _, Pais).

primeraRonda(Ronda, Disciplina) :-
  disciplina(Disciplina, Tipo),
  rondaInicialSegunTipo(Ronda, Tipo).

rondaInicialSegunTipo(ronda1, individual).
rondaInicialSegunTipo(faseDeGrupos, equipo).

%%%%%%%%%%%%%%%%%%%%%%%
% Punto 8
%%%%%%%%%%%%%%%%%%%%%%%

% medallasEfectivas/2: nos dice la cuenta final de medallas de cada país. No es simplemente la suma de
% medallas, sino que cada una vale distinto: las de oro suman 3, las de plata 2, y las de bronce 1.

medallasEfectivas(Pais, Total) :-
  atleta(_, _, Pais),
  findall(ValorMedalla, valorMedallaDe(Pais, ValorMedalla), ValoresDeMedallas),
  sumlist(ValoresDeMedallas, Total).

valorMedallaDe(Pais, Valor) :-
  medallasDelPais(Medalla, _, Pais),
  valorMedalla(Medalla, Valor).

valorMedalla(oro, 3).
valorMedalla(plata, 2).
valorMedalla(bronce, 1).

%%%%%%%%%%%%%%%%%%%%%%%
% Punto 9
%%%%%%%%%%%%%%%%%%%%%%%

% laEspecialidad/1: se cumple para los atletas que no vinieron a pasear y obtuvieron medalla de oro o
% plata en todas las disciplinas en las que participaron.

laEspecialidad(Atleta) :-
  atleta(Atleta, _, _),
  not(vinoAPasear(Atleta)),
  forall(compite(Atleta, Disciplina), ganadorEspecial(Disciplina, Atleta)).

ganadorEspecial(Disciplina, Atleta) :-
  medalla(Medalla, Disciplina, PaisOAtleta),
  atletaSegunDisciplina(Disciplina, PaisOAtleta, Atleta),
  esEspecial(Medalla).

esEspecial(oro).
esEspecial(plata).