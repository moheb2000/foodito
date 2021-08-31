import 'dart:math';

import 'package:flutter/material.dart';
import 'package:foodito/src/widgets/bottom_app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _animation;

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Hello'),
      bottomNavigationBar: buildBottomAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_animation.isDismissed) {
            _animation.forward();
          } else if (_animation.isCompleted) {
            _animation.reverse();
          }
        },
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Stack(
              children: [
                Opacity(
                  opacity: _animation.value,
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                    ..rotateZ(pi * _animation.value),
                    child: Icon(Icons.close_rounded),
                  )
                ),
                Opacity(
                  opacity: 1 - _animation.value,
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..rotateZ(pi * _animation.value),
                    child: Icon(Icons.add_rounded),
                  )
                ),
              ],
            );
          },
        ),
        backgroundColor: Colors.deepOrange.shade700,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
