class Mision {
  method esUtil(unPirata)
  
  method puedeSerRealizadaPor(unBarco) {
    return unBarco.tieneSuficienteTripulacion() && self.barcoCumpleCondicionExtra(unBarco)
  }
  
  method barcoCumpleCondicionExtra(unBarco)
}

object busquedaDelTesoro inherits Mision {
  override method esUtil(unPirata) {
    return unPirata.tieneAlgunoDe(["brújula", "mapa", "botella de grogXD"]) && unPirata.tienePocoOro()
  }
  
  override method barcoCumpleCondicionExtra(unBarco) {
    return unBarco.algunTripulanteTiene("Llave de cofre")
  }
}

class ConvertirseEnLeyenda inherits Mision {
  const itemObligatorio
  
  override method esUtil(unPirata) {
    return unPirata.tieneMuchosItems() && unPirata.tiene(itemObligatorio)
  }
  
  override method barcoCumpleCondicionExtra(unBarco) {
    return true
  }
}

object monedasDeSaqueo {
  var property cantidad
}

class Saqueo inherits Mision {
  const victima
  
  override method esUtil(unPirata) {
    return unPirata.tieneMenosOroQue(monedasDeSaqueo.cantidad()) && unPirata.seAnimaASaquearA(victima)
  }

  override method barcoCumpleCondicionExtra(unBarco) {
    return victima.esVulnerableA(unBarco)
  }
}
