import 'dart:math';

import 'package:flutter/material.dart';
import 'package:foodito/src/widgets/bottom_app_bar.dart';
import 'package:foodito/src/widgets/top_app_bar.dart';

class MainPage extends StatefulWidget {
  final Widget? child;
  final bool b1;
  final bool b2;
  final bool b3;
  final bool b4;

  const MainPage({
    Key? key,
    this.child,
    this.b1 = false,
    this.b2 = false,
    this.b3 = false,
    this.b4 = false,
  }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState(
        child: child,
        b1: b1,
        b2: b2,
        b3: b3,
        b4: b4,
      );
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late AnimationController _animation;
  late AnimationController _animationCtrlIcons;
  late Animation<double> _animationIcon;
  Widget? child;
  bool b1;
  bool b2;
  bool b3;
  bool b4;

  _MainPageState({
    this.child,
    this.b1 = false,
    this.b2 = false,
    this.b3 = false,
    this.b4 = false,
  });

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    _animationCtrlIcons = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    _animationIcon = CurvedAnimation(
      curve: Curves.easeIn,
      parent: _animationCtrlIcons,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              TopAppBar(),
              child ?? Container(),
            ],
          ),
        ),
        bottomNavigationBar: buildBottomAppBar(b1: b1, b2: b2, b3: b3, b4: b4),
        floatingActionButton: SizedBox(
          height: 56,
          width: 56,
          child: FittedBox(
            child: FloatingActionButton(
              elevation: 0,
              onPressed: () {
                if (_animation.isDismissed) {
                  _animation.forward();
                  _animationCtrlIcons.forward();
                } else if (_animation.isCompleted) {
                  _animation.reverse();
                  _animationCtrlIcons.reverse();
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
                          )),
                      Opacity(
                          opacity: 1 - _animation.value,
                          child: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..rotateZ(pi * _animation.value),
                            child: Icon(Icons.add_rounded),
                          )),
                    ],
                  );
                },
              ),
              backgroundColor: Colors.deepOrange.shade700,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
      AnimatedBuilder(
        animation: _animationIcon,
        builder: (context, child) {
          return Positioned(
            bottom: 36,
            child: Visibility(
              visible: _animationIcon.value != 0,
              child: Transform.translate(
                offset: Offset(
                    64 * _animationIcon.value, -32 * _animationIcon.value),
                child: Opacity(
                  opacity: _animationIcon.value,
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.greenAccent.shade700,
                    ),
                    child: Icon(
                      Icons.fastfood_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      AnimatedBuilder(
        animation: _animationIcon,
        builder: (context, child) {
          return Positioned(
            bottom: 36,
            child: Visibility(
              visible: _animationIcon.value != 0,
              child: Transform.translate(
                offset: Offset(
                    -64 * _animationIcon.value, -32 * _animationIcon.value),
                child: Opacity(
                  opacity: _animationIcon.value,
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow.shade700,
                    ),
                    child: Icon(
                      Icons.male_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      AnimatedBuilder(
        animation: _animationIcon,
        builder: (context, child) {
          return Positioned(
            bottom: 36,
            child: Visibility(
              visible: _animationIcon.value != 0,
              child: Transform.translate(
                offset: Offset(
                    0, -(sqrt(pow(64, 2) + pow(32, 2))) * _animationIcon.value),
                child: Opacity(
                  opacity: _animationIcon.value,
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: Icon(
                      Icons.water,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    ]);
  }
}
