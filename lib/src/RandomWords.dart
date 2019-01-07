import 'package:flutter/material.dart';
import 'package:flutter_app/src/HeroAnimation.dart';
import 'package:flutter_app/src/MyHomePage.dart';
import 'package:flutter_app/src/Product.dart';
import 'package:flutter_app/src/ShoppingList.dart';

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      // If the lake is currently favorited, unfavorite it.
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
        // Otherwise, favorite it.
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: (_isFavorited ? Colors.red[500] : Colors.blue[500]),
            onPressed: _toggleFavorite,
          ),
          SizedBox(
            width: 22.0,
            child: Container(
              child: Text('$_favoriteCount'),
            ),
          ),
        ],
      ),
    );

    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, color: color),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ],
      );
    }

    void makeDialog(context) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
                return AlertDialog(
                    title: new Text("CALL 버튼 클릭"),
                    content: new Text("CALL 버튼을 클릭하였습니다."),
                    actions: <Widget>[
                        new FlatButton(
                                onPressed: () {
                                    Navigator.of(context).pop();
                                },
                                child: new Text("Close")),
                    ],
                    // ignore: return_of_invalid_type
                );
            }
        );
    }

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
            highlightColor: Colors.red,
            splashColor: Colors.red,
            onTap: () {
                makeDialog(context);
            },
            child: buildButtonColumn(Icons.call, 'CALL'),
          ),
          InkWell(
            highlightColor: Colors.red,
            splashColor: Colors.red,
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(
                  builder: (BuildContext context) {
                    return HeroAnimation();
                  },
                ),
              );
            },
            child: buildButtonColumn(Icons.near_me, 'ROUTE'),
          ),
          InkWell(
            highlightColor: Colors.red,
            splashColor: Colors.red,
            onTap: () {
                makeDialog(context);
            },
            child: buildButtonColumn(Icons.share, 'SHARE'),
          ),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Top Lakes'),
        actions: <Widget>[
          new IconButton(
              icon: const Icon(Icons.near_me), onPressed: _bringingAllTogether),
          new IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: ListView(
        children: <Widget>[
          Image.asset(
            'images/lake.jpg',
            width: 600.0,
            height: 240.0,
            fit: BoxFit.cover,
          ),
          titleSection,
          buttonSection,
          textSection,
          GestureDetector(
            onTap: () {
              print('MyButton was tapped!');
            },
            child: Container(
              height: 36.0,
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.lightGreen[500],
              ),
              child: Center(
                child: Text('Engage'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return MyHomePage(title: 'Strawberry Pavlova Recipe');

//          return MaterialApp(
//            title: 'Flutter Demo',
//            theme: ThemeData(
//              primarySwatch: Colors.green,
//            ),
//            home: MyHomePage(title: 'Strawberry Pavlova Recipe'),
//          );
        },
      ),
    );
  }

  void _bringingAllTogether() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return ShoppingList(
            products: <Product>[
              Product(name: 'Eggs'),
              Product(name: 'Flour'),
              Product(name: 'Chocolate chips'),
              Product(name: 'Eggs1'),
              Product(name: 'Flour1'),
              Product(name: 'Chocolate chips1'),
            ],
          );
        },
      ),
    );
  }
}
