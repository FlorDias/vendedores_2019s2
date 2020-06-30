class Cliente {
	var property vendedor
	
	method clienteInseguro() { return vendedor.esVersatil() and vendedor.esFirme()}
	
	method clienteDeTallista() { return vendedor.cantidadDecertificadoQueEsSobreProductos() >= 3 }
	
	method clienteHumanista() { return vendedor.esPersonaFisica()}

}
