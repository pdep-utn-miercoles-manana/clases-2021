import suscripciones.infantil

class Juego {
	const property nombre
	const precio
	const categoria
	
	method esDeCategoria(unaCategoria) {
	  return categoria == unaCategoria
	}
	
	method seLlama(unNombre) {
	  return nombre == unNombre
	}
	
	method esBarato() {
	  return precio < 30
	}
}

class JuegoViolento inherits Juego {
  method serJugado(unUsuario, horasJugadas) {
    unUsuario.reducirHumor(10 * horasJugadas)
  }
}

class MOBA inherits Juego {
  method serJugado(unUsuario, horasJugadas) {
    unUsuario.comprarSkins()
  }
}

class JuegoTerrorifico inherits Juego {
  method serJugado(unUsuario, horasJugadas) {
    unUsuario.actualizarSuscripcion(infantil)
  }
}

class JuegoEstrategico inherits Juego {
  method serJugado(unUsuario, horasJugadas) {
    unUsuario.aumentarHumor(5 * horasJugadas)
  }
}