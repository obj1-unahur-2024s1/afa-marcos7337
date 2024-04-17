

object afa {
	var precioDeEntrada = 10000
	const logisticaDelEvento = 10000000
	var jugador
	var estadio
	var dinero = 100000000
	
	method inflacion(cantidad) {
		precioDeEntrada = precioDeEntrada * (1+(cantidad/100))
	}
	method dinero() = dinero
	method setJugador(nuevoJugador){
		jugador = nuevoJugador
	}
	method setEstadio(nuevoEstadio){
		estadio = nuevoEstadio
	}
	method recibirPago(cantidad){
		dinero += cantidad
	}
	method entradasAVender(){
		return (estadio.capacidad() * jugador.popularidad())
	}
	method gastosDelPartido(){
		return (jugador.viaticos() + estadio.alquiler() + logisticaDelEvento)
	}
	method gananciaBruta(){
		return self.entradasAVender() * precioDeEntrada
	}
	method gananciaNeta(){
		return self.gananciaBruta() - self.gastosDelPartido()
	}
	method venderEntradas(){
		self.recibirPago(self.gananciaBruta())
	}
	method gastar(cantidad){
		dinero = dinero - cantidad
	}
	method realizarPartido(){
		self.venderEntradas()
		self.gastar(self.gastosDelPartido())
		jugador.recibirPago(jugador.viaticos())
	}
	
}

// JUGADORES
object mbappe {
	var viaticos = 0
	var dinero = 1000000
	var edad = 25
	var golesEnFinales = 4
	
	method meterGol() {
		golesEnFinales += 1
	}
	method cumplirAnios() {
		edad += 1
	}
	method dinero() = dinero
	method viaticos() = viaticos
	method setViaticos(nuevoValor){
		viaticos = nuevoValor
	}
	method popularidad() {
		return ((edad * 2) + golesEnFinales) / 100
	}
	method recibirPago(cantidad) {
		dinero += cantidad
	}
}

object ronaldo {
	var viaticos = 0
	var dinero = 1000000
	
	method dinero() = dinero
	method viaticos() = viaticos
	method setViaticos(nuevoValor){
		viaticos = nuevoValor
	}
	method popularidad() {
		return messi.popularidad() / 2
	}
	method recibirPago(cantidad) {
		dinero += cantidad
	}
}

object messi {
	var viaticos = 0
	var dinero = 1000000
	var popularidad = 0.98
	
	method cagadaMediatica() {
		popularidad = (popularidad -0.1).max(0)
	}
	method dinero() = dinero
	method viaticos() = viaticos
	method setViaticos(nuevoValor){
		viaticos = nuevoValor
	}
	method popularidad() = popularidad
	method recibirPago(cantidad) {
		dinero += cantidad
	}
}

// ESTADIOS
object monumental {
	var estadoDeRemodelacion = 60
	
	method avanceDeObras(){
		estadoDeRemodelacion += 10
	}
	method alquiler() = 150000
	method capacidad() {
		return (80000 * (1 - ((100 - estadoDeRemodelacion) / 100)))
	}
		
}

object bombonera {
	method alquiler() = 200000
	method capacidad() = 50000
}
