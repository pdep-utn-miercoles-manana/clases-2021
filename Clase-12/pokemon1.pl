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

evolucionaRapido(Pokemon) :-
  evolucion(Pokemon, Nivel, _),
  Nivel < 20.
