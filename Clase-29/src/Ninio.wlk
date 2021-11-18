import Salud.*

class Ninio {
	
	const property elementos = #{}
	
	var actitud
	var bolsaDeCaramelos = 0
	
	var salud = sano
	
	// Punto A-1
	
	method capacidadDeAsustar() {
		return self.sumatoriaSustoElementos() * self.actitud()
	}
	
	method sumatoriaSustoElementos() {
		return self.elementos().sum { elemento => elemento.susto() }
	}

	method actitud() {
		return salud.actitudPara(actitud)
	}

	// Punto A-2
	
	method intentarAsustarA(unaPersona) {
		unaPersona.serAsustadaPor(self)
	}
	
	method aumentarCaramelos(unaCantidad) {
		bolsaDeCaramelos += unaCantidad
	}
	
	method esGloton() {
		return self.bolsaDeCaramelos() > 15
	}
	
	method bolsaDeCaramelos() {
		return bolsaDeCaramelos
	}
	
	// Punto C
	
	method tieneMuchosCaramelos() {
		return self.bolsaDeCaramelos() > 10
	}
	
	// Punto D y E
	
	method comer(unaCantidadDeCaramelos) {
		salud.validarComer(self, unaCantidadDeCaramelos)
		salud.comer(self, unaCantidadDeCaramelos)
	}
	
	method empachate() {
		salud = empachado
	}

	method enfermate() {
		salud = enCama
	}

}
