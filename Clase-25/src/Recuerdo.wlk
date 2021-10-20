class Recuerdo {

	const property descripcion
	const property emocion	
	const property fecha = new Date()
	
	method asentarse(unaPersona) {
		emocion.asentarRecuerdoPara(unaPersona, self)
	}
	
	method esDificilDeExplicar() {
		return self.cantidadDePalabras() > 10
	}
	
	method cantidadDePalabras() {
		return descripcion.words().size()
	}
	
	method sos(unaEmocion) {
		return emocion.equals(unaEmocion)
	}

}
