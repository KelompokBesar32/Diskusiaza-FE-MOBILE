import 'package:diskusiaza_mobile/screens/login/login_screen.dart';
import 'package:diskusiaza_mobile/screens/register/register_screen.dart';
import 'package:diskusiaza_mobile/screens/splash/splash_screen.dart';
import 'package:diskusiaza_mobile/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthServices()),
      ],
      child: MaterialApp(
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
          '/': (context) => const SplashScreen(),
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),
        },
      ),
    );
  }
}
