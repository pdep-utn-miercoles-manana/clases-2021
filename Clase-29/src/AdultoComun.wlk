class AdultoComun {

	var cantidadDeSustosPorGlotones

	// Punto A-2
	
	method serAsustadaPor(unAsustador) {
		if (self.teAsusta(unAsustador)) {
			self.asustarsePor(unAsustador)
		}
	}

	method teAsusta(unAsustador) {
		return self.tolerancia() < unAsustador.capacidadDeSusto()
	}

	method tolerancia() {
		return 10 * cantidadDeSustosPorGlotones
	}

	method asustarsePor(unAsustador) {
		unAsustador.aumentarCaramelos(self.caramelosParaDar())
		self.aumentarSustosPorGlotones(unAsustador)
	}

	method caramelosParaDar() {
		return self.tolerancia() / 2
	}

	method aumentarSustosPorGlotones(unAsustador) {
		if (unAsustador.esGloton()) {
			cantidadDeSustosPorGlotones++
		}
	}

}

class Abuelo inherits AdultoComun {

	// Punto A-2
	
	override method teAsusta(unAsustador) {
		return true
	}

	override method caramelosParaDar() {
		return super() / 2
	}

}

class AdultoNecio {

	// Punto A-2
	
	method loAsusta(unAsustador) {
		return false
	}

	method caramelosParaDar() {
		return 0
	}

}

