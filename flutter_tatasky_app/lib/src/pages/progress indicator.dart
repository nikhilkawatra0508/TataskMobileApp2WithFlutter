import 'package:flutter/material.dart';
import 'package:gradient_progress/gradient_progress.dart';
class ExampleHomePage extends StatefulWidget {
  @override
  _ExampleHomePageState createState() => _ExampleHomePageState();
}

class _ExampleHomePageState extends State<ExampleHomePage> with TickerProviderStateMixin{

  AnimationController _animationController;

  @override
  void initState() {
    _animationController =
    new AnimationController(vsync: this, duration: Duration(seconds: 0));
    _animationController.addListener(() => setState(() {}));
    _animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Center(
          child: GradientCircularProgressIndicator(
            gradientColors: [Colors.yellow, Colors.red],
            radius: 30,
            strokeWidth: 4.0,
            value: new Tween(begin: 0.0, end: 2.0)
                .animate(CurvedAnimation(
                parent: _animationController, curve: Curves.decelerate))
                .value,
          ),
        ),
      );
  }
}