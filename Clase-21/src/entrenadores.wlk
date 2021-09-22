object susana {
	
	const aves = #{}
	
	method entrenar(unAve) {
		unAve.volar(10)
		unAve.comer(300)
	}
	
	method aves() {
		return aves
	}
	
	method agregarAve(unAve) {
		self.aves().add(unAve)
	}
	
	method quitarAve(unAve) {
		self.aves().remove(unAve)
	}
	
	method cantidadAves() {
		return self.aves().size()
	}
	
	method energiaAves() {
		return self.aves().map { ave => ave.energia() }
	}
	
	method promedioEnergiaAves() {
		return self.energiaAves().sum() / self.cantidadAves()
	}
	
}

object roque {
	
	method entrenar(unAve) {
		unAve.volar(5)
		unAve.comer(200)
		unAve.volar(3)
	}
	
}