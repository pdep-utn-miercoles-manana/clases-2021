// Al igual que el maquillaje, voy a crear un objeto legion que su unica responsabilidad sea
// crear a partir de una coleccion de ninios una legion. Pero antes de crearlo realizar las validaciones
// pertinentes, que de otra manera no es posible dentro de wollok.

object creadorDeLegion {
		
	// Punto B-1
	
	method crear(unosNinios) {
		self.validar(unosNinios)
		return new Legion(integrantes = unosNinios)
	}
	
	method validar(unosNinios) {
		if (unosNinios.size() < 2) {
			throw new Exception(message = "Las legiones deben tener al menos dos integrantes")
		}
	}
}

class Legion {
	
	const property integrantes
	
	// Punto B-2
	
	method asustar(unaPersona) {
		unaPersona.serAsustadaPor(self)
	}
	
	method capacidadDeSusto() {
		return self.integrantes().sum { integrante => integrante.capacidadDeSusto() }
	}
	
	method aumentarCaramelos(unaCantidad) {
		self.lider().aumentarCaramelos(unaCantidad)
	}

	method lider() {
		return self.integrantes().max { integrante => integrante.capacidadDeSusto() }
	}
	
	method esGloton() {
		return false
	}
	
	// Para soportar el Punto B-3 no tenemos que realizar ningún cambio ya que los ninios y las
	// legiones son polimorficas para el flujo de asustar a una persona.
	
}
