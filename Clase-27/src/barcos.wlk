class Barco {
  const tripulantes = []
  var mision
  var capacidad
  
  method puedeSerSaqueadaPor(unPirata) {
    return unPirata.estaPasadoDeGrogXD()
  }
  
  method leEsUtil(unPirata) {
    return unPirata.esUtilPara(mision)
  }
  
  method tieneLugarParaUnoMas() {
    return tripulantes.size() < capacidad
  }
  
  method puedeAceptar(unPirata) {
    return self.tieneLugarParaUnoMas() && self.leEsUtil(unPirata)
  }
  
  method incorporar(unPirata) {
    if (self.puedeAceptar(unPirata)) {
      tripulantes.add(unPirata)
    } else {
      self.error("No puedo aceptar a este pirata!")
    }
  }
  
  method cambiarDeMision(unaMision) {
    mision = unaMision
    self.echarTripulantesInutiles()
  }
  
  method echarTripulantesInutiles() {
    tripulantes.removeAllSuchThat { unTripulante => not self.leEsUtil(unTripulante) }
  }
  
  method pirataMasEbrio() {
    return tripulantes.max { unTripulante => unTripulante.ebriedad() }
  }
  
  method anclarEn(unaCiudad) {
    tripulantes.forEach { unTripulante => unTripulante.irAlBar() }
    tripulantes.remove(self.pirataMasEbrio())
    unaCiudad.sumarHabitante()
  }
  
  method esTemible() {
    return mision.puedeSerRealizadaPor(self)
  }
  
  method algunTripulanteTiene(unItem) {
    return tripulantes.any { unTripulante => unTripulante.tiene(unItem) }
  }
  
  method esVulnerableA(unBarco) {
    return self.cantidadDeTripulantes() <= unBarco.cantidadDeTripulantes() / 2
  }
  
  method cantidadDeTripulantes() {
    return tripulantes.size()
  }
  
  method tripulacionEstaPasadaDeGrogXD() {
    return tripulantes.all { unTripulante => unTripulante.estaPasadoDeGrogXD() }
  }
  
  method tieneSuficienteTripulacion() {
    return self.cantidadDeTripulantes() >= capacidad * 0.9
  }
  
  method cuantosEstanPasadosDeGrogXD() {
    return self.tripulantesPasadosDeGrogXD().size()
  }
  
  method tripulantesPasadosDeGrogXD() {
    return tripulantes.filter { unTripulante => unTripulante.estaPasadoDeGrogXD() }
  }
  
  method cuantosItemsDistintosTienenLosPasadosDeGrogXD() {
    return self.tripulantesPasadosDeGrogXD().map { unTripulante => unTripulante.items() }.withoutDuplicates().size()
  }
  
  method tripulantePasadoDeGrogXDMasAdinerado() {
    return self.tripulantesPasadosDeGrogXD().max { unTripulante => unTripulante.monedas() }
  }
  
  method tripulanteQueInvitoAMasGente() {
    return tripulantes.max { unTripulante => self.cuantaGenteInvito(unTripulante) }
  }
  
  method cuantaGenteInvito(unTripulante) {
    return tripulantes.count { otroTripulante => otroTripulante.fueInvitadoPor(unTripulante) }
  }
}