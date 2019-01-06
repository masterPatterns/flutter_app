import 'package:flutter/material.dart';
import 'package:flutter_app/src/ParentWidget.dart';

class TapboxA extends StatefulWidget {
    TapboxA({Key key}) : super(key: key);

    @override
    _TapboxAState createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
    bool _active = false;

    void _handleTap() {
        setState(() {
            _active = !_active;
        });
    }

    void _pushSaved() {
        Navigator.of(context).push(
            new MaterialPageRoute<void>(
                builder: (BuildContext context) {
                    return ParentWidget();
                },
            ),
        );
    }

    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('The widget manages its own state'),
                actions: <Widget>[
                    new IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved)
                ],
            ),
            body: GestureDetector(
                onTap: _handleTap,
                child: Container(
                    child: Center(
                        child: Text(
                            _active ? 'Active' : 'Inactive',
                            style: TextStyle(fontSize: 32.0, color: Colors.white),
                        ),
                    ),
                    width: 200.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                        color: _active ? Colors.lightGreen[700] : Colors.grey[600],
                    ),
                ),
            ),
        );
    }
}