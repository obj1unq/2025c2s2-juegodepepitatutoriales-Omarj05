import extras.*

object pepita {
	var energia = 100
	var property position = game.at(7, 7)
	const property objetivo = nido
	const property cazador = silvestre

	//acciones
	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
		game.removeVisual(comida)
	}

	method volar(kms) { 
		energia = (energia - (9 * kms)).max(0) 
	}
	
	method mover(direccion) { 
		if (!self.hayMuroEnDireccion(direccion)) {
			self.validarEnergia()
			position = direccion.siguiente(self) 
			self.volar(1)
		}
		else {
			game.say(self, "Hay un muro adelante.")
		}
	}

	method perderAltura()  { 
		if (!self.hayMuroEnDireccion(abajo)) {
			position = game.at(position.x(), position.down(1).y().max(0)) 
		}
	}

	method perderJuego() {
		game.say(self, "¡PERDÍ!")
		game.onTick(2000, "Perder juego", {game.stop()})
	}

	method ganarJuego() {
		game.say(self, "GANÉ!")
		game.onTick(2000, "Ganar juego", {game.stop()})
	}

	//consultas
	method energia() { return energia }

	method image() { return "pepita-" + self.estado().nombre() + ".png" }

	method estado() {
		if (self.estaEnElObjetivo()) {
			return ganadora
		}
		else if (self.esPepitaFallecida()) {
			return perdedora
		}
		else {
			return normal
		}
	}

	method estaEnElObjetivo() { return position == objetivo.position() }

	method esPepitaFallecida() {
		return self.esAtrapadaPorElCazador() || self.seQuedoSinEnergia()
	} 

	method esAtrapadaPorElCazador() {
		return position == cazador.position()
	}

	method seQuedoSinEnergia() {
		return energia == 0
	}

	method hayMuroEnDireccion(direccion) {
		return direccion.siguiente(self) == muro.position()
	}

	//validaciones
	method validarEnergia() {
		if (self.seQuedoSinEnergia()) {
			self.perderJuego()
		}
	}
}

//estados de pepita
object ganadora {
	method nombre() { return "grande" }
}

object perdedora {
	method nombre() { return "gris" }
}

object normal {
	method nombre() { return "normal" }
}
