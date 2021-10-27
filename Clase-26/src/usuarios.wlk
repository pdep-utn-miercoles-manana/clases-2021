import suscripciones.prueba

class Usuario {
	var suscripcion
	var plata
	var humor
	
	method actualizarSuscripcion(unaSuscripcion) {
	  suscripcion = unaSuscripcion
	}
	
	method pagarSuscripcion() {
	  if(plata >= suscripcion.costo()) {
	    plata -= suscripcion.costo()
	  } else {
	    self.actualizarSuscripcion(prueba)
	  }
	}
	
  method jugar(unJuego, unasHoras) {
    if(suscripcion.permiteJugar(unJuego)) {
      unJuego.serJugado(self, unasHoras)  
    } else {
      throw new Exception(message = "El juego no pertenece a esa suscripción!")
    }
	}
	
	method reducirHumor(unaCantidad) {
	  humor -= unaCantidad
	}
	
	method aumentarHumor(unaCantidad) {
    humor += unaCantidad
  }
	
	method comprarSkins() {
	  if (plata < 30) throw new Exception(message = "No me alcanza la plata!")
	  
	  plata -= 30
	}
}
