# Tutorial 1

> Objetivo del nivel: familiarizarse con el framework

### Contexto
Pepita es una golondrina que puede moverse libremente por el juego. Su objetivo es llegar al nido, es por eso que se muestra más grande al llegar a él. Para lograrlo debe evitar a Silvestre, un gato que está atento a sus pasos desde el piso.

### Requerimientos Simplificados:
- Pepita pueda moverse por el tablero (dentro de los limites). 
- Añadir nido.
- Pepita se hace grande cuando colisiona con el nido. (no usar onCollideDo).
- Añadir a Silvestre que se mueve en la misma direccion que el desde el suelo (salvo los primeros 3 casilleros del eje x).


### Requerimientos
- Hacer que Silvestre persiga a Pepita. Silvestre siempre se mueve a la altura del piso, pero va persiguiendo a Pepita hacia los lados, según donde ella se mueva.
- Hacer que Pepita se vea gris al ser atrapada por Silvestre. Esto es, que se muestre con la imagen `pepita-gris` al estar en la misma posición que Silvestre.
- **BONUS**: Silvestre no puede estar a la izquierda del eje x = 3, siendo éste el mínimo valor de x permitido para la posición de Silvestre.
