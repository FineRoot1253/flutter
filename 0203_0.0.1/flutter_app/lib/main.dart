import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

// stateless위젯 이 상태를 유지안할 경우 사용 (stateful은 반대)

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator!',
      theme: ThemeData( // theme위젯에 ThemeData클래스를 사용해 그 안에 위젯인 primaryColor를 통해 색깔을 바꾼것이다 이 클래스로 쉽게 테마를 손볼수 있다
        primaryColor: Colors.white,
      ),
      home: RandomWords(),

      /*title: 'Knock Knock',
      home: Scaffold(

        appBar: AppBar(
          title: Text('Who'"'"' s There?'),
        ),
        body: Center(
         child: RandomWords(),
        ),
      ),
       */ // 0.0.1 10:07 modified
    );
  }
}
class RandomWordsState extends State<RandomWords>{
  /*
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 19.0); // _를 앞에 붙이면 private 와 같다.
  */ // 0.0.1 11:00 modified
  final List<WordPair> _suggestions = <WordPair>[]; // set과 list의 차이는 중복성 허용여부이다 위의 코드는 배열이고 이것은 배열을 담는 리스트이다
  final Set<WordPair> _save = Set<WordPair>(); // set 보단 list가 많이 쓰인다 중복을 허용 안하기 때문이다.
  final _biggerFont = const TextStyle(fontSize: 19.0);
  @override
    Widget build(BuildContext context){
    /*
      final wordPair = WordPair.random();
      return Text(wordPair.asPascalCase);
     */ // 0.0.1 9:50 modified
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),//  위젯을 추가하고 child가 단일 일 경우 대괄호 []으로 위젯 배열()을 가진다
        ],
      ),
      body: _buildSuggestions(),
    );
  }
  void _pushSaved(){ // 반환형 void는 생략 가능하다 단 생성자와 구분은 시켜주기 위해 void 를 사용해주자
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) { // builder의 특성은 이름을 가진 새로운 루트의 앱바가 달린 경로를 포함한 스캐폴드를 반환하는 특성을 지닌다. 이름을 넣을 수 있는 앱바 화면 경로 뼈대를 반환한다고 보면된다
          final Iterable<ListTile> tiles = _save.map(
                (WordPair pair) {
              return ListTile( // ListTile행을 포함하는 ListView로 구성된다 하위 위젯이 무엇이 있는지 알아보는것이 중요할것 같다
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile
              .divideTiles(
            context: context,
            tiles: tiles,
          )
              .toList();
          return Scaffold(
            appBar: AppBar(
              title: Text('You prefered those WordPairs...'),
            ),
            body: ListView(children: divided), // 위에서 선언, 정의 해둔 위젯리스트인 divided를 여기서 이렇게 써먹는다 body는 이것으로 채워질 예정이다.
          );
        },
      ),
    );
  }
  Widget _buildRow(WordPair pair){
    final bool alreadySaved = _save.contains(pair); // 이미 추가 되었는지 안되었는지 bool로 여부 체크
    /*
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
     */ // 0.0.1 11:05 modified
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon( // icon위젯은 어느 열에나 추가 할수 있다 컨테이너의 모든 열에는 아이콘을 추가 할수 있게끔 되어있다
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : Colors.black12, // ? 연산자로 간단히 체크를 한다 2번하게 되는데 true일땐 favorite, 색깔은 빨강 아닐땐 favorite_border, null은 해당없음이고 색을 지정해줄수도 있다
      ),
      onTap: (){
        setState(() {
          if (alreadySaved)
            _save.remove(pair);
          _save.add(pair);// set에 추가, 제거 되는 부분이다. suggestion 리스트는 중복되도 상관없지만 favorite한 단어쌍은 중복을 허용하지 않겠다는 의미이다
        });
      },
    );
  }
  Widget _buildSuggestions(){
    return ListView.builder(
    padding: const EdgeInsets.all(14.0),
    itemBuilder: (context, i) { /* 1) 단어쌍이 제안 될때마다 호출되고 각각 ListTile행에 배치, 짝수행은 단어쌍 배치 홀수 행은 시각적으로 각항목을 구분하는  Divider위젯을 추가 */
      if (i.isOdd) return Divider();/* 2) i가 홀수 일때 Divider를 호출, ListView의 각 행의 앞에 1픽셀 높이의 구분선 위젯을 추가한다*/

      final index = i ~/ 2; /* 3) i가 홀수가 아닐때 2로 나눈 몫이 index가 됨 */
      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10)); /* 4) 초기에 10개 만들어진 단어쌍을 모두 사용해 다시 10개를 생성후 제안목록에 추가*/
      }
      return _buildRow(_suggestions[index]);
    });
  }
}

class RandomWords extends StatefulWidget{
  @override
  RandomWordsState createState() => RandomWordsState(); // RandomWordsState createState(){return RandomWordsState();} 와 같다 함수를 이렇게 간략화 가능하다
}