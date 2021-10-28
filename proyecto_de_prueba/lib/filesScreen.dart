import 'package:flutter/material.dart';
import 'MenuText.dart';

class filesScreen extends StatefulWidget {
  const filesScreen({Key? key}) : super(key: key);

  @override
  _filesScreen createState() => _filesScreen();
}

class _filesScreen extends State<filesScreen> {
  int count = 0;
  List<Widget> files = [];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new ListView(
          children: <Widget>[
            ListTile(
              title: Text('Nuevo'),
              subtitle: Text('Crear nuevo proyecto.'),
              leading: Icon(Icons.add),
              onTap: _addFile,
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
        ));
  }

  ListTile fileTile(int num){
    String numero = num.toString();
    return ListTile(
      title: Text('Archivo ' + numero),

      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return MenuText();
          }),
        );
      },
    );
  }

  void _addFile(){
    setState(() {
      files.add(fileTile(count));
      count += 1;
    });
  }
}

