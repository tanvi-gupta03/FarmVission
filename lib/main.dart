import 'package:detect/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isNightMode = false;
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      theme: isNightMode ? ThemeData.dark() : ThemeData.light(),
      title: 'Flutter Demo',
      home: homepage(
        isNightMode: isNightMode,
        onThemeChanged: (bool nightMode) {
          setState(() {
            isNightMode = nightMode;
          });
        },
      ),
    );
  }
}

