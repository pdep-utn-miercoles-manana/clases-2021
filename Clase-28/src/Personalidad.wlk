import Nave.*

object troll {
	
	method votar() {
		return nave.jugadorNoSospechoso()
	}
	
}

object detective {
	
	method votar() {
		return nave.jugadorMasSospechoso()
	}
	
}

object materialista {
	
	method votar() {
		return nave.jugadorSinItems()
	}
	
}
