import silvestre.*

object pepita {
	var energia = 500
	var property position = game.center()

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method volar(kms) {
		energia = energia - 10 - kms 
	}
	
	method energia() {
		return energia
	}

	method image() {
		if (self.puedeCapturarAPepita()) {
			return "pepita-gris.png"
		}
		else {
			return "pepita.png"
		}
	}

	method puedeCapturarAPepita() {
		return silvestre.position() == self.position()
	}

	method gastarEnergiaCuandoSeMueve() {
		keyboard.left().onPressDo({ energia = energia - 9})
		keyboard.right().onPressDo({ energia = energia - 9})
		keyboard.up().onPressDo({  energia = energia - 9})
		keyboard.down().onPressDo({ energia = energia - 9})
	}

}


