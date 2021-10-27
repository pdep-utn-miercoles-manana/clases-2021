object premium {
  const costo = 50
  
  method permiteJugar(unJuego) {
    return true
  }
  
  method costo() {
    return costo
  }
}

object base {
  const costo = 25
  
  method permiteJugar(unJuego) {
    return unJuego.esBarato()
  }
  
  method costo() {
    return costo
  }
}

class SuscripcionCategorica {
  const costo
  const categoria
  
  method permiteJugar(unJuego) {
    return unJuego.esDeCategoria(categoria)
  }
  
  method costo() {
    return costo
  }
}

const prueba = new SuscripcionCategorica(costo = 0, categoria = "Demo")
const infantil = new SuscripcionCategorica(costo = 10, categoria = "Infantil")