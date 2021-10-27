object gameflix {
  const juegos = []
  const usuarios = []

  method juegosDeCategoria(unaCategoria) {
    return juegos.filter { unJuego => unJuego.esDeCategoria(unaCategoria) }
  }
  
  method juegoQueSeLlama(unNombre) {
    return juegos.findOrElse({ unJuego => unJuego.seLlama(unNombre) }, { throw new Exception(message = "El juego no existe!") })
  }
  
  method juegoRecomendado() {
    return juegos.anyOne()
  }
  
  method cobrarSuscripciones() {
    usuarios.forEach { unUsuario => unUsuario.pagarSuscripcion() }
  }
}