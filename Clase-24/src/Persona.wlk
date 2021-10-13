class Persona {
	
	const enfermedades = #{}
	
	var grupoSanguineo
	var temperatura
	var cantidadCelulas
	
	method transfundirA(unaPersona, unaCantidad) {
		if (self.puedeTransfundirA(unaPersona, unaCantidad)) {
			self.destruirCelulas(unaCantidad)
			unaPersona.aumentarCelulas(unaCantidad)
		} else {
			throw new Exception(message = "No se puede realizar la transfusión")
		}
	}
	
	method puedeTransfundirA(unaPersona, unaCantidad) {
		return unaPersona.compatibleCon(grupoSanguineo) and self.puedeDonar(unaCantidad)
	}
	
	method compatibleCon(unGrupo) {
		return unGrupo.puedeDonarleA(grupoSanguineo)
	}
	
	method puedeDonar(unaCantidad) {
		return unaCantidad >= 500 and unaCantidad <= cantidadCelulas / 4
	}
	
	method aumentarCelulas(unaCantidad) {
		cantidadCelulas = cantidadCelulas + unaCantidad
	}
	
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
	
	method cantidadDeCelulasAfectadasPorEnfermedadesAgresivas() {
		return self.enfermedadesAgresivas().sum { enfermedad => 
			enfermedad.cantidadCelulasQueAfecta()
		}
	}
	
	method enfermedadesAgresivas() {
		return enfermedades.filter { enfermedad => enfermedad.esAgresiva(self) }
	}
	
	method vivirUnMes() {
		31.times { _n => self.vivirUnDia() }
	}
	
	method atenuar(unaCantidadDeDosis) {
		enfermedades.forEach { enfermedad => 
			self.atenuarYRemoverSiEsNecesario(enfermedad, unaCantidadDeDosis)
		}
	}
	
	method atenuarYRemoverSiEsNecesario(unaEnfermedad, unaCantidadDeDosis) {
		unaEnfermedad.atenuar(unaCantidadDeDosis)
		if (unaEnfermedad.estaCurada()) {
			self.quitarEnfermedad(unaEnfermedad)
		}
	}
	
	method quitarEnfermedad(unaEnfermedad) {
		enfermedades.remove(unaEnfermedad)
	}
}
