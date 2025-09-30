import extras.*
import comidas.*

object pepita {
	var energia = 100
	var property position = game.at(7, 7)
	const property objetivo = nido
	const property cazador = silvestre
	var estado = pepitaNormal
	const property frutasComidas = #{}

	//acciones
	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
		frutasComidas.add(comida)
	}

	method volar(kms) { 
		energia = (energia - (9 * kms)).max(0) 
	}
	
	method mover(direccion) {
		self.validarEnergia()
		if (self.puedeMover(direccion)) {
			position = direccion.siguiente(self)
			self.volar(1)
		}
		else {
			game.say(self, "Ouch! Me choque!")
		}
	}
	
	method muros() { return [muro1, muro2]}

	method cambiarEstadoDePepitaA(estadoNuevo) { estado = estadoNuevo }

	method aplicarGravedad() {
		if (self.puedeMover(abajo)) {
			position = abajo.siguiente(self)
		}
	}
	
	method perderJuego() {
		estado = pepitaPerdedora
		game.say(self, "PERDI!")
		game.onTick(2000, "Pepita pierde el juego", {game.stop()}) //por alguna razon me da error luego de añadir la pared
	}

	method ganarJuego() {
		if (self.heComidoTodasLasFrutas()) {
			estado = pepitaGanadora 
			game.say(self, "GANE!")
			game.onTick(2000, "Pepita gana el juego", {game.stop()}) // lo mismo paasa aqui	
		}
		else { game.say(self, "No comi todas las frutas!")}
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

	method puedeMover(direccion) {
		return (self.hayBordeDelMapa(direccion) and (!self.haTerminadoElJuego())) and (!self.hayPared(direccion))
	}

	method hayPared(direccion) {
		return self.muros().any({ muro => muro.position() == direccion.siguiente(self)})
	}

	method hayBordeDelMapa(direccion) {
		return 
			direccion.siguiente(self).x().between(0, game.width()-1) and
			direccion.siguiente(self).y().between(0, game.height()-1)
	}

	method heComidoTodasLasFrutas() {
		return frutasComidas == self.todasLasFrutasDelJuego()
	}

	method todasLasFrutasDelJuego() {
		return #{alpiste, manzana}
	}

	//validaciones
	method validarEnergia() {
		if (!self.tieneEnergia()) {
			self.perderJuego()
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