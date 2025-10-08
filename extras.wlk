import pepita.*
import randomizer.*

//visuales
object silvestre {
    const property presa = pepita
    method image() { return "silvestre.png" }

    method position() {
        return game.at(presa.position().x().max(3), 0)
    }

    method chocasteConPepita() { pepita.perderJuego() }

    method esAtravesable() { return true }
}

object nido {
    method position() {  return game.at(8, 8) }

    method image() { return "nido.png" }

    method chocasteConPepita() { pepita.ganarJuego() }

    method esAtravesable() { return true }
}

class Muro {
    const property position = game.center()
    const property image = "muro.png"

    method chocasteConPepita() {  }

    method esAtravesable() { return false }
}

object factoryMuro {
    method crear() { return new Muro(position = randomizer.emptyPosition()) }
}

//direcciones de movimiento para pepita
object derecha {
    method siguiente(personaje) {
        return personaje.position().right(1)
    }
}

object izquierda {
    method siguiente(personaje) {
        return personaje.position().left(1)
    }
}

object arriba {
    method siguiente(personaje) {
        return personaje.position().up(1)
    }
}

object abajo {
    method siguiente(personaje) {
        return personaje.position().down(1)
    }
}

