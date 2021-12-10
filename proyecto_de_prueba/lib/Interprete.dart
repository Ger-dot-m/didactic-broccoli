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
        appBar: AppBar(title: Text("Interprete In-line")),
        body: Column(
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
            ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: dato_pantalla.length,
                itemBuilder: (context, index) {
                  return dato_pantalla[index];
                })

          ],
        ));
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
      dato_pantalla.add(Text(imprime));
    });
  }
}