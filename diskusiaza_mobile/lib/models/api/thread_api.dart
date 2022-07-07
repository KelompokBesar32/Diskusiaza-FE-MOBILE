import 'package:diskusiaza_mobile/models/thread.dart';
import 'package:diskusiaza_mobile/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ThreadApi {
  final API _api = API();

  Future<List<Thread>> getAllThread(String getToken, var context) async {
    try {
      var response = await _api.dio.get('therad');

      ResponseResultThread responseResult =
          ResponseResultThread.fromJson(response.data);

      List<Thread> threadList =
          responseResult.data!.map((e) => Thread.fromJson(e)).toList();

      return threadList;
    } catch (e) {
      return [];
    }
  }

  Future<Thread> getThreadById(String getToken, int getId, var context) async {
    try {
      var response = await _api.dio.get('therad/$getId');

      ResponseResultThreadDetail responseResult =
          ResponseResultThreadDetail.fromJson(response.data);

      return responseResult.data;
    } catch (e) {
      return Thread();
    }
  }

  Future<List<Thread>> getThreadByUser(String getToken, var context) async {
    try {
      var response = await _api.dio.get('user/therad');

      ResponseResultThread responseResult =
          ResponseResultThread.fromJson(response.data);

      List<Thread> threadList =
          responseResult.data!.map((e) => Thread.fromJson(e)).toList();

      return threadList;
    } catch (e) {
      return [];
    }
  }

  Future postLikeThread(String getToken, int getId, var context) async {
    try {
      var response = await _api.dio.post(
        'therad/like',
        data: {
          "therad_id": getId,
        },
      );

      print('Response : ${response.statusMessage}');

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: "${response.statusMessage}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      return null;
    }
  }
}
