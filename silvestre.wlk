import pepita.*
object silvestre {

    method image() { return "silvestre.png" }

    method position() {
        if (pepita.position().x().between(0,2)) {
            return game.at(3, 0)
        }
        else { return  game.at(pepita.position().x(), 0) }
    }
}