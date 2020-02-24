import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final title = 'マインドマップ';
  final mes = 'ハローワールド';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'flutter demo',
      home: new MyHomePage(
        title: this.title,
        mes: this.mes
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({this.title, this.mes}): super();

  final String title;
  final String mes;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _message;
  int _num;

  @override

  void initState() {
    super.initState();
    _message = 'オッパッピー';
    _num = 1;
  }

  void _setMessage() {
    setState((){
      if(1 == _num % 3){
        _message = 'タップっパッピー';
      }else if(_num % 3 == 2){
        _message = 'オッパッピー';
      }else{
        _message = '割り切れた';
      }
      _num = _num + 1;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Text(
        _message,
        style: TextStyle(fontSize:16.0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _setMessage,
        tooltip: 'set message.',
        child: Icon(Icons.star),
      ),
    );
  }
}