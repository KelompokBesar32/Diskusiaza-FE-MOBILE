import 'package:diskusiaza_mobile/models/user_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final UserModel user;
  const HomeScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.user.email!),
          ],
        ),
      ),
    );
  }
}
