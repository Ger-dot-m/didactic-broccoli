import 'package:flutter/material.dart';
import 'AnalizadorSintactico.dart';

class MenuText extends StatefulWidget{
  const MenuText({Key? key}) : super(key: key);
  @override
  _MenuText createState() => _MenuText();
}

class _MenuText extends State<MenuText> {
  String dato="";
  List <Widget> dato_pantalla = [];
  final analiza = AnalizadorSintactico();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            TextFormField(
              onChanged: (texto){
                dato = texto;
              },
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: addText,
              child: Text('Ejecutar'),
            ),

            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: dato_pantalla.length,
                itemBuilder: (context,index){
                  return dato_pantalla[index];
                }
            )
          ],
        )
    );
  }

  void addText(){
    List<int> indices = analiza.etiqueta(dato);
    String contenido = analiza.extrae(dato, indices[1]);
    String etiqueta = analiza.getLabel(dato, indices[0], indices[1]);
    setState(() {
      dato_pantalla.add(Text("$etiqueta: $contenido"));
    });
  }
}
