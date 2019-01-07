import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_app/src/PhotoHero.dart';

class HeroAnimation extends StatelessWidget {
    Widget build(BuildContext context) {
        timeDilation = 2.5; // 1.0 means normal animation speed.

        return Scaffold(
            appBar: AppBar(
                title: const Text('Basic Hero Animation'),
            ),
            body: Center(
                child: PhotoHero(
                    photo: 'images/flippers-alpha.png',
                    width: 300.0,
                    onTap: () {
                        Navigator.of(context).push(MaterialPageRoute<void>(
                                builder: (BuildContext context) {
                                    return Scaffold(
                                        appBar: AppBar(
                                            title: const Text('Flippers Page'),
                                        ),
                                        body: Container(
                                            // Set background to blue to emphasize that it's a new route.
                                            color: Colors.lightBlueAccent,
                                            padding: const EdgeInsets.all(16.0),
                                            alignment: Alignment.topLeft,
                                            child: PhotoHero(
                                                photo: 'images/flippers-alpha.png',
                                                width: 100.0,
                                                onTap: () {
                                                    Navigator.of(context).pop();
                                                },
                                            ),
                                        ),
                                    );
                                }
                        ));
                    },
                ),
            ),
        );
    }
}