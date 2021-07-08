padreDe(abe, abbie).
padreDe(abe, homero).
padreDe(abe, herbert).
padreDe(clancy, marge).
padreDe(clancy, patty).
padreDe(clancy, selma).
padreDe(homero, bart).
padreDe(homero, hugo).
padreDe(homero, lisa).
padreDe(homero, maggie).

madreDe(edwina, abbie).
madreDe(mona, homero).
madreDe(gaby, herbert).
madreDe(jacqueline, marge).
madreDe(jacqueline, patty).
madreDe(jacqueline, selma).
madreDe(marge, bart).
madreDe(marge, hugo).
madreDe(marge, lisa).
madreDe(marge, maggie).
madreDe(selma, ling).

tieneHijo(Personaje) :-
  padreDe(Personaje, _).

tieneHijo(Personaje) :-
  madreDe(Personaje, _).

hermanos(Personaje1, Personaje2) :-
  compartenPadre(Personaje1, Personaje2),
  compartenMadre(Personaje1, Personaje2).

mediosHermanos(Personaje1, Personaje2):-
  compartenPadre(Personaje1, Personaje2),
  madreDe(Madre1, Personaje1),
  madreDe(Madre2, Personaje2),
  Madre1 \= Madre2.

mediosHermanos(Personaje1, Personaje2):-
  compartenMadre(Personaje1, Personaje2),
  padreDe(Padre1, Personaje1),
  padreDe(Padre2, Personaje2),
  Padre1 \= Padre2.

compartenMadre(Personaje1, Personaje2) :-
  madreDe(Madre, Personaje1),
  madreDe(Madre, Personaje2),
  Personaje1 \= Personaje2.

compartenPadre(Personaje1, Personaje2):-
  padreDe(Padre, Personaje1),
  padreDe(Padre, Personaje2),
  Personaje1 \= Personaje2.

progenitor(Progenitor, Descendiente):-
  padreDe(Progenitor, Descendiente).

progenitor(Progenitora, Descendiente):-
  madreDe(Progenitora, Descendiente).

abueloMúltiple(Abuelo):-
  nieto(Abuelo, Nieto1),
  nieto(Abuelo, Nieto2),
  Nieto1 \= Nieto2.

nieto(Abuelo, Nieto):-
  progenitor(Abuelo, Personaje),
  progenitor(Personaje, Nieto).

