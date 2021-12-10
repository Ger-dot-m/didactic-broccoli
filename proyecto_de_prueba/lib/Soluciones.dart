import 'package:math_expressions/math_expressions.dart';

class Soluciones {
  Variable x = Variable('x');
  Parser p = Parser();
  ContextModel cm1 = ContextModel();
  ContextModel cm2 = ContextModel();
  // Etiquetas: text, raiz, divide, invierte


  String inicia(String tipo, String entrada) {
    for (var item in [0,0,0,0]) {
      if (tipo == "text") return Text(entrada);
      else if (tipo == "raiz") {
        try{return "Raiz de " + entrada.split(",")[1] + ": " +Raiz(entrada);}
        catch(e){return "Raiz de " + entrada + ": " +Raiz(entrada);}
      }
      else if (tipo == "divide") return "Division de $entrada: " + Division(entrada);
      else if (tipo == "invierte"){
        var matrix = toMatrix(entrada);
        String salida = "Inversa de $matrix: \n";
        return salida + Invierte(entrada);
      }
      else{
        try{
          Expression f = p.parse(entrada);
          cm1.bindVariable(x, Number(0));
          num out = f.evaluate(EvaluationType.REAL, cm1);
          return "$entrada = $out";
        }catch(e){return "$e Para la etiqueta: $tipo";}
      }

    }
    return "Error";
  }
  String Text(String dato) {return dato;}
  String Raiz(String dato) {
    List<String> _dato = dato.split(",");
    Expression expresion;
    num x0;
    if(_dato.length == 1){
      x0 = 0;
      expresion = p.parse(dato);
    }
    else{
      x0 = num.parse(_dato[0]);
      expresion = p.parse(_dato[1]);
    }
    num raiz = secante(expresion, x0, x0+1);
    String salida ="$raiz";
    return salida;
  }
  String Division(String dato){
    List<String> sub_dato = dato.split("/");
    List<String> _coef = sub_dato[0].split(",");
    List<num> coef = [];
    num y = num.parse(sub_dato[1]);
    int size = _coef.length;
    for (int i = 0; i < size; i++){
      coef.add(num.parse(_coef[i]));
    }
    for (int i = 1; i < size; i++){
      coef[i] += coef[i-1]*y;
    }
    for (int i = 0; i < size; i++){
      _coef[i] = coef[i].toString();
    }
    return "$_coef";
  }

  String Invierte(String dato){
    String salida = "";
    for(var item in intercambio(toMatrix(dato)) ){
      salida += item.toString() + "\n";
    }
    return salida;
  }

  List<dynamic> toMatrix(String data) {
    var matx = data.split(";");
    var matrix = [];
    for (var item in matx) {
      var temp = item.split(",");
      var aux = [];
      for (var item in temp) {
        aux.add(num.parse(item));
      }
      matrix.add(aux);
    }
    return matrix;
  }

  int pivote(List<dynamic> fila) {
    var k = [];
    for (var item in fila) {
      k.add(item.abs());
    }
    return k.indexOf(max(k));
  }

  num max(List<dynamic> data) {
    num largestData = data[0];
    for (var i = 0; i < data.length; i++) {
      if (data[i] > largestData) {
        largestData = data[i];
      }
    }
    return largestData;
  }

  List<dynamic> intercambio(A) {
    // Invierte la matriz
    int dimension = A.length;
    List<int> dim = [for (var i = 0; i < dimension; i++) i];
    List<int> usados = [for (var i = 0; i < dimension; i++) i];
    List<int> iterable = [for (var i = 0; i < dimension; i++) i];
    List<int> orden = [], pivotes = [];
    int j = 0;
    for (var i in dim) {
      j = pivote(A[i]);
      if (usados.contains(j)) {
        usados.remove(j);
      } else {
        j = usados.last;
        if (A[i][j] == 0) {
          j = usados[dimension - 2];
        }
        usados.remove(j);
      }
      orden.add(j);
      pivotes.add(i);
      // Paso uno
      for (var x in dim) {
        if (x != j) {
          A[i][x] /= -A[i][j];
        }
      }

      // Paso dos
      for (var x in dim) {
        for (var y in dim) {
          if (x != i && y != j) {
            A[x][y] += A[i][y] * A[x][j];
          }
        }
      }
      // Paso tres
      for (var x in dim) {
        if (x != i) {
          A[x][j] /= A[i][j];
        }
      }
      // Paso cuatro
      A[i][j] = 1 / A[i][j];
    }
    // Ordenamiento de la matriz
    List<int> bypass = [];
    for (var x in orden) {
      bypass.add(x);
    }
    for (var xLast in [for (var i = orden.length - 1; i < 0; i--) i]) {
      for (var i in [for (var i = 0; i < xLast; i++) i]) {
        if (orden[i] > orden[i + 1]) {
          int temp = orden[i];
          orden[i + 1] = temp;
          int temp2 = pivotes[i];
          pivotes[i] = pivotes[i + 1];
          pivotes[i + 1] = temp2;
        }
      }
    }
    var pre = [];
    for (var vector in A) {
      var temp = [];
      for (var i in iterable) {
        temp.add(num.parse(vector[bypass[i]].toStringAsFixed(6)));
      }
      pre.add(temp);
    }

    var MI = [];
    for (var i in iterable) {
      MI.add(pre[pivotes[i]]);
    }

    return MI;
  }


  num secante(Expression f, num x0, num x1){
    num E = 0.00001, error = 1, xn = 0;
    while( error > E){
      cm1.bindVariable(x, Number(x0));
      cm2.bindVariable(x, Number(x1));
      try{
        xn = x1-f.evaluate(EvaluationType.REAL, cm2)*(x1-x0)/(f.evaluate(EvaluationType.REAL, cm2)-f.evaluate(EvaluationType.REAL, cm1));
      } catch (e){break;}
      try{
        error = ((xn-x1)/xn).abs();
      } catch(e){break;}
      x0=x1;
      x1=xn;
    }
    return xn;
  }
}
