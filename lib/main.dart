import 'package:flutter/material.dart';
import 'package:lastest_broo/page/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Montserrat',
        scaffoldBackgroundColor: const Color(0xffF5F3EF)
      ),
      home: HomePage()
    );
  }
}