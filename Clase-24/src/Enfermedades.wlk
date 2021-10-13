class Enfermedad {

	var cantidadCelulasQueAfecta

	method cantidadCelulasQueAfecta() {
		return cantidadCelulasQueAfecta
	}

	method atenuar(unaCantidadDeCelulas) {
		cantidadCelulasQueAfecta -= unaCantidadDeCelulas
	}
	
	method estaCurada() {
		return self.cantidadCelulasQueAfecta() <= 0
	}

}


class EnfermedadInfecciosa inherits Enfermedad {

	method reproducite() {
		cantidadCelulasQueAfecta = cantidadCelulasQueAfecta * 2
	}

	method afectarA(unaPersona) {
		unaPersona.aumentarTemperatura(cantidadCelulasQueAfecta / 1000)
	}

	method esAgresiva(unaPersona) {
		return self.cantidadCelulasQueAfecta() > unaPersona.cantidadCelulas() / 10
	}

}

class EnfermedadAutoinmune inherits Enfermedad {

	var cantidadVecesQueAfecto = 0

	method afectarA(unaPersona) {
		unaPersona.destruirCelulas(cantidadCelulasQueAfecta)
		cantidadVecesQueAfecto ++
	}

	method esAgresiva(unaPersona) {
		return cantidadVecesQueAfecto > 30
	}

}

class NuevaEnfermedad inherits Enfermedad {
	
	const infecciosa = new EnfermedadInfecciosa(cantidadCelulasQueAfecta = 100)
	const autoinmune = new EnfermedadAutoinmune(cantidadCelulasQueAfecta = 200)

	method reproducite() {
		infecciosa.reproducite()
	}

	method afectarA(unaPersona) {
		infecciosa.afectarA(unaPersona)
		autoinmune.afectarA(unaPersona)
	}

	method esAgresiva(unaPersona) {
		return infecciosa.esAgresiva(unaPersona) and autoinmune.esAgresiva(unaPersona)
	}
	
}
