class EnfermedadInfecciosa {
	
	var cantidadCelulasQueAfecta
	
	method reproducite() {
		cantidadCelulasQueAfecta = cantidadCelulasQueAfecta * 2
	}
	
	method cantidadCelulasQueAfecta() {
		return cantidadCelulasQueAfecta
	}
	
	method afectarA(unaPersona) {
		unaPersona.aumentarTemperatura(cantidadCelulasQueAfecta / 1000)
	}
	
}

class EnfermedadAutoinmune {

	var cantidadCelulasQueAfecta
		
	method cantidadCelulasQueAfecta() {
		return cantidadCelulasQueAfecta
	}
	
	method afectarA(unaPersona) {
		unaPersona.destruirCelulas(cantidadCelulasQueAfecta)
	}
	
}
