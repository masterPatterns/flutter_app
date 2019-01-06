import 'package:flutter/material.dart';
import 'package:flutter_app/src/animated_logo2.dart';

class LogoApp4 extends StatefulWidget {
  _LogoApp4State createState() => _LogoApp4State();
}

class _LogoApp4State extends State<LogoApp4> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

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
            title: Text("AnimationComplete"),
            actions: <Widget>[],
        ),
        body: AnimatedLogo2(animation: animation),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
