import Persona.*

class Medico inherits Persona {
	
	var dosis

	method atenderA(unaPersona) {
		unaPersona.atenuar(dosis * 15)
	}

	override method contraer(unaEnfermedad) {
		super(unaEnfermedad)		
		self.atenderA(self)
	}

}

class JefeDeDepartamento inherits Medico {
	
	const subordinados = #{}

	override method atenderA(unaPersona) {
		subordinados.anyOne().atenderA(unaPersona)
	}
	
	method agregarSubordinado(unSubordinado) {
		subordinados.add(unSubordinado)
	}
}
