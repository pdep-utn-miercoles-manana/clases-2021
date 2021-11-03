class Pirata {
  const items = []
  var monedas
  var ebriedad
  var quienLoInvito
  
  method esUtilPara(unaMision) {
    return unaMision.esUtil(self)
  }
  
  method tieneAlgunoDe(unosItems) {
    return unosItems.any { unItem => self.tiene(unItem) }
  }
  
  method tienePocoOro() {
    return monedas <= 5
  }
  
  method tiene(unItem) {
    return items.contains(unItem)
  }
  
  method tieneMuchosItems() {
    return items.size() >= 10
  }
  
  method tieneMenosOroQue(unaCantidad) {
    return monedas < unaCantidad
  }
  
  method estaMasEbrioQue(unaCantidad) {
    return ebriedad >= unaCantidad
  }
  
  method estaPasadoDeGrogXD() {
    return self.estaMasEbrioQue(90)
  }
  
  method puedeFormarParteDeLaTripulacionDe(unBarco) {
    return unBarco.puedeAceptar(self)
  }
  
  method ebriedad() {
    return ebriedad
  }
  
  method irAlBar() {
    ebriedad += 5
    monedas -= 1
  }
  
  method items() {
    return items
  }
  
  method monedas() {
    return monedas
  }
  
  method fueInvitadoPor(unTripulante) {
    return quienLoInvito == unTripulante
  }

  method seAnimaASaquearA(unaVictima) {
    return unaVictima.puedeSerSaqueadaPor(self)
  }
}

class EspiaDeLaCorona inherits Pirata {
  override method estaPasadoDeGrogXD() {
    return false
  }

  override method seAnimaASaquearA(unaVictima) {
    return super(unaVictima) && self.tiene("Permiso de la corona")
  }
}
