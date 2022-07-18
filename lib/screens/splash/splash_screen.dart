import 'package:diskusiaza_mobile/screens/home/home_view_model.dart';
import 'package:diskusiaza_mobile/screens/profile/profile_view_model.dart';
import 'package:diskusiaza_mobile/services/auth_services.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Provider.of<AuthServices>(context, listen: false).syncUserToken(context);
      Provider.of<AuthServices>(context, listen: false).checkRememberMe();
      Provider.of<ProfileViewModel>(context, listen: false)
          .getFollowers(context);
      Provider.of<ProfileViewModel>(context, listen: false)
          .getFollowing(context);
      Provider.of<ProfileViewModel>(context, listen: false)
          .getDataProfile(context);
      Provider.of<HomeViewModel>(context, listen: false).getAllThread(context);
      Provider.of<HomeViewModel>(context, listen: false)
          .checkUserFollow(context);
      Provider.of<HomeViewModel>(context, listen: false)
          .getTrendingThread(context);
      Provider.of<HomeViewModel>(context, listen: false)
          .checkUserFollowTrending(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 255, 255, 255),
              ]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/images/diskusiaza.png",
                  height: 700.0,
                  width: 700.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
