import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/src/Photos.dart';
import 'package:flutter_app/src/PhotoCheck.dart';

class PhotoItem extends StatefulWidget {
    PhotoItem({
        Key key,
        this.photos,
        this.color,
        this.onTap,
        this.selected,
    }) : super(key: key);

    final Photos photos;
    final Color color;
    final VoidCallback onTap;
    final bool selected;

    @override
    _PhotoItemState createState() => _PhotoItemState();
}

class _PhotoItemState extends State<PhotoItem> with TickerProviderStateMixin {

    AnimationController _selectController;
    Animation<double> _stackScaleAnimation;
    Animation<RelativeRect> _imagePositionAnimation;
    Animation<double> _checkScaleAnimation;
    Animation<double> _checkSelectedOpacityAnimation;

    AnimationController _replaceController;
    Animation<Offset> _replaceNewPhotoAnimation;
    Animation<Offset> _replaceOldPhotoAnimation;
    Animation<double> _removeCheckAnimation;

    Photos _oldPhoto;
    Photos _newPhoto; // non-null during a remove animation

    @override
    void initState() {
        super.initState();

        _oldPhoto = widget.photos;

        _selectController = AnimationController(
                duration: const Duration(milliseconds: 300),
                vsync: this
        );
        final Animation<double> easeSelection = CurvedAnimation(
            parent: _selectController,
            curve: Curves.easeIn,
        );
        _stackScaleAnimation = Tween<double>(begin: 1.0, end: 0.85).animate(easeSelection);
        _checkScaleAnimation = Tween<double>(begin: 0.0, end: 1.25).animate(easeSelection);
        _checkSelectedOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(easeSelection);
        _imagePositionAnimation = RelativeRectTween(
            begin: const RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
            end: const RelativeRect.fromLTRB(12.0, 12.0, 12.0, 12.0),
        ).animate(easeSelection);

        _replaceController = AnimationController(
                duration: const Duration(milliseconds: 300),
                vsync: this
        );

        final Animation<double> easeInsert = CurvedAnimation(
            parent: _replaceController,
            curve: Curves.easeIn,
        );

        _replaceNewPhotoAnimation = Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
        ).animate(easeInsert);

        _replaceOldPhotoAnimation = Tween<Offset>(
            begin: const Offset(0.0, 0.0),
            end: const Offset(-1.0, 0.0),
        ).animate(easeInsert);

        _removeCheckAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
            CurvedAnimation(
                parent: _replaceController,
                curve: Interval(0.0, 0.25, curve: Curves.easeIn),
            ),
        );

    }

    @override
    void dispose() {
        _selectController.dispose();
        _replaceController.dispose();
        super.dispose();
    }

    @override
    void didUpdateWidget(PhotoItem oldWidget) {
        super.didUpdateWidget(oldWidget);

        if (widget.photos != oldWidget.photos)
            _replace(oldWidget.photos, widget.photos);
        if (widget.selected != oldWidget.selected)
            _select();
    }

    Future<void> _replace(Photos oldPhoto, Photos newPhoto) async {
        try {
            setState(() {
                _oldPhoto = oldPhoto;
                _newPhoto = newPhoto;
            });
            await _replaceController.forward().orCancel;
            setState(() {
                _oldPhoto = newPhoto;
                _newPhoto = null;
                _replaceController.value = 0.0;
                _selectController.value = 0.0;
            });
        } on TickerCanceled {
            print('canceled!'); //never reached...
        }
    }

    void _select() {
        if (widget.selected)
            _selectController.forward();
        else
            _selectController.reverse();
    }

    Widget build(BuildContext context) {
        return Stack(
            children: <Widget>[
                Positioned.fill(
                    child: ClipRect(
                        child: SlideTransition(
                            position: _replaceOldPhotoAnimation,
                            child: Material(
                                color: widget.color,
                                child: InkWell(
                                    onTap: widget.onTap,
                                    child: ScaleTransition(
                                        scale: _stackScaleAnimation,
                                        child: Stack(
                                            children: <Widget>[
                                                PositionedTransition(
                                                    rect: _imagePositionAnimation,
                                                    child: Image.asset(
                                                        _oldPhoto.asset,
                                                        fit: BoxFit.cover,
                                                    ),
                                                ),
                                                Positioned(
                                                    top: 0.0,
                                                    left: 0.0,
                                                    child: FadeTransition(
                                                        opacity: _checkSelectedOpacityAnimation,
                                                        child: FadeTransition(
                                                            opacity: _removeCheckAnimation,
                                                            child: ScaleTransition(
                                                                alignment: Alignment.topLeft,
                                                                scale: _checkScaleAnimation,
                                                                child: const PhotoCheck(),
                                                            ),
                                                        ),
                                                    ),
                                                ),
                                                PositionedTransition(
                                                    rect: _imagePositionAnimation,
                                                    child: Container(
                                                        margin: const EdgeInsets.all(8.0),
                                                        alignment: Alignment.topRight,
                                                        child: Text(
                                                            widget.photos.id.toString(),
                                                            style: TextStyle(color: Colors.green),
                                                        ),
                                                    ),
                                                ),
                                            ],
                                        ),
                                    ),
                                ),
                            ),
                        ),
                    ),
                ),
                Positioned.fill(
                    child: ClipRect(
                        child: SlideTransition(
                            position: _replaceNewPhotoAnimation,
                            child: _newPhoto == null ? null : Image.asset(
                                _newPhoto.asset,
                                fit: BoxFit.cover,
                            ),
                        ),
                    ),
                ),
            ],
        );
    }
}