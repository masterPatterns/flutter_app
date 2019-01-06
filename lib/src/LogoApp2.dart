import 'package:flutter/material.dart';
import 'package:flutter_app/src/animated_logo.dart';

class LogoApp2 extends StatefulWidget {
  _LogoApp2State createState() => _LogoApp2State();
}

class _LogoApp2State extends State<LogoApp2>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween(begin: 0.0, end: 300.0).animate(controller);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("AnimationControllerReverse"),
            actions: <Widget>[],
        ),
        body: AnimatedLogo(animation: animation),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
