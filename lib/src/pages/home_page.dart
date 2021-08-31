import 'package:flutter/material.dart';
import 'package:foodito/src/pages/main_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainPage(
      b1: true,
      child: Text('Hello World'),
    );
  }
}