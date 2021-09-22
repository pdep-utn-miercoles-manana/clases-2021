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
