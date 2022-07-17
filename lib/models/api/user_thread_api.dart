import 'dart:io';

import 'package:dio/dio.dart';
import 'package:diskusiaza_mobile/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserThreadApi {
  final API _api = API();

  Future postThread(
    String getToken,
    String title,
    String content,
    int category,
    File? file,
    String? fileName,
    var context,
  ) async {
    try {
      _api.dio.options.headers["Authorization"] = "Bearer $getToken";

      dynamic formData;

      if (file == null) {
        formData = FormData.fromMap({
          "judul": title,
          "isi": content,
          "kategori_therad_id": category,
        });
      } else {
        formData = FormData.fromMap({
          "judul": title,
          "isi": content,
          "file": await MultipartFile.fromFile(
            file.path,
            filename: fileName,
          ),
          "kategori_therad_id": category,
        });
      }

      var response = await _api.dio.post(
        't/user/therad',
        data: formData,
      );

      if (response.statusCode == 201) {
        Fluttertoast.showToast(
          msg: "Successful Post",
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
    return null;
  }

  Future updateThread(
    String getToken,
    int getId,
    String title,
    String content,
    int category,
    File? file,
    String? fileName,
    String status,
    var context,
  ) async {
    try {
      _api.dio.options.headers["Authorization"] = "Bearer $getToken";

      dynamic formData;

      if (file == null) {
        formData = FormData.fromMap({
          "judul": title,
          "isi": content,
          "kategori_therad_id": category,
          "status": status,
        });
      } else {
        formData = FormData.fromMap({
          "judul": title,
          "isi": content,
          "file": await MultipartFile.fromFile(
            file.path,
            filename: fileName,
          ),
          "kategori_therad_id": category,
          "status": status,
        });
      }

      var response = await _api.dio.put(
        't/user/therad/$getId',
        data: formData,
      );

      if (response.statusCode == 201) {
        Fluttertoast.showToast(
          msg: "Successful Update",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
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
    return null;
  }

  Future delThread(String getToken, int getId, var context) async {
    try {
      _api.dio.options.headers["Authorization"] = "Bearer $getToken";

      var response = await _api.dio.delete('t/user/therad/$getId');

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: "Thread successfuly deleted",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
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
