import 'package:math_expressions/math_expressions.dart';

class Soluciones {
  Variable x = Variable('x');
  Parser p = Parser();
  ContextModel cm1 = ContextModel();
  ContextModel cm2 = ContextModel();
  List<String> etiquetas = ["text", "raiz", "divide"];


  String inicia(String tipo, String entrada) {
    for (var item in etiquetas) {
      if (tipo == "text") return Text(entrada);
      else if (tipo == "raiz") {
        try{return "Raiz de " + entrada.split(",")[1] + ": " +Raiz(entrada);}
        catch(e){return "Raiz de " + entrada + ": " +Raiz(entrada);}
      }
      else if (tipo == "divide") return "Division de $entrada: " + Division(entrada);
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
