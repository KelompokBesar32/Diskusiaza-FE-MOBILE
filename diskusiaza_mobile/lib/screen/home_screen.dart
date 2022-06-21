// Contoh Untuk Testing Splash Screen

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diskusiaza'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.notifications),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.mail),
          )
        ],
      ),
      body: Center(
        child: Text(
          'Home',
          style: TextStyle(fontSize: 60),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue),
        BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
            backgroundColor: Colors.blue),
        BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Trending',
            backgroundColor: Colors.blue),
        BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Account',
            backgroundColor: Colors.blue),
      ]),
    );
  }
}
