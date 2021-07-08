pokemon(bulbasaur, planta).
pokemon(bulbasaur, veneno).
pokemon(ivysaur, planta).
pokemon(venusaur, planta).
pokemon(squirtle, agua).
pokemon(wartortle, agua).
pokemon(blastoise, agua).
pokemon(charmander, fuego).
pokemon(charmeleon, fuego).
pokemon(charizard, fuego).
pokemon(ponyta, fuego).
pokemon(mew, psiquico).
pokemon(mewtwo, psiquico).
pokemon(pikachu, electrico).
pokemon(caterpie, insecto).
pokemon(magikarp, agua).

legendario(mew).
legendario(mewtwo).

superEfectivo(agua, fuego).
superEfectivo(fuego, planta).
superEfectivo(planta, agua).
superEfectivo(veneno, planta).

ganaEnUnaBatalla(PokemonGanador, PokemonPerdedor) :-
  legendario(PokemonGanador),
  pokemon(PokemonPerdedor, _),
  PokemonGanador \= PokemonPerdedor.

ganaEnUnaBatalla(PokemonGanador, PokemonPerdedor) :-
  pokemon(PokemonGanador, TipoGanador),
  pokemon(PokemonPerdedor, TipoPerdedor),
  superEfectivo(TipoGanador, TipoPerdedor).

ganaEnUnaBatalla(squirtle, mewtwo).
ganaEnUnaBatalla(charizard, mewtwo).

evolucion(bulbasaur, 16, ivysaur).
evolucion(ivysaur, 32, venusaur).
evolucion(charmander, 16, charmeleon).
evolucion(charmeleon, 36, charizard).
evolucion(squirtle, 16, wartortle).
evolucion(wartortle, 36, blastoise).
evolucion(pikachu, 21, raichu).

evolucionaRapido(Pokemon) :-
  evolucion(Pokemon, Nivel, _),
  Nivel < 20.

puntos(bulbasaur, 10, 5).
puntos(squirtle, 11, 6).
puntos(charizard, 25, 20).

poderDeUnPokemon(Pokemon, Poder) :-
  puntos(Pokemon, Ataque, Defensa),
  Poder is Ataque + Defensa.

poderDeUnPokemon(mewtwo, 100).
poderDeUnPokemon(mew, 100).

diferenciaEntreEvoluciones(Pokemon, Diferencia) :-
  evolucion(_, PrimeraEvolucion, Pokemon),
  evolucion(Pokemon, SegundaEvolucion, _),
  Diferencia is SegundaEvolucion - PrimeraEvolucion.

equipo(ash, pikachu).
equipo(feli, charmeleon).
equipo(fede, caterpie).
equipo(juli, squirtle).

entrenadorVencible(Entrenador) :-
  equipo(Entrenador, Pokemon),
  pokemonDébil(Pokemon).

pokemonDébil(Pokemon) :-
  pokemon(Pokemon, insecto).

pokemonDébil(Pokemon) :-
  poderDeUnPokemon(Pokemon, Poder),
  Poder < 20.

pokemonDébil(Pokemon) :-
  not(evolucionaRapido(Pokemon)).

