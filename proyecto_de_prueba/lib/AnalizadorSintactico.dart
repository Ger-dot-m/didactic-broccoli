class AnalizadorSintactico {
  // "Limpia" la entrada, separandolo por tipo de operacion y el dato.
  /* USO:
    AnalizadorSintactico obj = new AnalizadorSintactico();
    obj.getItem(entrada);
    Regresa una lista: [etiqueta, contenido]
  */

  List<int> etiqueta(String entrada) {
    for (int i = 0; i < entrada.length; i++) {
      if (entrada[i] == '<') {
        for (int j = i; i < entrada.length; j++) {
          if (entrada[j] == '>') {
            return [i + 1, j];
          }
        }
      }
    }
    return [-1, 0];
  }

  List<String> getItem(String entrada) {
    int len = entrada.length;
    List<int> obtiene = etiqueta(entrada);
    if (obtiene[0] == -1) {
      return asigna(entrada);
    }
    int i = obtiene[0];
    int j = obtiene[1];

    return [entrada.substring(i, j), entrada.substring(j + 1, len)];
  }

  List<String> asigna(String entrada) {
    for (int i = 0; i < entrada.length; i++) {
      if (entrada[i] == '=') {
        String nombre = entrada.substring(0, i - 1);
        String funcion = entrada.substring(i + 1, entrada.length);
        return [nombre, funcion];
      }
    }
    return ["otro", entrada];
  }
}
