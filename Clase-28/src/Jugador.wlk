import Nave.*

class Jugador {
	
	var nivelDeSospecha = 40
	var impugnado = false
	
	const mochila = []
	
	method esSospechoso() {
		return nivelDeSospecha > 50
	}

	method buscarItem(unItem) {
		mochila.add(unItem)
	}
	
	method tieneItem(unItem) {
		return mochila.contains(unItem)
	}
	
	method usarItem(unItem) {
		mochila.remove(unItem)
	}
	
	method aumentarNivelDeSospecha(unaCantidad) {
		nivelDeSospecha += unaCantidad
	}

	method disminuirNivelDeSospecha(unaCantidad) {
		nivelDeSospecha -= unaCantidad
	}
	
	method llamarReunionDeEmergencia() {
		nave.realizarVotacion()
	}
	
	method nivelDeSospecha() {
		return nivelDeSospecha
	}
	
	method noTieneItems() {
		return mochila.isEmpty()
	}
	
	method expulsar() {
		nave.expulsar(self)
		self.avisarANaveParaActualizarContadores()
	}
	
	method impugnarProximoVoto() {
		impugnado = true
	}
	
	method avisarANaveParaActualizarContadores()
}

class Tripulante inherits Jugador {
	
	var personalidad
	
	const tareas
	
	method tieneTodasLasTareasCompletas() {
		return tareas.isEmpty()
	}
	
	method realizarTarea() {
		const tarea = tareas.find { tarea => tarea.puedeSerResueltaPor(self) }
		tarea.realizate(self)
		self.tareaCompletada(tarea)
	}
	
	method tareaCompletada(unaTarea) {
		tareas.remove(unaTarea)
		nave.tareaCompletada()
	}
	
	method votar() {
		if (impugnado) {
			impugnado = false
			return votoEnBlanco
		} else {			
			return personalidad.votar()
		}
	}
	
	override method avisarANaveParaActualizarContadores() {
		nave.perderTripulante()
	}

}

class Impostor inherits Jugador {
	
	method tieneTodasLasTareasCompletas() {
		return true
	}
	
	method realizarTarea() {
		// NO HACE NADA
	}
	
	method sabotear(unSabotaje) {
		self.aumentarNivelDeSospecha(5)
		unSabotaje.realizate()
	}
	
	method votar() {
		return nave.jugadorCualquiera()
	}

	override method avisarANaveParaActualizarContadores() {
		nave.perderImpostor()
	}

}

