class CentroDeDistribucion {
	var property ciudad
	var property vendedores = []
	
	method agregarVendedor(vendedor) {
		 if ( not vendedores.contais(vendedor)) {
		 	vendedores.add (vendedor)
		 } else {
		 	self.error("Vendedor ya esta registrado para este centro")
		 }
	}
	
	method vendedorEstrella() { return vendedores.max({vendedor => vendedor.puntajeTotalDeCertificados()})}
	
	method puedeCubrir(unaCiudad) { vendedores.any({ vendedor => vendedor.puedeTrabajarEn(unaCiudad)})}
	
	method vendedoresGenericosRegistrados() { vendedores.filter({vendedor => vendedor.tieneCertificadoQueNoEsSobreProductos()})}
	
	method esRobusto() { return self.cantidadDeVendedoresRobustos() >= 3  }
	
	method cantidadDeVendedoresRobustos() { return vendedores.count({vendedor => vendedor.esFirme()})}
	
	method repartirCertificacion (unCentro, unCertificado) {}
	
	
}
