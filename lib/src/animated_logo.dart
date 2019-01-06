import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AnimatedLogo extends AnimatedWidget {
    AnimatedLogo({Key key, Animation<double> animation})
            : super(key: key, listenable: animation);

    Widget build(BuildContext context) {
        final Animation<double> animation = listenable;
        return Center(
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                height: animation.value,
                width: animation.value,
                child: FlutterLogo(),
            ),
        );
    }
}