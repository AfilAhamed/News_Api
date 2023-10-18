import 'package:flutter/material.dart';
import 'package:news_api/view/home_sceen/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.white),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
