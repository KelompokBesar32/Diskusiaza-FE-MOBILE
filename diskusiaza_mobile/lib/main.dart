import 'package:diskusiaza_mobile/screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telegram',
      theme: ThemeData(
        primaryColor: const Color(0xFF5682a3),
        accentColor: const Color(0xFFe7ebf0),
        backgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
