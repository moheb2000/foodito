import 'package:flutter/material.dart';

BottomAppBar buildBottomAppBar() => BottomAppBar(
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        child: Row(
          children: [
            _iconBottomAppBar(Icons.home_rounded, 'خانه', true),
            _iconBottomAppBar(Icons.fastfood_rounded, 'لیست غذاها', false),
            Spacer(),
            _iconBottomAppBar(Icons.history_rounded, 'تاریخچه', false),
            _iconBottomAppBar(Icons.settings_rounded, 'تنظیمات', false),
          ],
        ),
      ),
    );

Widget _iconBottomAppBar(IconData icon, String title, bool isActive) {
  return GestureDetector(
    onTap: () {},
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 24,
            color: isActive ? Colors.deepOrange.shade700 : Colors.grey,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.deepOrange.shade700 : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget separator() {
  return SizedBox(
    width: 24,
  );
}
