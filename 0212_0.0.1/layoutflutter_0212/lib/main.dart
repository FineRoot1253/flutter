import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Row를 정하고 그 안에 컬럼이 몇개 들어가는지, 위젯에 몇개 들어갈지 정해야한다 그것이 가장 중요한 요소이다.
    Color c = Theme.of(context).primaryColor;
    Widget titleSection = Container(
      //  위 아래 오른쪽 왼쪽 싹다 32픽셀씩 띄우겠다는 의미이다. container 안에 넣으면 아래줄 코드 처럼 패딩을 설정할수 있다 하위 위젯 전체에 적용 시키기 위함이다
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          //  Row 안에 넣을 children은 3 Expanded 위젯(2줄짜리 텍스트 column 이기 때문에) , Icon, Text까지
          Expanded(
            //  Expanded 위젯 안에는 child로 column을 가지고 column은 children으로 총 2개이다 container와 text
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  //  container는  child를 가지는데 text이다  container 안에 첫 번째 row의 text를 넣을 경우 padding을 정할 수 있다
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Negative Cat',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Meow',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          /*
          Icon(
            Icons.star,
            color: Colors.red[500],

          ),
          Text('41'),
          */
          // 20_02_13 09:57 modified
          FavoriteWidget(),
        ],
      ),
    );

    Column _buildButtonColumn(Color c, IconData icon, String label) {
      //Column형을 반환하는 메서드이다 icon과 color는 호출할때 파라미터를 통해 정해진다
      return Column(
        mainAxisSize: MainAxisSize.min,
        // 이것은 모든 column 이 동일한 위치에 있도록 위치지정을 해주는 위젯이다
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: c),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              // text는 String인데 이것또한 매개변수를 통해 정해진다
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: c,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSection = Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(c, Icons.call, 'CALL'),
        _buildButtonColumn(c, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(c, Icons.share, 'SHARE'),
      ],
    ));
    Widget textSection = Container(
        padding: const EdgeInsets.all(32),
        child: Text(
          'Meow... Mew...Me..Meow....',
          softWrap: true, // 이것을 넣으면 단어를 줄바꿈 하기 전에 column의 너비를 자동으로 채운다
        ));
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout demo'),
        ),
        /*
        body: Center(
          child: Text('Hello World'),
        ),
         */ // 20_02_12_0.0.1 15:26 modified
        body: ListView(
          children: [
            Image.asset(
              'image/a.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(32),
          child: IconButton(
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[900],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favoriteCount'),  // $를 붙이면 변수나 상수를 문자열로 치환할 수 있다
          ),
        ),
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
}
