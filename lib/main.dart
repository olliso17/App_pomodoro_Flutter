import 'package:flutter/material.dart';
import 'package:pomodoro_app/button_vinte_cinco.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomodoro',
      home: ButtonPomodoroVinteCinco(),
    );
  }
}
