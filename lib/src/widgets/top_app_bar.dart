import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var safeTopPadding = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.only(
        top: (safeTopPadding + 16),
        bottom: 16,
        left: 24,
        right: 24,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 2)],
      ),
      child: Text(
        'فودیتو',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.deepOrange.shade700,
        ),
      ),
    );
  }
}
