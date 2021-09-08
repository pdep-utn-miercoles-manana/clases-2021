object pepita {
	
	var energia = 100
	var ciudadActual = buenosAires
	
	method comer(unosGramosDeAlpiste) {
		energia = energia + unosGramosDeAlpiste * 2
	}
	
	method volar(unosKilometros) {
		energia = energia - self.energiaNecesariaParaVolar(unosKilometros) 
	}
	
	method volarA(unaCiudad) {
		if (self.puedeVolarA(unaCiudad)) {
			self.volar(ciudadActual.distanciaA(unaCiudad))
			ciudadActual = unaCiudad			
		}
	}
	
	method energia() {
		return energia
	}
	
	method puedeVolarA(unaCiudad) {
		return self.energia() > self.energiaNecesariaParaVolarA(unaCiudad)
	}
	
	method energiaNecesariaParaVolarA(unaCiudad) {
		return self.energiaNecesariaParaVolar(ciudadActual.distanciaA(unaCiudad))
	}
	
	method energiaNecesariaParaVolar(unosKilometros) {
		return 10 + unosKilometros / 8
	}

}

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
