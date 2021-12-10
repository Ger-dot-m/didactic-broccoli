import 'package:math_expressions/math_expressions.dart';

class Soluciones {
  List stackTipes = [];
  List stackData = [];
  Variable x = Variable('x');
  Parser p = Parser();
  ContextModel cm1 = ContextModel();
  ContextModel cm2 = ContextModel();
  List<String> etiquetas = ["text", "raiz"];


  String inicia(String tipo, String entrada) {
    for (var item in etiquetas) {
      if (tipo == item) {
        if (tipo == "text") return Text(entrada);
        else if (tipo == "raiz") return Raiz(entrada);
      }
    }
    return "";
  }

  String Raiz(String dato) {
    Expression expresion = p.parse(dato);
    num raiz = secante(expresion, 0, 1);
    String salida ="$raiz";
    return salida;
  }

  String Text(String dato) {return dato;}

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
  void addPila(String tipo, String entrada){
    stackTipes.add(tipo);
    stackData.add(entrada);
  }
}
