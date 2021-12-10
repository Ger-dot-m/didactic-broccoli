import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'AnalizadorSintactico.dart';
import 'Soluciones.dart';

class Interprete extends StatefulWidget {

  Interprete( {Key? key}) : super(key: key);
  @override
  _Interprete createState() => _Interprete();
}

class _Interprete extends State<Interprete> {
  String dato = "";
  List<Widget> dato_pantalla = [];
  final analiza = AnalizadorSintactico();
  final solucion = Soluciones();
  List<String> objeto=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Interprete In-line"),
            backgroundColor: Colors.deepPurpleAccent
        ),
        backgroundColor: Colors.deepPurpleAccent,
        body: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(10)) ,
                    color: Colors.white
                ),
            child:Column(
              children: [
                TextFormField(
                  onChanged: (texto) {
                    dato = texto;
                  },
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                  initialValue: "<operacion> contenido"
              ),
                Row(
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: popText,
                      child: Text('Borra'),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: ejecuta,
                      child: Text('Ejecutar'),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                )],)
            ),

            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: dato_pantalla.length,
                itemBuilder: (context, index) {
                  return dato_pantalla[index];
                })

          ],
        )
    );
  }

  void popText() {
    setState(() {
      dato_pantalla.removeLast();
    });
  }

  void ejecuta() {
    objeto = analiza.getItem(dato);
    String imprime = objeto[0] + " de " + objeto[1] + ": ";
    imprime += solucion.inicia(objeto[0], objeto[1]);
    setState(() {
      dato_pantalla.add(
        Container(
          child: Text(imprime, textAlign: TextAlign.justify),
            color: Colors.white
        )
      );
    });
  }
}

TeXView muestra(){
  return TeXView(
    child: TeXViewColumn(children: [
      TeXViewInkWell(
        id: "id_0",
        child: TeXViewColumn(children: [
          TeXViewDocument(r"""<h2>Flutter \( \rm\\TeX \)</h2>""",
              style: TeXViewStyle(textAlign: TeXViewTextAlign.Center)),
          TeXViewContainer(
            child: TeXViewImage.network(
                'https://raw.githubusercontent.com/shah-xad/flutter_tex/master/example/assets/flutter_tex_banner.png'),
            style: TeXViewStyle(
              margin: TeXViewMargin.all(10),
              borderRadius: TeXViewBorderRadius.all(20),
            ),
          ),
          TeXViewDocument(r"""<p>                                
                       When \(a \ne 0 \), there are two solutions to \(ax^2 + bx + c = 0\) and they are
                       $$x = {-b \pm \sqrt{b^2-4ac} \over 2a}.$$</p>""",
              style: TeXViewStyle.fromCSS(
                  'padding: 15px; color: white; background: green'))
        ]),
      )
    ]),
    style: TeXViewStyle(
      elevation: 10,
      borderRadius: TeXViewBorderRadius.all(25),
      border: TeXViewBorder.all(TeXViewBorderDecoration(
          borderColor: Colors.blue,
          borderStyle: TeXViewBorderStyle.Solid,
          borderWidth: 5)),
      backgroundColor: Colors.white,
    ),
  );
}