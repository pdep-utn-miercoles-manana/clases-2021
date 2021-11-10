object nave {

	var nivelDeOxigeno
	var cantidadTripulantes
	var cantidadImpostores

	const jugadores = #{}
	
	method aumentarNivelDeOxigeno(unaCantidad) {
		nivelDeOxigeno += unaCantidad
	}

	method disminuirNivelDeOxigeno(unaCantidad) {
		nivelDeOxigeno -= unaCantidad
		if (nivelDeOxigeno <= 0) {
			self.ganaronLosImpostores()
		}
	}

	method tareaCompletada() {
		if (self.todosLosJugadoresCompletaronSusTareas()) {
			self.ganaronLosTripulantes()
		}
	}

	method todosLosJugadoresCompletaronSusTareas() {
		return jugadores.all{ jugador => jugador.tieneTodasLasTareasCompletas() }
	}

	method alguienTieneTuboDeOxigeno() {
		return jugadores.any{ jugador => jugador.tieneItem("Tubo de oxigeno") }
	}

	method usarTuboDeOxigeno() {
		const jugador = jugadores.find{ jugador => jugador.tieneItem("Tubo de oxigeno") }
		jugador.usarItem("Tubo de oxigeno")
	}

	method realizarVotacion() {
		const jugadoresVotados = jugadores.map{ jugador => jugador.votar() }
		const masVotado = jugadoresVotados.max{ jugador => jugadoresVotados.occurrencesOf(jugador) }
		masVotado.explusar()
		self.verificarGanador()
	}

	method verificarGanador() {
		self.verificarGanaronTripulantes()
		self.verificarGanaronImpostores()
	}

	method verificarGanaronTripulantes() {
		if (cantidadImpostores == 0) {
			self.ganaronLosTripulantes()
		}
	}
	
	method verificarGanaronImpostores() {
		if (cantidadImpostores == cantidadTripulantes) {
			self.ganaronLosImpostores()
		}
	}
	
	method jugadorNoSospechoso() {
		return jugadores.findOrDefault({ jugador => ! jugador.esSospechoso() }, votoEnBlanco)
	}

	method jugadorMasSospechoso() {
		return jugadores.max { jugador => jugador.nivelDeSospecha() }
	}

	method jugadorSinItems() {
		return jugadores.findOrDefault({ jugador => jugador.noTieneItems() }, votoEnBlanco)
	}
	
	method jugadorCualquiera() {
		return jugadores.anyOne()
	}
	
	method expulsar(unJugador) {
		jugadores.remove(unJugador)
	}
	
	method perderTripulante() {
		cantidadTripulantes--
	}

	method perderImpostor() {
		cantidadImpostores--
	}	

	method ganaronLosTripulantes() {
		throw new Exception(message = "Ganaron los tripulantes")
	}
	
	method ganaronLosImpostores() {
		throw new Exception(message = "Ganaron los impostores")
	}
}

object votoEnBlanco {
	
	method expulsar() {
		// NO HACE NADA
	}
	
}