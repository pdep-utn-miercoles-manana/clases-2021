pokemon(bulbasaur, planta).
pokemon(bulbasaur, veneno).
pokemon(squirtle, agua).
pokemon(charmander, fuego).
pokemon(charizard, fuego).
pokemon(pikachu, electrico).
pokemon(caterpie, insecto).
pokemon(mew, psiquico).

legendario(mew).
legendario(mewtwo).

puntos(bulbasaur, 10, 5).
puntos(squirtle, 11, 6).
puntos(charizard, 25, 20).

poderDeUnPokemon(Pokemon, Poder) :-
  puntos(Pokemon, Ataque, Defensa),
  Poder is Ataque + Defensa.

poderDeUnPokemon(mewtwo, 100).
poderDeUnPokemon(mew, 100).

pokemonDébil(Pokemon) :-
  pokemon(Pokemon, insecto).

pokemonDébil(Pokemon) :-
  poderDeUnPokemon(Pokemon, Poder),
  Poder < 20.

equipo(ash, pikachu).
equipo(ash, charizard).

equipo(brock, bulbasaur).
equipo(brock, mew).

equipo(fede, caterpie).

equipo(messi, charmander).
equipo(messi, charizard).

entrenador(Entrenador) :-
  equipo(Entrenador, _).

tieneTodosPokemonDeFuego(Entrenador) :-
  entrenador(Entrenador),
  forall(equipo(Entrenador, Pokemon), pokemon(Pokemon, fuego)).

todosDebiles(Tipo) :-
  pokemon(_, Tipo),
  forall( pokemon(Pokemon, Tipo), pokemonDébil(Pokemon) ).

entrenadorMalo(Entrenador) :-
  entrenador(Entrenador),
  forall(equipo(Entrenador, Pokemon), not(legendario(Pokemon))).

movimiento(impactrueno, especial(electrico, 20)).
movimiento(voltio,      especial(electrico, 10)).
movimiento(cabezazo,    rapido(50)).
movimiento(coletazo,    potente()).

ataque(Pokemon, Movimiento, Danio):-
  pokemon(Pokemon, _),
  movimiento(Movimiento, TipoMovimiento),
  calcularDanio(Danio, TipoMovimiento, Pokemon).

calcularDanio(100, potente(), _).

calcularDanio(Danio, rapido(Danio), _).

calcularDanio(Danio, especial(Tipo, DanioMovimiento), Pokemon) :-
  pokemon(Pokemon, Tipo),
  Danio is DanioMovimiento + 50.

calcularDanio(Danio, especial(TipoAtaque, DanioMovimiento), Pokemon) :-
  forall(pokemon(Pokemon, TipoPokemon), TipoPokemon \= TipoAtaque),
  Danio is DanioMovimiento + 25.

