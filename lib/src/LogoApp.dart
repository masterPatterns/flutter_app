
import 'package:flutter/material.dart';
import 'package:flutter_app/src/animated_logo.dart';

class LogoApp extends StatefulWidget {
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller.forward();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimationController"),
        actions: <Widget>[],
      ),
      body: AnimatedLogo(animation: animation),

//      Center(
//        child: Container(
//          margin: EdgeInsets.symmetric(vertical: 10.0),
//          height: animation.value,
//          width: animation.value,
//          child: FlutterLogo(),
//        ),
//      ),
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}
