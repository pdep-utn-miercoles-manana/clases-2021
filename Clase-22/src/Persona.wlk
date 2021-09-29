class Persona {
	
	const enfermedades = #{}
	
	var temperatura
	var cantidadCelulas
	
	method contraer(unaEnfermedad) {
		enfermedades.add(unaEnfermedad)
	}
	
	method tieneEnfermedad(unaEnfermedad) {
		return enfermedades.contains(unaEnfermedad)
	}
	
	method vivirUnDia() {
		enfermedades.forEach { enfermedad => enfermedad.afectarA(self) }
	}
	
	method enfermedadQueMasAfecta() {
		return enfermedades.max { enfermedad => enfermedad.cantidadCelulasQueAfecta() }       
	}
	
	method aumentarTemperatura(unosGradosCelsius) {
		temperatura = 45.min(temperatura + unosGradosCelsius)
	}
	
	method destruirCelulas(unasCelulasAmenazadas) {
		cantidadCelulas = cantidadCelulas - unasCelulasAmenazadas
	}
	
	method cantidadCelulas() {
		return cantidadCelulas
	}

	method temperatura() {
		return temperatura
	}
	
	method estaEnComa() {
		return 45 == self.temperatura() || self.cantidadCelulas() < 1000000
	}
}
