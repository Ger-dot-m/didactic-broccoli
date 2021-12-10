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
      backgroundColor: Colors.white,
        appBar:
        AppBar(
            title: Text(nombre),
          backgroundColor: Colors.deepPurpleAccent,
        ),
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
          maxLines: 10,
          decoration: InputDecoration(
            hintText: "Escribe aquí",
            fillColor: Colors.purple[150],
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
              primary: Colors.white,
              shadowColor: Colors.red,
              elevation: 10,
              textStyle: const TextStyle(fontSize: 25),
              backgroundColor: Colors.deepPurpleAccent,
              padding: const EdgeInsets.all(15),

            ),
            child: Icon(Icons.add),
            onPressed: () {},
          ),
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              shadowColor: Colors.red,
              elevation: 10,
              textStyle: const TextStyle(fontSize: 25),
              backgroundColor: Colors.deepPurpleAccent,
              padding: const EdgeInsets.all(15),

            ),
            child: Icon(Icons.arrow_forward_ios_rounded ),
            onPressed: () {},
          )
        ],
      )
    ],
  );
}


