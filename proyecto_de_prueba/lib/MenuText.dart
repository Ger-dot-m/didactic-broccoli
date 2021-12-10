import 'package:flutter/material.dart';

class MenuText extends StatefulWidget {
  String nombre = "", archivo = "";
  MenuText(this.nombre, this.archivo, {Key? key}) : super(key: key);

  @override
  _MenuTextState createState() => _MenuTextState(nombre, archivo);
}

class _MenuTextState extends State<MenuText> {
  String nombre = "", archivo = "";
  List<Expanded> pantalla = [];
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
        body: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: pantalla.length,
            itemBuilder: (context,index){
              return pantalla[index];
            }
        )
    );
  }
  @override
  void initState() {
    pantalla.add(
        Expanded(child: SizedBox(
          height: 200.0,
          child: TextBox0(),
        ))
    );
    super.initState();
  }

  void ejecuta() {
    setState(() {
      pantalla.add(
          Expanded(child: SizedBox(
            height: 200.0,
            child: TextBox0(),
          ))
      );
    });
  }
  void popBox() {
    setState(() {
      pantalla.removeLast();
    });
  }

  ListView TextBox0(){
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: TextField(
            autocorrect: false,
            cursorColor: Colors.red,
            cursorWidth: 3,
            maxLines: 5,
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
              onPressed: ejecuta,
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
              child: Icon(Icons.delete),
              onPressed: popBox,
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
              child:Icon(Icons.arrow_forward_ios_rounded ),
              onPressed: ()=>print("Ejecutado"),
            )
          ],
        )
      ],
    );
  }
}




