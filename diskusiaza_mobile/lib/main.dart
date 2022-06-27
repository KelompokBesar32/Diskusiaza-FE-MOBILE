import 'package:diskusiaza_mobile/screen/login/login_screen.dart';
import 'package:diskusiaza_mobile/screen/register/register_screen.dart';
import 'package:diskusiaza_mobile/screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diskuziaza',
      theme: ThemeData(
        primaryColor: const Color(0xFF5682a3),
        backgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFFe7ebf0),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
      },
    );
  }
}
