object buenosAires {
	
	method kilometroEnRuta() {
		return 0
	}
	
	method distanciaA(unaCiudad) {
		return (self.kilometroEnRuta() - unaCiudad.kilometroEnRuta()).abs()
	}
	
}

object marDelPlata {
	
	method kilometroEnRuta() {
		return 400
	}
	
	method distanciaA(unaCiudad) {
		return (self.kilometroEnRuta() - unaCiudad.kilometroEnRuta()).abs()
	}
	
}

object rosario {
	
	method kilometroEnRuta() {
		return -300
	}
	
	method distanciaA(unaCiudad) {
		return (self.kilometroEnRuta() - unaCiudad.kilometroEnRuta()).abs()
	}
	
}