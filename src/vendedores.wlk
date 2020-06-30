class Certificado {
	var property sobreCantidadDePuntos 
	var property sobreProductos 
	
}

class Vendedor {
	var property certificaciones = []
	
	method darCertificado(unCertificado) { certificaciones.add(unCertificado) }
	
	method puedeTrabajarEn(ciudad)

	method esVersatil() { 
		
		return certificaciones.size() >= 3 and
		self.tieneCertificadoSobreProductos() and
		self.tieneCertificadoQueNoEsSobreProductos()
		
	}
	
	method tieneCertificadoSobreProductos() { return certificaciones.any ({ certificado => certificado.sobreProductos()})}
	
	method tieneCertificadoQueNoEsSobreProductos() { return certificaciones.any ({ certificado => not certificado.sobreProductos()}) }
	
	method cantidadDecertificadoQueEsSobreProductos() { return certificaciones.count ({ certificado => certificado.sobreProductos()}) }

	method esFirme() { return self. puntajeTotalDeCertificados() >= 30}
	
	method puntajeTotalDeCertificados() { return certificaciones.sum ({ certificado => certificado.sobreCantidadDePuntos()})}

	method vendedorInfluyente() 
	
	method tieneAfinidadConCentro(centro) { return self.puedeTrabajarEn(centro.ciudad())}
	
	method vendedorCandidato() { return self.esVersatil() and self.tieneAfinidadConCentro(self)}
	
	method esPersonaFisica()

}


class VendedorFijo inherits Vendedor {
	var property ciudadOrigen
	
	override method puedeTrabajarEn(ciudad) { return ciudadOrigen == ciudad }
	
	override method vendedorInfluyente() { return  false }

	override method esPersonaFisica() { return true }
}

class VendedorViajante inherits Vendedor {
	var property provincias = #{}
	
	method habilitarEnProvincia(unaProvincia) { provincias.add(unaProvincia) }
	
	method deshabilitarEnProvincia(unaProvincia) { provincias.remove(unaProvincia) }
	
	method provinciaATrabajar(provincia) { provincias.add(provincia)}
	
	override method puedeTrabajarEn(ciudad) { return provincias.any({prov => prov == ciudad.provincia()})}

	override method vendedorInfluyente() { return self.poblacionTotal() >= 10000000}
	
	method poblacionTotal () { return provincias.sum({ prov => prov.poblacion()})}

	override method esPersonaFisica() { return true }

}

class ComercioCorresponsal inherits Vendedor {
	var property ciudades = #{}
	
	method ponerSucursalEn(ciudad) { ciudades.add(ciudad) }
	
	method ponerSucursalesEn(conjuntoDeCiudades) { ciudades.addAll(conjuntoDeCiudades) }
	
	override method puedeTrabajarEn(unaCiudad) { return ciudades.any({ciudad => ciudad == unaCiudad})}
	
	override method vendedorInfluyente() { return self.cantidadDeCiudades() >= 5 and self.cantidadProvinciasConSucursal() >= 3 }
	
	method cantidadDeCiudades() { return ciudades.size() }
	
	method cantidadProvinciasConSucursal() {	
		const provincias = #{}
		provincias.addAll(ciudades.map({ciudad => ciudad.provincia()}))
		return provincias.size()
	}

//	override method tieneAfinidadConCentro(centro) { return super() and ciudades.any({ciudad => not centro.puedeCubrir(ciudad)})}
	
	override method esPersonaFisica() { return false }
	
}