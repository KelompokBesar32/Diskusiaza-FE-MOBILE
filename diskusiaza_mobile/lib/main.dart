import 'package:diskusiaza_mobile/screens/login/login_screen.dart';
import 'package:diskusiaza_mobile/screens/profile/profile_edit_screen.dart';
import 'package:diskusiaza_mobile/screens/profile/profile_screen_view_model.dart';
import 'package:diskusiaza_mobile/screens/register/register_screen.dart';
import 'package:diskusiaza_mobile/screens/splash/splash_screen.dart';
import 'package:diskusiaza_mobile/screens/wrapper/wrapper_screen.dart';
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
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthServices()),
        ChangeNotifierProvider(create: (_) => ProfileScreenViewModel()),
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
        navigatorKey: navigatorKey,
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/wrapper': (context) => const WrapperScreen(),
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),
          '/profileEdit': (context) => const ProfileEditScreen(),
        },
      ),
    );
  }
}
