import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:diskusiaza_mobile/models/user_model.dart';
import 'package:diskusiaza_mobile/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserModelApi {
  final API _api = API();

  Future<UserModel?> login(String email, String password) async {
    try {
      var response = await _api.dio.post(
        'auth/login',
        data: {
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        final body = response.data;
        print('Body : $body');
        return UserModel(email: email);
      }
    } catch (e) {
      print('Error : ${e.toString()}');
    }
    return null;
  }

  Future<UserModel?> register(
    String firstName,
    String lastName,
    String email,
    String password,
    String tanggalLahir,
    String jenisKelamin,
    var context,
  ) async {
    try {
      var response = await _api.dio.post(
        'auth/register',
        data: {
          'email': email,
          'firstName': firstName,
          'lastName': lastName,
          'password': password,
          'tanggalLahir': tanggalLahir,
          'jenisKelamin': jenisKelamin,
        },
      );

      print('code : ${response.statusCode}');

      if (response.statusCode == 200) {
        final body = response.data;

        Fluttertoast.showToast(
          msg: "Registering Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );

        Navigator.of(context).pushNamed('/login');

        print('Body : $body');
      }
    } on DioError catch (e) {
      print('Error : ${e.toString()}');
      if (e.response!.statusCode == 400) {
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
    return null;
  }
}
