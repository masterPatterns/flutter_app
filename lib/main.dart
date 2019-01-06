import 'package:flutter/material.dart';
import 'package:flutter_app/src/RandomWords.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      initialRoute: '/',
//      routes: {
//        '/': (context) => RandomWords(),
//      },
      home: RandomWords(),
    );
  }
}

//class gridImage {
//    gridImage(BuildContext context);
////    Widget build(BuildContext context)
////    {
//        Navigator.of(context).push(
//            new MaterialPageRoute<void>(
//                builder: (BuildContext context) {
//                    return MyGridImagePage(title: 'grid image examples');
//                },
//            ),
//        );
////    }
//}


