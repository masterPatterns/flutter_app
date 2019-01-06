import 'package:flutter/material.dart';

class TapboxB extends StatelessWidget {
    TapboxB({Key key, this.active: false, @required this.onChanged})
            : super(key: key);

    final bool active;
    final ValueChanged<bool> onChanged;

    void _handleTap() {
        onChanged(!active);
    }

    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('The parent widget manages the widget’s state'),
                actions: <Widget>[
                    new IconButton(icon: const Icon(Icons.list), onPressed: null)
                ],
            ),
            body: GestureDetector(
                onTap: _handleTap,
                child: Container(
                    child: Center(
                        child: Text(
                            active ? 'Active' : 'Inactive',
                            style: TextStyle(fontSize: 32.0, color: Colors.white),
                        ),
                    ),
                    width: 200.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                        color: active ? Colors.lightGreen[700] : Colors.grey[600],
                    ),
                ),
            ),
        );
    }
}