import "package:flutter/material.dart";
import 'package:earlylife/screens/home_screen.dart';
import 'package:earlylife/utils/const.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      theme: Constants.lighTheme(context),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
