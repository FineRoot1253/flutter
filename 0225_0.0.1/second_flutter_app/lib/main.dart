import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(new MaterialApp(
    home: new Homepage(),
  ));
}

class Homepage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    SystemChrome.setEnabledSystemUIOverlays([]); // 상태바 네이게이션 바 hidding

    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.grey.shade200,
      appBar: new AppBar(
        backgroundColor: Colors.redAccent,
        title: new Text("Layout Test App"),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search), onPressed: null,)
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(items: [
        new BottomNavigationBarItem(icon: new Icon(Icons.call),title: new Text("Call")),
        new BottomNavigationBarItem(icon: new Icon(Icons.access_alarms),title: new Text("Alarm")),
        new BottomNavigationBarItem(icon: new Icon(Icons.bookmark),title: new Text("bookmark")),
      ]),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Colors.redAccent,
        child: new Icon(Icons.add),
        onPressed: null,
      ),
      body: new Container(
        alignment: Alignment.center,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("hi",
            style: new TextStyle(
              color: Colors.cyan,
              fontStyle: FontStyle.italic,
              fontSize: 15.0
            ),),
            new Text("hi",
              style: new TextStyle(
                  color: Colors.amber,
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0
              ),),
            new Text("hi",
              style: new TextStyle(
                  color: Colors.redAccent,
                  fontStyle: FontStyle.italic,
                  fontSize: 25.0
              ),)
          ],
        )
      ),
    );
  }
}

