import 'package:flutter/material.dart';
import 'package:flutter_app/src/TapboxB.dart';

class ParentWidget extends StatefulWidget {
    @override
    _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
    bool _active = false;

    void _handleTapboxChanged(bool newValue) {
        setState(() {
            _active = newValue;
        });
    }

    @override
    Widget build(BuildContext context) {
        return Container(
            child: TapboxB(
                active: _active,
                onChanged: _handleTapboxChanged,
            ),
        );
    }
}