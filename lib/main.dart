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

class Data {
  int _price;
  String _name;

  Data(this._name, this._price): super();

  @override
  String toString() {
    return _name + ':' + _price.toString() + '円';
  }
}

class _MyHomePageState extends State<MyHomePage> {
  String _message;
  int _num;

  static final _data = [
    Data('Apple', 300),
    Data('Banana', 198),
    Data('Chery', 480),
    Data('Greap', 680),
    Data('Kome', 4800),
  ];
  Data _item;

  @override

  void initState() {
    super.initState();
    _item = _data[0];//初期値
    /*_message = 'オッパッピー';
    _num = 1;*/
  }

  void _setData() {
    setState((){
      _item = (_data..shuffle()).first;//ボタンを押下した後
    });
  }

  @override

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
        //_message,
        _item.toString(),
        style: TextStyle(fontSize:16.0),
      ),
      floatingActionButton: FloatingActionButton(
        //onPressed: _setMessage,
        onPressed: _setData,
        tooltip: 'set message.',
        child: Icon(Icons.star),
      ),
    );
  }
}