import 'package:flutter/material.dart';

class MenuText extends StatefulWidget {
  String nombre = "", archivo = "";
  MenuText(this.nombre, this.archivo, {Key? key}) : super(key: key);

  @override
  _MenuTextState createState() => _MenuTextState(nombre, archivo);
}

class _MenuTextState extends State<MenuText> {
  String nombre = "", archivo = "";
  _MenuTextState(this.nombre, this.archivo);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(nombre)),
        body: TextBox()
    );
  }
}

ListView TextBox(){
  return ListView(
    children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: TextField(
          //autofocus: true,
          autocorrect: false,
          cursorColor: Colors.red,
          cursorWidth: 3,
          maxLines: 16,
          decoration: InputDecoration(
            hintText: "Escribe aquí",
            fillColor: Colors.blue[100],
            filled: true,
          ),
        ),
      ),
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.black,
              textStyle: const TextStyle(fontSize: 25),
              backgroundColor: Colors.yellow,
              padding: const EdgeInsets.all(15),
              //minimumSize: Size(width, height),
              //alignment: Alignment(0, -1),
            ),
            child: const Text('Nuevo bloque'),
            onPressed: () {},
          ),
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.black,
              textStyle: const TextStyle(fontSize: 25),
              backgroundColor: Colors.green,
              padding: const EdgeInsets.all(15),
              //minimumSize: Size(width, height),
              //alignment: Alignment(0, -1),
            ),
            child: const Text('Ejecutar'),
            onPressed: () {},
          )
        ],
      )
    ],
  );
}


