import 'package:flutter/material.dart';
import 'package:flutter_app/src/MyGridImagePage.dart';

class MyImagePage extends StatefulWidget {
    MyImagePage({Key key, this.title}) : super(key: key);

    final String title;

    @override
    _MyImagePageState createState() => _MyImagePageState();
}

class _MyImagePageState extends State<MyImagePage> {
    @override
    Widget build(BuildContext context) {
        var container = Container(
            decoration: BoxDecoration(
                color: Colors.black26,
            ),
            child: Column(
                children: [
                    Row(
                        children: [
                            Expanded(
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 10.0, color: Colors.black38),
                                        borderRadius:
                                        const BorderRadius.all(const Radius.circular(8.0)),
                                    ),
                                    margin: const EdgeInsets.all(4.0),
                                    child: Image.asset('images/pic1.jpg'),
                                ),
                            ),
                            Expanded(
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 10.0, color: Colors.black38),
                                        borderRadius:
                                        const BorderRadius.all(const Radius.circular(8.0)),
                                    ),
                                    margin: const EdgeInsets.all(4.0),
                                    child: Image.asset('images/pic2.jpg'),
                                ),
                            ),
                        ],
                    ),
                    Row(
                        children: [
                            Expanded(
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 10.0, color: Colors.black38),
                                        borderRadius:
                                        const BorderRadius.all(const Radius.circular(8.0)),
                                    ),
                                    margin: const EdgeInsets.all(4.0),
                                    child: Image.asset('images/pic3.jpg'),
                                ),
                            ),
                            Expanded(
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 10.0, color: Colors.black38),
                                        borderRadius:
                                        const BorderRadius.all(const Radius.circular(8.0)),
                                    ),
                                    margin: const EdgeInsets.all(4.0),
                                    child: Image.asset('images/pic4.jpg'),
                                ),
                            ),
                        ],
                    ),
                ],
            ),
        );

        var stack = Container(
            child: Stack(
                alignment: const Alignment(0.1, 0.8),
                children: [
                    CircleAvatar(
                        backgroundImage: AssetImage('images/pic1.jpg'),
                        radius: 100.0,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.black45,
                        ),
                        child: Text(
                            'Mia B',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                            ),
                        ),
                    ),
                ],
            ),
        );

        void _pushGridImageSaved() {
            Navigator.of(context).push(
                new MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                        return MyGridImagePage(title: 'grid image examples');
                    },
                ),
            );
        }

        return Scaffold(
            appBar: AppBar(
                title: Text(widget.title),
                actions: <Widget>[
                    new IconButton(
                            icon: const Icon(Icons.image_aspect_ratio),
                            onPressed: _pushGridImageSaved)
                ],
            ),
            body: ListView(
                children: <Widget>[
                    Center(
                        child: container,
                    ),
                    Center(
                        child: stack,
                    ),
                ],
            ),
        );
    }
}