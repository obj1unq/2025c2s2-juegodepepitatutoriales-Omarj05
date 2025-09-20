import extras.*

object pepita {
	var energia = 500
	var property position = game.center()
	const property objetivo = nido
	const property cazador = silvestre

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method volar(kms) { energia = energia - 10 - kms }
	
	method energia() { return energia }

	method image() { return "pepita-" + self.estado().nombre() + ".png" }

	method estado() {
		if (position == objetivo.position()) {
			return ganadora
		}
		else if (position == cazador.position()) {
			return perdedora
		}
		else {
			return normal
		}
	}

	method estaEnElNido() { return self.position() == objetivo.position() }

	method mover(direccion) { 
		position = direccion.siguiente(self) 
		self.gastarEnergia()
	}


	method gastarEnergia() { energia = energia - 9 }
}


object ganadora {
	method nombre() { return "grande" }
}

object perdedora {
	method nombre() { return "gris" }
}

object normal {
	method nombre() { return "normal" }
}

