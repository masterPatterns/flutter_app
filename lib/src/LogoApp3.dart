import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/GrowTransition.dart';
import 'package:flutter_app/src/LogoWidget.dart';

class LogoApp3 extends StatefulWidget {
    _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp3> with SingleTickerProviderStateMixin {
    Animation animation;
    AnimationController controller;

    initState() {
        super.initState();
        controller = AnimationController(
                duration: const Duration(milliseconds: 2000), vsync: this);
        final CurvedAnimation curve =
        CurvedAnimation(parent: controller, curve: Curves.easeIn);
        animation = Tween(begin: 0.0, end: 300.0).animate(curve);
        controller.forward();
    }

    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("GrowTransition"),
                actions: <Widget>[],
            ),
            body: GrowTransition(child: LogoWidget(), animation: animation),
        );
    }

    dispose() {
        controller.dispose();
        super.dispose();
    }
}