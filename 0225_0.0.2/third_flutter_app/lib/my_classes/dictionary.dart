import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

class DictView extends State<MyDictionary> {
  final _myTextController = new TextEditingController();
  String _testStr = " ";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.redAccent,
        title: new Text("MY FIRST DICTIONARY WITH API"),
      ),
      body: new Container(
        alignment: Alignment.center,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextField(
              controller: _myTextController,
              decoration: new InputDecoration(
                  hintText: "You can type something in here",
                  labelText: "Give me a word plz",
                  labelStyle: new TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.red.shade200),
                  icon: new Icon(
                    Icons.text_format,
                    color: Colors.redAccent,
                  )),
            ),
            new RaisedButton(
              color: Colors.redAccent,
              child: new Text('input'),
              onPressed: _testOutput,
            ),
            new Text(_testStr)
          ],
        ),
      ),
    );
  }

  void _testOutput() {
    setState(() {
      _testStr = _myTextController.text;
    });
  }
}

class MyDictionary extends StatefulWidget {
  State<StatefulWidget> createState() => DictView();
}

/*
class MyDictionary extends StatelessWidget{
  final _myTextController = new TextEditingController();

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.redAccent,
        title: new Text("MY FIRST DICTIONARY WITH API"),
      ),
      body: new Container(
        alignment: Alignment.center,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextField(
              controller: _myTextController,

              decoration: new InputDecoration(
                hintText: "You can type something in here",
                labelText: "Give me a word plz",
                labelStyle: new TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.red.shade200
                ),
                icon: new Icon(Icons.text_format,color: Colors.redAccent,)
              ),
            ),
            new RaisedButton(
              color: Colors.redAccent,
              child: new Text('input')
            )
          ],
        ),
      ),
    );
  }
}
*/ // 20_02_25 modified statelesswidget을 사용한 기본 레이아웃 동적인 사용자의 데이터를 받고 표현하기위해 위의 StatefulWidget으로 바꾸었따
