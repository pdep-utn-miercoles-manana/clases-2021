class PuedeComer {
	
	// Punto E
	
	method comer(unNinio, unaCantidadDeCaramelos) {
		unNinio.disminuirCaramelos(unaCantidadDeCaramelos)
		if (unaCantidadDeCaramelos > 10) {
			self.cambiarSalud(unNinio)
		}
	}

	method validarComer(unNinio, unaCantidadDeCaramelos) {
		if (unNinio.bolsaDeCaramelos() < unaCantidadDeCaramelos) {
			throw new Exception(message = "No se puede comer esa cantidad de caramelos")
		}
	}

	method cambiarSalud(unNinio)
		
}

object sano inherits PuedeComer {

	// Punto E
	
	override method cambiarSalud(unNinio) {
		unNinio.empachate()
	}

	method actitudPara(unaActitud) {
		return unaActitud
	}
	
}

object empachado inherits PuedeComer {

	// Punto E
	
	override method cambiarSalud(unNinio) {
		unNinio.enfermate()
	}

	method actitudPara(unaActitud) {
		return unaActitud / 2
	}
	
}

object enCama {

	// Punto E
	
	method comer(unNinio, unaCantidadDeCaramelos) {
		// No hace nada
	}

	method validarComer(unNinio, unaCantidadDeCaramelos) {
		throw new Exception(message = "No puede comer porque esta en cama")
	}

	method actitudPara(unaActitud) {
		return 0
	}
	
}