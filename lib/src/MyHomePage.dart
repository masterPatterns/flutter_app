import 'package:flutter/material.dart';
import 'package:flutter_app/src/LogoApp.dart';
import 'package:flutter_app/src/MyImagePage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var titleText = Container(
      padding: EdgeInsets.all(20.0),
      child: Text(
        'Strawberry Pavlova',
        style: TextStyle(
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
          fontSize: 30.0,
        ),
      ),
    );

    var subTitle = Text(
      '''
Pavlova is a meringue-based dessert named after the Russian ballerina Anna Pavlova. Pavlova features a crisp crust and soft, light inside, topped with fruit and whipped cream.
''',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Georgia',
        fontSize: 25.0,
      ),
    );

    var packedRow = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.black),
        Icon(Icons.star, color: Colors.black),
      ],
    );

    var ratings = Container(
      padding: EdgeInsets.all(20.0),
      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          packedRow,
          Expanded(
            child: Text(
              '170 Reviews',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontFamily: 'Roboto',
                letterSpacing: 0.5,
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    );

    var descTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18.0,
      height: 2.0,
    );

    void makeDialog(context, String title, String content) {
        showDialog(
                context: context,
                builder: (BuildContext context) {
                    return AlertDialog(
                        title: new Text(title),
                        content: new Text(content),
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

    // DefaultTextStyle.merge allows you to create a default text
    // style that is inherited by its child and all subsequent children.
    var iconList = DefaultTextStyle.merge(
      style: descTextStyle,
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                    makeDialog(context, "PREP 버튼 클릭", "PREP 버튼을 클릭하였습니다.");
                });
              },
              child: Column(
                children: [
                  Icon(Icons.kitchen, color: Colors.green[500]),
                  Text('PREP:'),
                  Text('25 min'),
                ],
              ),
            ),

            InkWell(
              highlightColor: Colors.red,
              splashColor: Colors.red,
              onTap: () {
                  makeDialog(context, "COOK 버튼 클릭", "COOK 버튼을 클릭하였습니다.");
              },
              child: Column(
                children: [
                  Icon(Icons.timer, color: Colors.green[500]),
                  Text('COOK:'),
                  Text('1 hr'),
                ],
              ),
            ),
//            Column(
//              children: [
//                Icon(Icons.timer, color: Colors.green[500]),
//                Text('COOK:'),
//                Text('1 hr'),
//              ],
//            ),
            Column(
              children: [
                Icon(Icons.restaurant, color: Colors.green[500]),
                Text('FEEDS:'),
                Text('4-6'),
              ],
            ),
          ],
        ),
      ),
    );

    var leftColumn = Container(
      padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
      child: Column(
        children: [
          titleText,
          subTitle,
          ratings,
          iconList,
        ],
      ),
    );

    var mainImage = Image.asset(
      'images/pavlova.jpg',
      fit: BoxFit.cover,
    );

    void _pushImageSaved() {
      Navigator.of(context).push(
        new MaterialPageRoute<void>(
          builder: (BuildContext context) {
            return MyImagePage(title: 'image examples');
          },
        ),
      );
    }

    void _animationController() {
      Navigator.of(context).push(
        new MaterialPageRoute<void>(
          builder: (BuildContext context) {
            return LogoApp();
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
            new IconButton(icon: const Icon(Icons.access_time), onPressed: _animationController),
            new IconButton(icon: const Icon(Icons.image), onPressed: _pushImageSaved),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 30.0),
//            height: 850.0,
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  mainImage,
                  Container(
//                    width: 440.0,
                    child: leftColumn,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
