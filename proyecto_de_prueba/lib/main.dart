import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FavoriteWidget());
  }
}

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({Key? key}) : super(key: key);

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
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
      title: Text('Archivo '+numero),
      onTap: (){},
    );
  }
  void _addFile(){
    setState(() {
      files.add(fileTile(count));
      count += 1;
    });
  }

}
