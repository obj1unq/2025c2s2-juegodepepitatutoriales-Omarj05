import wollok.game.*

object manzana {
	const property image = "manzana.png"
	const property position = game.at(6, 5)
	const base = 5
	var madurez = 1
	
	method energiaQueOtorga() { return base * madurez }
	
	method madurar() { madurez += 1 }

}

object alpiste {
	const property image = "alpiste.png"
	const property position = game.at(6, 6)

	method energiaQueOtorga() { return 20 } 	
}

