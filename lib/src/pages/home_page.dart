import 'package:flutter/material.dart';
import 'package:foodito/src/widgets/bottom_app_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Hello'),
      bottomNavigationBar: buildBottomAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_rounded),
        backgroundColor: Colors.deepOrange.shade700,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
