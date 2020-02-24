import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  runApp(new MaterialApp(
    home: new myHomepage(),
  )
    /*new Material(
    color: Colors.amber,
    child: Center(
    child: new Text(

      "Hello!",
      textDirection: TextDirection.ltr,
      style: new TextStyle(
        color: Colors.blue,
        fontStyle: FontStyle.italic,
        height: 30.0
      ),
    )
  )
  )*/ // 20_02_18 12:17 modified (Most Simple Text attachment design)

  );
}

class myHomepage extends StatelessWidget{  // 항상 클래스를 구성한다음 runApp 으로 넘겨줘야한다
                                           // 이 클래스 내부에 앱바와 같은 기본적인 레이아웃 기능을 제공하는 위젯인 스캐폴드를 사용하겠다
  @override
  Widget build(BuildContext context){
    SystemChrome.setEnabledSystemUIOverlays([]); // 상태바 네이게이션 바 hidding
    /*
    return new Material(
      color: Colors.white,
        child: new Center(
          child: new Text("This is my new HomePage!",
              textDirection: TextDirection.ltr,
              style: new TextStyle(
                  color: Colors.blue,
                  fontStyle: FontStyle.italic
              )
          ),
        )
    );
     */ // Material은 디자인의 일종으로 어플리케이션의 기능을 확장시켜준다. import 해두었기때문에 사용가능한것이다.
        // 레이아웃 디자인은 총 9가지가 있으며 대표적으로 container나 row , column, sizebox가 많이 쓰인다.
        // 보통은 container로 감싸는것이 일반적이며 가장 위젯을 구성하는데 간단하다
 /*   return new Container(
      color: Colors.white,
        alignment: Alignment.center,
        child: new Column(// Column으로 바꿔도 된다
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("One",
            style: new TextStyle(
              fontSize: 15.0
            ),),
            new Text("Two",
              style: new TextStyle(
                  fontSize: 30.0
              ),),
            new Text("Three",
              style: new TextStyle(
                  fontSize: 45.0
              ),)
          ],
        )
    );*/  //20_02_18_0.0.3 17:44 modified
    return new Scaffold(
      resizeToAvoidBottomPadding: false, //appBar: new AppBar(), 바닥에 패딩을 준다.
      backgroundColor: Colors.grey,
      /*
      appBar: new AppBar(
        backgroundColor: Colors.black45,
        title: new Text("Logy"),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search), onPressed: null)
        ],
      ), */ //appBar의 경우 이다. 스캐폴드에 들어있는 기본 레이아웃 종류는 여러가지가 있다
      body: Container(

        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/예시bi1.png"),
            fit: BoxFit.cover,
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: null,
        backgroundColor: Colors.black45,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}