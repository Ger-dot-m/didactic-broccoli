import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  @override
  void initState() {
    super.initState();
    _loadFile().then((value) {
      setState(() {
        contenido = value;
      });
    });
  }

  Future<String> _loadFile() async {
    return await rootBundle.loadString("assets/files/datos.txt");
  }

  Widget imprimeContenido(BuildContext context) {
    return FutureBuilder<String>(
        future: _loadFile(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!);
          } else if (snapshot.hasError) {
            return Text("$snapshot.error");
          }
          return CircularProgressIndicator();
        });
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
      files.add(fileTile(count));
      count += 1;
    });
    print(contenido);
  }
}

