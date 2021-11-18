class Barrio {

	const ninios = #{}

	// Punto C
	
	method podioNiniosConMasCaramelos() {
		return ninios.sortBy { ninio => ninio.bolsaDeCaramelos() }
	}

	method elementosDeNiniosConMuchosCaramelos() {
		return ninios.filter  { ninio => ninio.tieneMuchosCaramelos() }
					 .flatMap { ninio => ninio.elementos() }
					 .asSet()
	}

}
