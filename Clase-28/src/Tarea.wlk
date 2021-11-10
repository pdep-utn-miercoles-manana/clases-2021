import Nave.*

class Tarea {

	const itemsNecesarios

	method puedeSerResueltaPor(unJugador) {
		return itemsNecesarios.all { item => unJugador.tieneItem(item) }
	}

	method realizate(unJugador) {
		self.completate(unJugador)
		itemsNecesarios.forEach { item => unJugador.usarItem(item) }
	}

	method completate(unJugador)
}

object arreglarTableroElectrico inherits Tarea(itemsNecesarios = ["Llave inglesa"]) {

	override method completate(unJugador) {
		unJugador.aumentarNivelDeSospecha(10)
	}

}

object sacarLaBasura inherits Tarea(itemsNecesarios = ["Bolsa de consorcio", "Escoba"]) {

	override method completate(unJugador) {
		unJugador.disminuirNivelDeSospecha(4)
	}

}

object ventilarLaNave inherits Tarea(itemsNecesarios = []) {

	override method completate(unJugador) {
		nave.aumentarNivelDeOxigeno(5)
	}

}
