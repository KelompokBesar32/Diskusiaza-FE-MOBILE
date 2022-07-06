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
    var context,
  ) async {
    print('success 1');
    try {
      print('success 2');
      _api.dio.options.headers["Authorization"] = "Bearer $getToken";

      print('success 3');

      var formData = FormData.fromMap({
        "judul": title,
        "isi": content,
        "file": await MultipartFile.fromFile('assets/images/fotoProfile',
            filename: 'upload.png'),
        "kategori_therad_id": category,
      });

      print('success 4');

      var response = await _api.dio.post(
        'user/therad',
        data: {
          formData,
        },
      );

      print('success 5');

      if (response.statusCode == 201) {
        Fluttertoast.showToast(
          msg: "Successful Post",
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
      print('error: $e');
      print('erorCode: ${e.response!.statusCode}');
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
}
