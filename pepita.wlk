import extras.*
import comidas.*

object pepita {
	var energia = 500
	var property position = game.at(7, 7)
	const property objetivo = nido
	const property cazador = silvestre
	var estado = pepitaNormal

	//acciones
	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method volar(kms) { 
		energia = (energia - (9 * kms)).max(0) 
	}
	
	method mover(direccion) {
		self.validarEnergia()
		self.validarSiguientePosicion(direccion)
		position = direccion.siguiente(self)
		self.volar(1)
	}

	method cambiarEstadoDePepitaA(estadoNuevo) { estado = estadoNuevo }

	method aplicarGravedad() {
		if (self.puedeIrALa(abajo)) {
			position = abajo.siguiente(self)
		}
	}
	
	method perderJuego() {
		estado = pepitaPerdedora
		game.say(self, "PERDI!")
		game.schedule(2000, {game.stop()}) 
		}

	method ganarJuego() {
		estado = pepitaGanadora 
		game.say(self, "GANE!")
		game.schedule(2000, {game.stop()})
		game.say(self, "No comi todas las frutas!")
	}

	//consultas

	method image() {
		return "pepita-" + estado.nombre() + ".png"
	}

	method tieneEnergia() {
		return energia > 0
	}

	method haTerminadoElJuego() { return self.haGanado() || self.haPerdido() }
	method haPerdido() { return estado == pepitaPerdedora }
	method haGanado() { return estado == pepitaGanadora }

	method puedeIrALa(direccion) {
		return (self.estaDentroDelMapa(direccion) and (!self.haTerminadoElJuego())) and (self.puedoAtravesar(direccion))
	}

	method puedoAtravesar(direccion) {
		return game.getObjectsIn(direccion.siguiente(self)).all({algo => algo.esAtravesable()})
	}

	method estaDentroDelMapa(direccion) {
		return 
			direccion.siguiente(self).x().between(0, game.width()-1) and
			direccion.siguiente(self).y().between(0, game.height()-1)
	}

	//validaciones
	method validarEnergia() {
		if (!self.tieneEnergia()) {
			self.perderJuego()
		}
	}

	method validarSiguientePosicion(direccion) {
		if (!self.puedeIrALa(direccion)) {
			self.error("No puedo ir a la " + direccion.toString())
		}
	}

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
}

object pepitaGanadora {
	method nombre() { return "ganadora" }
}