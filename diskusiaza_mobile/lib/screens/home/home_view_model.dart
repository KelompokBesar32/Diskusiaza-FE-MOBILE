import 'dart:io';

import 'package:diskusiaza_mobile/models/api/thread_api.dart';
import 'package:diskusiaza_mobile/models/api/user_thread_api.dart';
import 'package:diskusiaza_mobile/models/thread.dart';
import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewModel extends ChangeNotifier {
  DataState dataState = DataState.loading;

  final UserThreadApi _userThreadApi = UserThreadApi();

  void changeState(DataState state) {
    dataState = state;
    notifyListeners();
  }

  void postThread(
    String title,
    String content,
    int category,
    File? file,
    var context,
  ) async {
    changeState(DataState.loading);

    print('11');

    try {
      print('22');
      SharedPreferences tokenPrefs = await SharedPreferences.getInstance();

      var myToken = tokenPrefs.getString('token');

      await _userThreadApi.postThread(
        myToken!,
        title,
        content,
        category,
        file,
        context,
      );

      changeState(DataState.filled);
    } catch (e) {
      changeState(DataState.error);
      print('33');
      print('error: $e');
    }
  }

  final ThreadApi _threadApi = ThreadApi();

  List<Thread> allThreadList = [];

  void getAllThread(var context) async {
    changeState(DataState.loading);

    try {
      SharedPreferences tokenPrefs = await SharedPreferences.getInstance();

      var myToken = tokenPrefs.getString('token');

      allThreadList = await _threadApi.getAllThread(myToken!, context);

      changeState(DataState.filled);
    } catch (e) {
      changeState(DataState.error);
      print('error: $e');
    }
  }
}
