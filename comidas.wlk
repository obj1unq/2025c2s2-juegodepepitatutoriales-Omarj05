import wollok.game.*
import pepita.*
import randomizer.*

class Manzana {
	const property image = "manzana.png"
	const property position
	const base = 5
	var madurez = 1
	
	method energiaQueOtorga() { return base * madurez }
	
	method madurar() { madurez += 1 }

	method chocasteConPepita() {
		pepita.comer(self)
		game.removeVisual(self)
	}
}


class Alpiste {
	const property image = "alpiste.png"
	const property position

	method energiaQueOtorga() { return 20 } 	

	method chocasteConPepita() {
		pepita.comer(self)
		game.removeVisual(self)
	}
}

object comidas {
	var cantidadDeComidaEnElTablero = 0

	method añadirComidaAlAzar() {
		game.onTick(3000, "añadir comida al azar", {
			self.validarCantidadDeComidas()
			cantidadDeComidaEnElTablero += 1
			game.addVisual(self.nuevaComida())
		})
	}

	method nuevaComida() { //es n factory method
		const comida = [new Manzana(position = randomizer.position()), 
						 new Alpiste(position = randomizer.position())].anyOne()


	}

	method validarCantidadDeComidas() {
		if (cantidadDeComidaEnElTablero == 3) {
			self.error("Hay muchas comidas en el juego.")
		}
	}
}
