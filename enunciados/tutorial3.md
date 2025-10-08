# Tutorial 3

> Objetivo de aprendizaje: manejar colisiones

### Contexto
¡Nuestros niveles van tomando onda! Ahora queremos agregar acciones que se ejecuten cuando Pepita colisione con otro objeto. Decimos que se produce una colisión entre dos objetos cuando ambos se encuentran en la misma posición. 
El objetivo del juego en este nivel es que pepita coma toda la comida (la manzana y el alpiste) y luego llegue al nido para terminar el juego. Entonces la idea de colisionar se utilizará para que pepita pueda comer el alimento y para terminar el juego cuando llega al nido.

### Requerimientos
- Cuando Pepita colisiona con Silvestre pierde, por ende debería terminar el juego.
- Cuando Pepita colisiona con una comida la come 
- **BONUS**: Al ganar o perder, que Pepita diga `¡GANE!` o `¡PERDÍ!`, respectivamente, y esperar 2 segundos para terminar el juego.

#### Requerimientos Simplificados
- Si pepita colisiona con silvestre, este pierde diciendo "¡PERDÍ!" y 2s despues acaba el juego.
- Si pepita colisiona con una fruta, se la come recuperando vida.
- Si pepita llega al nido, pepita gana diciendo "¡GANE!" y 2s despues termina el juego.