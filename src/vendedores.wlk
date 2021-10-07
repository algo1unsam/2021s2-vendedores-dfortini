class Vendedor {

	const certificaciones = []

	method esVersatil() = certificaciones.size() >= 3 and self.tieneCertificacionDeProducto() and self.tieneCertificacionQueNoEsDeProducto() 

	method tieneCertificacionDeProducto() = certificaciones.any{ c => c.esDeProducto() }

	method tieneCertificacionQueNoEsDeProducto() = certificaciones.any{ c => !c.esDeProducto() }

	method esInfluyente() = false

}

class Fijo inherits Vendedor {

	var ciudad

	method puedeTrabajarEn(unaCiudad) = unaCiudad == ciudad
	
}

class Viajante inherits Vendedor {

	const provincias = []

	method puedeTrabajarEn(unaCiudad) = provincias.contains(unaCiudad.provincia())

	override method esInfluyente() = provincias.sum({ p => p.poblacion()}) >= 10000000
}

class ComercioCorresponsal inherits Vendedor {

	var ciudades = []

	method puedeTrabajarEn(unaCiudad) = ciudades.contains(unaCiudad)

	override method esInfluyente() = ciudades.size() >= 5 or self.estaEnMuchasProvincias()
	
	method estaEnMuchasProvincias() = ciudades.map { c => c.provincia() }.withoutDuplicates().size() >= 3
}

class Certificacion {

	const puntos
	var property esDeProducto = false

}

