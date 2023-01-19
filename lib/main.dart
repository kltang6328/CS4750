import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/home.dart';
import 'package:my_first_flutter_app/choose.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Finder',
      home: Home(),
    );
  }
}
