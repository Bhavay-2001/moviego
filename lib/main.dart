import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:moviego/HomePage.dart';

void main() {
  runApp(MovieGO());
}
class MovieGO extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Color(0xFF0B0B0C));
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black54,
      ),
      home: HomePage(),
    );
  }
}


