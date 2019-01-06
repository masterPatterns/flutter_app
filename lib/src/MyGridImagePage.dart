import 'package:flutter/material.dart';

class MyGridImagePage extends StatefulWidget {
    MyGridImagePage({Key key, this.title}) : super(key: key);

    final String title;

    @override
    _MyGridImagePageState createState() => _MyGridImagePageState();
}

List<Container> _buildGridTileList(int count) {
    List<Container> containers = List<Container>.generate(
    count,
    (int index) =>
    Container(child: Image.asset('images/pic${index + 1}.jpg')));
    return containers;
}

Widget buildGrid() {
    return GridView.extent(
        maxCrossAxisExtent: 150.0,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: _buildGridTileList(30),
    );
}

class _MyGridImagePageState extends State<MyGridImagePage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(widget.title),
            ),
            body: Center(
                child: buildGrid(),
            ),
        );
    }
}