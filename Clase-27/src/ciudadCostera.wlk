class CiudadCostera {
  var cantidadDeHabitantes
  
  method puedeSerSaqueadaPor(unPirata) {
    return unPirata.estaMasEbrioQue(50)
  }
  
  method sumarHabitante() {
    cantidadDeHabitantes += 1
  }
  
  method esVulnerableA(unBarco) {
    return unBarco.cantidadDeTripulantes() >= cantidadDeHabitantes * 0.4 || unBarco.tripulacionPasadaDeGrogXD()
  }
}