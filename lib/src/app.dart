import 'package:flutter/material.dart';
import 'package:foodito/src/pages/home_page.dart';
import 'package:get/get.dart';
import 'package:persian_fonts/persian_fonts.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Add support for Persian locale
      locale: Locale('fa', 'IR'),
      fallbackLocale: Locale('fa', 'IR'),

      // Theme
      theme: ThemeData(
        fontFamily: PersianFonts.Shabnam.fontFamily,
      ),

      home: HomePage(),
    );
  }
}