import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  // Leave out the height and width so it fills the animating parent
  build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10.0), child: FlutterLogo());
  }
}
