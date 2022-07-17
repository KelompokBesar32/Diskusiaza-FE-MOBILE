import 'package:dio/dio.dart';
import 'package:diskusiaza_mobile/models/comment.dart';
import 'package:diskusiaza_mobile/models/thread.dart';
import 'package:diskusiaza_mobile/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ThreadApi {
  final API _api = API();

  Future<List<Thread>> getAllThread(String getToken, var context) async {
    try {
      var response = await _api.dio.get('t/therad');

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
      var response = await _api.dio.get('t/therad/$getId');

      ResponseResultThreadDetail responseResult =
          ResponseResultThreadDetail.fromJson(response.data);

      return responseResult.data;
    } catch (e) {
      return Thread();
    }
  }

  Future<List<Thread>> getThreadByUser(String getToken, var context) async {
    try {
      var response = await _api.dio.get('t/user/therad');

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
      await _api.dio.post(
        't/therad/like',
        data: {
          "therad_id": getId,
        },
      );

      return true;
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        await unLikeThread(getToken, getId, context);
      }

      return false;
    }
  }

  Future unLikeThread(String getToken, int getId, var context) async {
    try {
      await _api.dio.delete(
        't/therad/like',
        data: {
          "therad_id": getId,
        },
      );
    } on DioError catch (e) {
      String msg = e.response!.data
          .toString()
          .replaceAll('{message: ', '')
          .replaceAll('}', '');
      Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  Future<List<Comment?>?> getCommentByThread(int getId, var context) async {
    try {
      var response = await _api.dio.get('t/comment/therad/$getId');

      ResponseResultComment responseResult =
          ResponseResultComment.fromJson(response.data);

      return responseResult.comment;
    } on DioError catch (e) {
      String msg = e.response!.data
          .toString()
          .replaceAll('{message: ', '')
          .replaceAll('}', '');
      Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    return null;
  }

  Future postCreateComment(int getId, String getComment, var context) async {
    try {
      var formData = FormData.fromMap({
        "isi": getComment,
        "therad_id": getId,
      });

      var response = await _api.dio.post(
        't/comment',
        data: formData,
      );

      if (response.statusCode == 201) {
        Fluttertoast.showToast(
          msg: "Successful Comment",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }

      Navigator.pop(context);
    } on DioError catch (e) {
      String msg = e.response!.data
          .toString()
          .replaceAll('{message: ', '')
          .replaceAll('}', '');
      Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  Future postReplyComment(int getId, String getComment, var context) async {
    try {
      var formData = FormData.fromMap({
        "isi": getComment,
        "comment_id": getId,
      });

      var response = await _api.dio.post(
        't/reply/comment',
        data: formData,
      );

      if (response.statusCode == 201) {
        Fluttertoast.showToast(
          msg: "Successful Reply Comment",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }

      Navigator.pop(context);
    } on DioError catch (e) {
      String msg = e.response!.data
          .toString()
          .replaceAll('{message: ', '')
          .replaceAll('}', '');
      Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}
