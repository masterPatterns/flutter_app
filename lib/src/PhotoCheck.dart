import 'package:flutter/material.dart';

class PhotoCheck extends StatelessWidget {
    const PhotoCheck({ Key key }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return DecoratedBox(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(const Radius.circular(16.0)),
            ),
            child: const Icon(
                Icons.check,
                size: 32.0,
                color: Colors.white,
            ),
        );
    }
}