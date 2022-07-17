import 'package:diskusiaza_mobile/screens/bookmarks/bookmarks.dart';
import 'package:diskusiaza_mobile/screens/explore/explore_screen.dart';
import 'package:diskusiaza_mobile/screens/follow/followers_screen.dart';
import 'package:diskusiaza_mobile/screens/follow/following_screen.dart';
import 'package:diskusiaza_mobile/screens/home/home_screen.dart';
import 'package:diskusiaza_mobile/screens/home/home_view_model.dart';
import 'package:diskusiaza_mobile/screens/kebijakan/kebijakan_screen.dart';
import 'package:diskusiaza_mobile/screens/login/login_screen.dart';
import 'package:diskusiaza_mobile/screens/message/message_screen.dart';
import 'package:diskusiaza_mobile/screens/notification/notification_screen.dart';
import 'package:diskusiaza_mobile/screens/profile/profile_detail_screen.dart';
import 'package:diskusiaza_mobile/screens/profile/profile_edit_screen.dart';
import 'package:diskusiaza_mobile/screens/profile/profile_screen.dart';
import 'package:diskusiaza_mobile/screens/profile/profile_view_model.dart';
import 'package:diskusiaza_mobile/screens/register/register_screen.dart';
import 'package:diskusiaza_mobile/screens/ruang/ruang_screen.dart';
import 'package:diskusiaza_mobile/screens/splash/splash_screen.dart';
import 'package:diskusiaza_mobile/screens/support/support_screen.dart';
import 'package:diskusiaza_mobile/screens/trending/trending_screen.dart';
import 'package:diskusiaza_mobile/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
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
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: MaterialApp(
        title: 'Diskuziaza',
        theme: ThemeData(
          primaryColor: const Color(0xFF36a5b2),
          backgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: const Color(0xFF007ADD),
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return PageTransition(
                child: const SplashScreen(),
                type: PageTransitionType.fade,
                settings: settings,
              );
            case '/login':
              return PageTransition(
                child: const LoginScreen(),
                type: PageTransitionType.fade,
                settings: settings,
              );
            case '/register':
              return PageTransition(
                child: const RegisterScreen(),
                type: PageTransitionType.fade,
                settings: settings,
              );
            case '/home':
              return PageTransition(
                child: const HomeScreen(),
                type: PageTransitionType.fade,
                settings: settings,
              );
            case '/explore':
              return PageTransition(
                child: const ExploreScreen(),
                type: PageTransitionType.fade,
                settings: settings,
              );
            case '/trending':
              return PageTransition(
                child: const TrendingScreen(),
                type: PageTransitionType.fade,
                settings: settings,
              );
            case '/profile':
              return PageTransition(
                child: const ProfileScreen(),
                type: PageTransitionType.fade,
                settings: settings,
              );
            case '/profileDetail':
              return PageTransition(
                child: const ProfileDetailScreen(),
                type: PageTransitionType.fade,
                settings: settings,
              );
            case '/profileEdit':
              return PageTransition(
                child: const ProfileEditScreen(),
                type: PageTransitionType.fade,
                settings: settings,
              );
            case '/notification':
              return PageTransition(
                child: const NotificationScreen(),
                type: PageTransitionType.fade,
                settings: settings,
              );
            case '/message':
              return PageTransition(
                child: const MessageScreen(),
                type: PageTransitionType.fade,
                settings: settings,
              );
            case '/following':
              return PageTransition(
                child: const FollowingScreen(),
                type: PageTransitionType.fade,
                settings: settings,
              );
            case '/followers':
              return PageTransition(
                child: const FollowersScreen(),
                type: PageTransitionType.fade,
                settings: settings,
              );
            case '/kebijakan':
              return PageTransition(
                child: const KebijakanScreen(),
                type: PageTransitionType.fade,
                settings: settings,
              );
            case '/support':
              return PageTransition(
                child: const SupportScreen(),
                type: PageTransitionType.fade,
                settings: settings,
              );
            case '/bookmarks':
              return PageTransition(
                child: const BookmarksScreen(),
                type: PageTransitionType.fade,
                settings: settings,
              );
            case '/ruang':
              return PageTransition(
                child: const RuangScreen(),
                type: PageTransitionType.fade,
                settings: settings,
              );
            default:
              return null;
          }
        },
      ),
    );
  }
}
