pokemon(bulbasaur, planta).
pokemon(squirtle, agua).
pokemon(charmander, fuego).
pokemon(charmeleon, fuego).
pokemon(charizard, fuego).
pokemon(pikachu, electrico).
pokemon(caterpie, insecto).
pokemon(mew, psiquico).

equipo(ash, pikachu).
equipo(ash, charizard).
equipo(brock, bulbasaur).
equipo(brock, mew).
equipo(fede, caterpie).
equipo(messi, charmander).
equipo(messi, charizard).

entrenador(Entrenador) :-
  equipo(Entrenador, _).  

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

cuantosPokemonHay(Cuantos) :-
  findall(Pokemon, pokemon(Pokemon, _), Pokemones),
  length(Pokemones, Cuantos).

cuantosPokemonHayDeFuego(Cuantos) :-
  findall(Pokemon, pokemon(Pokemon, fuego), Pokemones),
  length(Pokemones, Cuantos).

cuantosPokemonHayDeUnTipo(Tipo, Cuantos) :-
  pokemon(_, Tipo),
  findall(Pokemon, pokemon(Pokemon, Tipo), Pokemones),
  length(Pokemones, Cuantos).

ataqueTotal(Entrenadora, AtaqueTotal):-
  entrenador(Entrenadora),
  findall(Danio, danioDeUnPokemonDeUnEntrenador(Entrenadora, Danio), Danios),
  sumlist(Danios, AtaqueTotal).

danioDeUnPokemonDeUnEntrenador(Entrenador, Danio) :-
  equipo(Entrenador, Pokemon),
  ataque(Pokemon, _, Danio).

entrenadorGroso(Entrenador) :-
  ataqueTotal(Entrenador, Ataque),
  Ataque > 200.

tieneAlMenosTresPokemones(Tipo) :-
  cuantosPokemonHayDeUnTipo(Tipo, Cuantos),
  Cuantos >= 3.

tieneAlMenosDosPokemones(Tipo) :-
  pokemon(Pokemon1, Tipo),
  pokemon(Pokemon2, Tipo),
  Pokemon1 \= Pokemon2.

tieneAlMenosUnPokemon(Tipo) :-
  pokemon(_, Tipo).
