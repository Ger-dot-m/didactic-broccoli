import 'package:flutter/material.dart';
import 'MenuText.dart';

class filesScreen extends StatefulWidget {
  const filesScreen({Key? key}) : super(key: key);
  @override
  _filesScreen createState() => _filesScreen();
}

class _filesScreen extends State<filesScreen> {
  int count = 1;
  String titulo = "";
  List<Widget> files = [];
  var contenido = "";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white
          ),
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          child: new ListView(
            children: <Widget>[
              Material(
                type: MaterialType.transparency,
                child: ListTile(
                    enabled : true,
                    title: Text('Nuevo'),
                    subtitle: Text('Crear nuevo proyecto.'),
                    leading: Icon(Icons.add),
                    onTap: _addFile
                ),
              ),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: files.length,
                  itemBuilder: (context,index){
                    return files[index];
                  }
              )
            ],
          ),
        )
    );
  }


  ListTile fileTile(int num){
    return ListTile(
      title: Text(titulo),
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return MenuText(titulo, "");
          }),
        );
      },
    );
  }

  void _addFile(){
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Nuevo proyecto'),
        content: const Text('Nombre del nuevo proyecto'),
        actions: <Widget>[
          TextFormField(
            onChanged: (texto){
              titulo = texto;
            },
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
            ),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: _newState,
                child: const Text('OK'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _newState(){
    Navigator.pop(context, 'OK');
    setState(() {
      files.add(
          Material(
            type: MaterialType.transparency,
            child: fileTile(count),
          )
      );
      count += 1;
    });
  }
}
