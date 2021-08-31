import 'package:flutter/material.dart';
import 'package:foodito/src/pages/foods_page.dart';
import 'package:foodito/src/pages/home_page.dart';
import 'package:get/get.dart';

BottomAppBar buildBottomAppBar({
  bool b1 = false,
  bool b2 = false,
  bool b3 = false,
  bool b4 = false,
}) =>
    BottomAppBar(
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        child: Row(
          children: [
            _iconBottomAppBar(Icons.home_rounded, 'خانه', b1),
            _iconBottomAppBar(Icons.fastfood_rounded, 'لیست غذاها', b2),
            Spacer(),
            _iconBottomAppBar(Icons.history_rounded, 'تاریخچه', b3),
            _iconBottomAppBar(Icons.settings_rounded, 'تنظیمات', b4),
          ],
        ),
      ),
    );

Widget _iconBottomAppBar(IconData icon, String title, bool isActive) {
  return GestureDetector(
    onTap: () {
      if (!isActive) {
        if (title == 'خانه') {
          Get.off(
            () => HomePage(),
            transition: Transition.fadeIn,
          );
        } else if (title == 'لیست غذاها') {
          Get.off(
            () => FoodsPage(),
            transition: Transition.fadeIn,
          );
        }
      }
    },
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
