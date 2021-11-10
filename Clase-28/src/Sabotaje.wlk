import Nave.*

object reducirOxigeno {
	
	method realizate() {
		if (nave.alguienTieneTuboDeOxigeno()) {
			nave.usarTuboDeOxigeno()
		} else {
			nave.disminuirNivelDeOxigeno(10)
		}
	}	
	
}

class ImpugnarJugador {
	
	const jugador
	
	method realizate() {
		jugador.impugnarProximoVoto()
	}	
	
}
