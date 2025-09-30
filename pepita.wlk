import extras.*

object pepita {
	var energia = 100
	var property position = game.at(7, 7)
	const property objetivo = nido
	const property cazador = silvestre
	var estado = pepitaNormal

	//acciones
	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
		game.removeVisual(comida)
	}

	method volar(kms) { 
		energia = (energia - (9 * kms)).max(0) 
	}
	
	method mover(direccion) {
		if (self.puedeMover(direccion)) {
			self.verificarEstado()
			position = direccion.siguiente(self)
		}
		else {
			game.say(self, "Ouch! Me choque!")
		}
	}

	method puedeMover(direccion) {
		return self.hayBordeDelMapa(direccion)
	}

	method hayBordeDelMapa(direccion) {
		return 
			direccion.siguiente(self).x().between(0, game.width()-1) and
			direccion.siguiente(self).y().between(0, game.height()-1)
	}

	method verificarEstado() {
		estado = 
	}

	//consultas

	method image() {
		return "pepita-" + estado.nombre() + ".png"
	}

	method cambiarEstadoDePepitaA(estadoNuevo) { estado = estadoNuevo }

	method haPerdido() { return estado == pepitaPerdedora }
	method haGanado() { return estado == pepitaGanadora }
}

//estados de pepita
object pepitaNormal {
	method nombre() { return "normal" }
}

object pepitaPerdedora {
	method nombre() { return "perdedora" }

	method estado(personaje) {
		return self.nombre()
	}

	method esPepitaPerdedora() {

	}
}

object pepitaGanadora {
	method nombre() { return "ganadora"}
}

object pepitaGrande {
	method nombre() { return "grande" }
}