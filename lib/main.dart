import 'package:flutter/material.dart';
import 'package:practice_project/screens/home_screen.dart';
import 'package:practice_project/screens/login_screen.dart';
import 'package:practice_project/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(),
        iconTheme: const IconThemeData(color: Colors.black),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.amber, centerTitle: true, titleTextStyle: TextStyle(color: Colors.white)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
