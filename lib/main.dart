import 'package:flutter/material.dart';
import 'package:practice_project/provider/cart_provider.dart';
import 'package:practice_project/provider/favorite_provider.dart';
import 'package:practice_project/screens/auth/login_screen.dart';
import 'package:practice_project/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          iconTheme: const IconThemeData(color: Colors.black),
          appBarTheme: const AppBarTheme(backgroundColor: Color.fromRGBO(238, 238, 238, 1), centerTitle: true, titleTextStyle: TextStyle(color: Colors.white)),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
