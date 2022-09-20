import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();

  bool isFavortie;
  final Function toExecute;
  Heart(this.isFavortie, this.toExecute);
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _colorAnimation;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);

    _colorAnimation = ColorTween(begin: Colors.grey[300], end: Colors.red)
        .animate(_controller);

    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 30, end: 50), weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 30), weight: 50)
    ]).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          widget.isFavortie = true;
        });
      } else {
        setState(() {
          widget.isFavortie = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isFavortie == true) {
      _controller.forward();
    }
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => IconButton(
        icon: Icon(
          Icons.favorite,
          color: _colorAnimation.value,
          size: _sizeAnimation.value,
        ),
        onPressed: () {
          widget.isFavortie ? _controller.reverse() : _controller.forward();
          widget.toExecute();
        },
      ),
    );
  }
}
