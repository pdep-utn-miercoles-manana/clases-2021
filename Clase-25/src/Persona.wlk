import Recuerdo.*

class Persona {
	
	const property recuerdosDelDia = []
	const property pensamientosCentrales = #{}
	
	const property procesosMentales = #{}
	
	var property felicidad = 1000
	var emocionDominante
	
	method vivirUnEvento(unEvento) {
		const recuerdo = new Recuerdo(descripcion = unEvento, emocion = emocionDominante)
		self.agregarRecuerdoDelDia(recuerdo)
	}

	method agregarPensamientoCentral(unRecuerdo) {
		pensamientosCentrales.add(unRecuerdo)
	}
	
	method disminuirPorcentajeDeFelicidad(unPorcentaje) {
		felicidad *= 1 - unPorcentaje / 100
		if (felicidad < 1) {
			throw new Exception(message = "La feliciadad no puede ser menor a 1")
		}
	}
	
	method recuerdoRecientes() {
		return recuerdosDelDia.reverse().take(5)
	}
	
	method agregarRecuerdoDelDia(unRecuerdo) {
		recuerdosDelDia.add(unRecuerdo)
	}
	
	method pensamientosCentralesDificilesDeExplicar() {
		return pensamientosCentrales.filter { recuerdo => recuerdo.esDificilDeExplicar() }
	}
	
	method loNiega(unRecuerdo) {
		return emocionDominante.loNiega(unRecuerdo)
	}
	
	method dormir() {
		procesosMentales.forEach { procesoMental => procesoMental.apply(self) }
	}
	
	method asentarTodosLosRecuerdosDelDia() {
		self.recuerdosDelDia().forEach { recuerdo => recuerdo.asentarse(self) }
	}
	
}
