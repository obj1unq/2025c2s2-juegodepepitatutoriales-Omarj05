import pepita.*

//visuales
object silvestre {
    const property presa = pepita
    method image() { return "silvestre.png" }

    method position() {
        return game.at(presa.position().x().max(3), 0)
    }

    method chocasteConPepita() { pepita.perderJuego() }
}

object nido {
    method position() {  return game.at(8, 8) }

    method image() { return "nido.png" }

    method chocasteConPepita() { pepita.ganarJuego() }
}

object muro1 {
    const property position = game.center()
    const property image = "muro.png"

    method chocasteConPepita() {  }
}

object muro2 {
    const property position = game.center().down(1)
    const property image = "muro.png"

    method chocasteConPepita() {  }
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

