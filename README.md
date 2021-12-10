# (Título a definir)
Presentación del proyecto final de POO.
--
Esta aplicación es similar una calculadora especializada que evalúa mediante la lectura de etiquetas y lenguaje sintáctico semejante a LaTex; luego devuelve el resultado como un valor numérico y da la opción para guardar el texto escrito, posibilitando tener un repertorio de fórmulas para su posterior uso.

## Pantalla inicial 
![](https://github.com/Ger-dot-m/didactic-broccoli/blob/main/Capturas%20de%20funcionamiento/image_2021-12-10_14-38-27.png)

La presentación es simple de entender, dos botones que dan las opciones para abrir notas guardadas o para comenzar a escribir una. También se puede usar la barra de navegación que hay en la parte inferior.

## Crear notas
#### Se puede ver la lista de las notas guardadas. El botón para crear una es intuitivo, basta con introducir el nombre de la nota y presionar en "OK" para que esté guardada:
![](https://github.com/Ger-dot-m/didactic-broccoli/blob/main/Capturas%20de%20funcionamiento/image_2021-12-10_14-38-50.png)
![](https://github.com/Ger-dot-m/didactic-broccoli/blob/main/Capturas%20de%20funcionamiento/image_2021-12-10_14-39-05.png)
![](https://github.com/Ger-dot-m/didactic-broccoli/blob/main/Capturas%20de%20funcionamiento/image_2021-12-10_14-39-25.png)
![](https://github.com/Ger-dot-m/didactic-broccoli/blob/main/Capturas%20de%20funcionamiento/image_2021-12-10_14-39-35.png)
#### Para introducirlas solo hace falta escribir el texto dentro del recuadro 
![](https://github.com/Ger-dot-m/didactic-broccoli/blob/main/Capturas%20de%20funcionamiento/image_2021-12-10_14-39-49.png)

## Como introducir las operaciones

Se debe indicar el tipo de operación que se desea realizar y después especificar la función a realizar.

![](https://github.com/Ger-dot-m/didactic-broccoli/blob/main/Capturas%20de%20funcionamiento/image_2021-12-10_14-40-16.png)

Para raíz:
<raiz>funcion // Da la raiz empezando en el intervalo 0,1
<raiz>k,funcion  // Da la raiz empezando en el intervalo k,k+1
Para texto:
<text>TEXTO // Regresa sólo el texto
Para división sintética:
<divide>a1,a2,a3,...,an/k // ai representa los coeficientes de xn hasta x0, y son divididos por k
Aritmética:
23+1+3+14 // Sólo evalua la expresión aritmética. Si se le añade una x, esta se evalua en 0
Matriz inversa:
<inversa>a11,a12,a13,...;a21,a22,a23,...;... // Aqui lo importante es la sintaxis de entrada de la matriz, simplemente la inverte.


<<El programa indica si hay errores>>.
  
