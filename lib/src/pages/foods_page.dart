import 'package:flutter/material.dart';
import 'package:foodito/src/pages/main_page.dart';

class FoodsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainPage(
      b2: true,
      child: Text('Hello Foods'),
    );
  }
}