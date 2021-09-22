import animos.*
import ciudades.*
import entrenadores.*

object pepita {
	
	var energia = 100
	var animo = normal
	var cantidadDeVecesSeguidasQueVuelaEuforica = 0
	
	const bitacoraDeViaje = [buenosAires]
	
	var property entrenador = roque

	method energia() {
		return energia
	}
	
	method comer(unosGramosDeAlpiste) {
		energia = self.energia() + self.animo().energiaGanadaPorComer(unosGramosDeAlpiste)
		self.animo().hacerDigestion(self)
	}
	
	method volar(unosKilometros) {
		energia = self.energia() - self.energiaNecesariaParaVolar(unosKilometros)
		self.animo().aterrizar(self)
	}
	
	method volarA(unaCiudad) {
		if (self.puedeVolarA(unaCiudad)) {
			self.volar(self.ciudadActual().distanciaA(unaCiudad))
			self.agregarCiudad(unaCiudad)			
		}
	}

	method entrenate() {
		self.entrenador().entrenar(self)
	}
	
	method cantidadCiudadesVisitadas() {
		return self.bitacoraDeViaje().asSet().size()	
	}
			
	method agregarCiudad(unaCiudad) {
		self.bitacoraDeViaje().add(unaCiudad)	
	}
			
	method ciudadDeOrigen() {
		return self.bitacoraDeViaje().first()
	}
	
	method ciudadActual() {
		return self.bitacoraDeViaje().last()
	}
	
	method puedeVolarA(unaCiudad) {
		return self.energia() > self.energiaNecesariaParaVolarA(unaCiudad)
	}
	
	method energiaNecesariaParaVolarA(unaCiudad) {
		return self.energiaNecesariaParaVolar(self.ciudadActual().distanciaA(unaCiudad))
	}
	
	method energiaNecesariaParaVolar(unosKilometros) {
		return self.animo().energiaNecesariaParaVolar(unosKilometros)
	}

	method cansate() {
		self.animo(cansada)
	}
	
	method euforizate() {
		self.animo(euforica)
	}

	method normalizate() {
		self.animo(normal)
	}
	
	method bitacoraDeViaje() {
		return bitacoraDeViaje
	}
	
	method animo() {
		return animo
	}
	
	method animo(unAnimo) {
		animo = unAnimo
		cantidadDeVecesSeguidasQueVuelaEuforica = 0
	}

	method cantidadDeVecesSeguidasQueVuelaEuforica() {
		return cantidadDeVecesSeguidasQueVuelaEuforica
	}

	method incrementarCantidadDeVecesSeguidasQueVuelaEuforica() {
		cantidadDeVecesSeguidasQueVuelaEuforica ++
	}

}

object pepon {
	
	var energia = 50
	var property entrenador = susana
	
	method volar(unosKilometros) {
		energia = energia - unosKilometros * 2
	}

	method comer(unosGramosDeAlpiste) {
		energia = energia + unosGramosDeAlpiste * 3 - 20
	}

	method energia() {
		return energia
	}

	method entrenate() {
		self.entrenador().entrenar(self)
	}
	
}