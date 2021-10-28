class AnalizadorSintactico {
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
    return [-1,-1];
  }

  String extrae(String entrada, int pos_j) {
    int len = entrada.length;
    return entrada.substring(pos_j + 1, len);
  }
  String getLabel(entrada, i,j) {
    return entrada.substring(i,j);
  }
}
