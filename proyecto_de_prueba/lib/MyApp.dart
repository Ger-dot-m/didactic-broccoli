import 'package:flutter/material.dart';
import 'filesScreen.dart';
import 'Interprete.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Inicio());
  }
}

class Inicio extends StatefulWidget {
  Inicio({Key? key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  int _pagina_actual = 0;

  List<Widget> _paginas = [
    Pagina_01(), //Pantalla de inicio
    Pagina_02(), //Visor de notas guardadas
    filesScreen(), //Pantala del editor
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Nombre de la App',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25),
          ),
          backgroundColor: Colors.cyan[900]),
      body: _paginas[_pagina_actual],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _pagina_actual = index;
          });
        },
        currentIndex: _pagina_actual,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: "Abrir"),
          BottomNavigationBarItem(icon: Icon(Icons.note_add), label: "Nuevo")
        ],
      ),
    );
  }
}

class Pagina_01 extends StatefulWidget {
  Pagina_01({Key? key}) : super(key: key);

  @override
  _Pagina_01State createState() => _Pagina_01State();
}

class _Pagina_01State extends State<Pagina_01> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Center(
          child: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white70,
              textStyle: const TextStyle(fontSize: 30),
              backgroundColor: Colors.blueGrey,
              padding: const EdgeInsets.all(20),
              //minimumSize: Size(width, height),
              //alignment: Alignment(0, -1),
            ),
            child: const Text(' Notas guardadas '),
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {

                return filesScreen();
              }),
            );},
          ),
        ),
        Center(
          child: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white70,
              textStyle: const TextStyle(fontSize: 30),
              backgroundColor: Colors.green[800],
              padding: const EdgeInsets.all(20),
              //minimumSize: Size(width, height),
              //alignment: Alignment(0, -1),
            ),
            child: const Text('Interprete'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {

                  return Interprete();
                }),
              );
            },
          ),
        ),
      ],
    );
  }
}

class Pagina_02 extends StatefulWidget {
  Pagina_02({Key? key}) : super(key: key);

  @override
  _Pagina_02State createState() => _Pagina_02State();
}

class _Pagina_02State extends State<Pagina_02> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Pendiente'),
    );
  }
}
