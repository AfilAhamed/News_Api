import 'package:flutter/material.dart';
import 'package:news_api/controller/categorycontroller.dart';
import 'package:news_api/controller/homescreencontroller.dart';
import 'package:news_api/view/home_screen/homescreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeControl(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryController(),
        )
      ],
      child: MaterialApp(
        title: 'NewsApp',
        theme: ThemeData(useMaterial3: true),
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
