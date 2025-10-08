# Tutorial 2

> Objetivo del nivel: mejorar accionar de las teclas

### Contexto

En este segundo nivel se necesita que pepita gaste energía cada vez que se mueve, es por eso se necesita tener un mayor control sobre qué ocurre cuando se presionan determinadas teclas. Ya están configuradas las teclas de movimiento izquierda y derecha para que Pepita se mueva por el tablero, pero se necesita que además se consuma energía en función de la distancia.

### Requerimientos
- Pepita comienza con energía = 500.
- Configurar las teclas arriba, abajo, izquierda y derecha para que mueva a Pepita a las respectivas posiciones. Pepita debe volar hacia la nueva distancia, y gastará 9 joules de energía por cada kilómetro volado (considerar la distancia entre la posición nueva y la anterior).
- Cuando Pepita agota su energía, no debe poder moverse mas y asu aspecto cambia (se ve gris).

#### Simplificado:
  - La energía de pepita es 500.
  - Cada vez que pepita se mueva (vuele 1 km)   pierde 9 joules de energía.
  - Si pepita agota toda su energia, no se puede mover más y muere.
  - Cada 800 ticks pepita pierde 1 celda de altura sin perder energía ni se va del rango visible.
  - Agregar muros y paredes con colisiones (pepita no puede atravesarlos).

- **BONUS**: 
  - Antes de mover a pepita, controlar que no se vaya del rango visible del juego.
  - Luego de moverse, si se queda sin energía, terminar el juego.
  - Utilizar el evento `onTick` para agregar gravedad, haciendo que pepita pierda altura cada `800` milisegundos, es decir, descienda su coordenada `y` en 1, pero _sin perder energía_.
  - Agregar muros y paredes que pepita no puede atravesar
