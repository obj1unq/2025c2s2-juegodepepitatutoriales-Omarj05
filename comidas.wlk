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

	method esAtravesable() { return true }
}


class Alpiste {
	const property image = "alpiste.png"
	const property position
	const property peso

	method energiaQueOtorga() { return peso } 	

	method chocasteConPepita() {
		pepita.comer(self)
		game.removeVisual(self)
	}

	method esAtravesable() { return true }
}

object comidas {
	var cantidadDeComidaEnElTablero = 0

	method añadirComidaAlAzar() {
		game.onTick(3000, "añadir comida al azar", {
			self.validarCantidadDeComidas()
			cantidadDeComidaEnElTablero += 1
			game.addVisual(self.crearComida())
		})
	}

	method decrementarContador() { cantidadDeComidaEnElTablero -= 1 }

	method crearComida() { //es un factory method
		const factoryElegida = [{alpisteFactory.crear()}, {manzanaFactory.crear()}].anyOne()
		/* Para probabilidad:
			method factoryElegida() {
				const probabilidad = 0.randomUpto(1)

				if (probabilidad.between(0, 0.15)) {
					return {alpisteFactory.crear()}
				}
				else { return {manzanaFactory.apply()} }
			}
		*/

		return factoryElegida.apply()
	}

	method validarCantidadDeComidas() {
		if (cantidadDeComidaEnElTablero == 3) {
			self.error("Hay muchas comidas en el juego.")
		}
	}
}

object alpisteFactory {
	method crear() {
		return new Alpiste(position = randomizer.emptyPosition(), peso = (40 .. 100).anyOne())
	}
}

object manzanaFactory {
	method crear() {
		return new Manzana(position = randomizer.emptyPosition())
	}
}