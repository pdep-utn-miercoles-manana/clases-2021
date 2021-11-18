class Maquillaje {
	
	// Punto A-1
	
	method susto() {
		return maquillaje.susto()	
	}
	
}

// ¿Por que hago este objeto en lugar que sea un atributo de las instancias de la clase maquillaje?
// Porque me dice que sea igual para todos los maquillajes y además que eventualmente se pueda cambiar.
// Al hacerlo en un objeto global (talbien llamado Well Known Object o WKO para les amigues) es facil hacer
// el cambio y que impacte a todos los maquillajes del sistema.
// Decidí llamar al objeto "maquillaje" ya que su objetivo es solamente tener un susto global 
// para todos los maquillajes. Si surge un mejor nombre pueden usarlo.

object maquillaje {

	// Punto A-1
		
	var property susto = 3
	
}

class TrajeTierno {

	// Punto A-1
		
	method susto() {
		return 2
	}
	
}

class TrajeTerrorifico {

	// Punto A-1
		
	method susto() {
		return 5
	}
	
}

const winniePooh = new TrajeTierno()
const sullivan   = new TrajeTierno()

const jason      = new TrajeTerrorifico()
const georgeBush = new TrajeTerrorifico()
