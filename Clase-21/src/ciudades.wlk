class Ciudad {
	const kilometroEnRuta
	
	method kilometroEnRuta() {
		return kilometroEnRuta
	}
	
	method distanciaA(unaCiudad) {
		return (self.kilometroEnRuta() - unaCiudad.kilometroEnRuta()).abs()
	}
}

const buenosAires = new Ciudad(kilometroEnRuta = 0)
const marDelPlata = new Ciudad(kilometroEnRuta = 400)
const rosario     = new Ciudad(kilometroEnRuta = -300)
const tandil      = new Ciudad(kilometroEnRuta = 560)