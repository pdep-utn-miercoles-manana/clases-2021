
object grupoA {
	method puedeDonarleA(unGrupo) {
		return unGrupo.equals(self) or unGrupo.equals(grupoAB)
	}
}

object grupoB {
	method puedeDonarleA(unGrupo) {
		return unGrupo.equals(self) or unGrupo.equals(grupoAB)
	}
}

object grupoAB {
	method puedeDonarleA(unGrupo) {
		return unGrupo.equals(self)
	}	
}

object grupoO {
	method puedeDonarleA(_unGrupo) {
		return true
	}
}

