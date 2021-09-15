object pepita {
	
	var energia = 100
	var ciudadActual = buenosAires
	var animo = normal
	var cantidadDeVecesSeguidasQueVuelaEuforica = 0
	
	method comer(unosGramosDeAlpiste) {
		energia = energia + animo.energiaGanadaPorComer(unosGramosDeAlpiste)
		animo.hacerDigestion(self)
	}
	
	method volar(unosKilometros) {
		energia = energia - self.energiaNecesariaParaVolar(unosKilometros)
		animo.aterrizar(self)
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
	
	method ciudadActual() {
		return ciudadActual
	}
	
	method puedeVolarA(unaCiudad) {
		return self.energia() > self.energiaNecesariaParaVolarA(unaCiudad)
	}
	
	method energiaNecesariaParaVolarA(unaCiudad) {
		return self.energiaNecesariaParaVolar(ciudadActual.distanciaA(unaCiudad))
	}
	
	method energiaNecesariaParaVolar(unosKilometros) {
		return animo.energiaNecesariaParaVolar(unosKilometros)
	}

	method cansate() {
		self.animo(cansada)
	}
	
	method euforizate() {
		self.animo(euforica)
	}

	method normalizate() {
		self.animo(normal)
	}
	
	method animo() {
		return animo
	}
	
	method animo(unAnimo) {
		animo = unAnimo
		cantidadDeVecesSeguidasQueVuelaEuforica = 0
	}

	method cantidadDeVecesSeguidasQueVuelaEuforica() {
		return cantidadDeVecesSeguidasQueVuelaEuforica
	}

	method incrementarCantidadDeVecesSeguidasQueVuelaEuforica() {
		cantidadDeVecesSeguidasQueVuelaEuforica ++
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


object normal {
	method energiaGanadaPorComer(unosGramosDeAlpiste) {
		return unosGramosDeAlpiste * 2
	}
	
	method energiaNecesariaParaVolar(unosKilometros) {
		return 10 + unosKilometros / 8
	}
	
	method hacerDigestion(unaGolondrina) {
		self.cansarSiHayQueCansarse(unaGolondrina)
	}
	
	method aterrizar(unaGolondrina) {
		self.cansarSiHayQueCansarse(unaGolondrina)
	}
	
	method cansarSiHayQueCansarse(unaGolondrina) {
		if (unaGolondrina.energia() < 30) {
			unaGolondrina.cansate()
		}
	}
}

object cansada {
	method energiaGanadaPorComer(unosGramosDeAlpiste) {
		return unosGramosDeAlpiste * 5
	}
	
	method energiaNecesariaParaVolar(unosKilometros) {
		return 40 + unosKilometros
	}

	method hacerDigestion(unaGolondrina) {
		if (unaGolondrina.energia() > 150) {
			unaGolondrina.euforizate()
		}		
	}
	
	method aterrizar(unaGolondrina) {
		
	}
}

object euforica {
	method energiaGanadaPorComer(unosGramosDeAlpiste) {
		return unosGramosDeAlpiste * 100 - 10
	}
	
	method energiaNecesariaParaVolar(unosKilometros) {
		return unosKilometros / 8
	}
	
	method hacerDigestion(unaGolondrina) {
		
	}

	method aterrizar(unaGolondrina) {
		unaGolondrina.incrementarCantidadDeVecesSeguidasQueVuelaEuforica()
		if (unaGolondrina.cantidadDeVecesSeguidasQueVuelaEuforica() >= 3) {
			unaGolondrina.normalizate()
		}
	}	
}
