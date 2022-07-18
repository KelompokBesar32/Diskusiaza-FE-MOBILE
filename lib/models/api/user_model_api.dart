import 'dart:io';

import 'package:dio/dio.dart';
import 'package:diskusiaza_mobile/models/token.dart';
import 'package:diskusiaza_mobile/models/user_model.dart';
import 'package:diskusiaza_mobile/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserModelApi {
  final API _api = API();

  Future<Token?> login(
    String email,
    String password,
    var context,
  ) async {
    try {
      var response = await _api.dio.post(
        'auth/login',
        data: {
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        Token token = Token.fromJson(response.data);

        Navigator.of(context).pushReplacementNamed('/home');

        Fluttertoast.showToast(
          msg: "Wellcome $email",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );

        return token;
      }
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

      if (response.statusCode == 200) {
        Navigator.of(context).pushNamed('/login');

        Fluttertoast.showToast(
          msg: "Registering Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
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

  Future logout(String getToken, var context) async {
    try {
      _api.dio.options.headers["Authorization"] = "Bearer $getToken";

      var response = await _api.dio.get('t/auth/logout');

      if (response.statusCode == 200) {
        Navigator.of(context).pushReplacementNamed('/login');

        Fluttertoast.showToast(
          msg: "Logout Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );

        return 1;
      }
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

  Future<UserModel> getDataProfile(String getToken, var context) async {
    try {
      _api.dio.options.headers["Authorization"] = "Bearer $getToken";

      var response = await _api.dio.get('t/user/profile');

      if (response.statusCode == 200) {
        ResponseResultUserModel responseResult =
            ResponseResultUserModel.fromJson(response.data);

        return responseResult.data;
      }
    } on DioError catch (e) {
      String msg = e.response!.data
          .toString()
          .replaceAll('{message: ', '')
          .replaceAll('}', '');

      if (e.response!.statusCode == 401) {
        SharedPreferences tokenPrefs = await SharedPreferences.getInstance();

        await tokenPrefs.setString('token', '');

        Navigator.of(context).pushReplacementNamed('/login');
      }
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
    return UserModel();
  }

  Future putUpdateDataProfile(
    String getToken,
    String firstName,
    String lastName,
    String? nohp,
    String tanggalLahir,
    String jenisKelamin,
    String? password,
    File? image,
    String? fileName,
    var context,
  ) async {
    try {
      _api.dio.options.headers["Authorization"] = "Bearer $getToken";

      dynamic formData;

      if ((password == null || password == '') && (image == null)) {
        formData = FormData.fromMap({
          "firstname": firstName,
          "lastname": lastName,
          "nohp": ((nohp == null || nohp == '') ? null : nohp),
          "tanggal_lahir": tanggalLahir,
          "jenis_kelamin": jenisKelamin,
        });
      } else if ((password != null || password != '') && (image == null)) {
        formData = FormData.fromMap({
          "firstname": firstName,
          "lastname": lastName,
          "nohp": ((nohp == null || nohp == '') ? null : nohp),
          "tanggal_lahir": tanggalLahir,
          "jenis_kelamin": jenisKelamin,
          "password": password,
        });
      } else if ((password == null || password == '') && (image != null)) {
        formData = FormData.fromMap({
          "firstname": firstName,
          "lastname": lastName,
          "nohp": ((nohp == null || nohp == '') ? null : nohp),
          "foto": await MultipartFile.fromFile(
            image.path,
            filename: fileName,
          ),
          "tanggal_lahir": tanggalLahir,
          "jenis_kelamin": jenisKelamin,
        });
      } else {
        formData = FormData.fromMap({
          "firstname": firstName,
          "lastname": lastName,
          "nohp": ((nohp == null || nohp == '') ? null : nohp),
          "foto": await MultipartFile.fromFile(
            image!.path,
            filename: fileName,
          ),
          "tanggal_lahir": tanggalLahir,
          "jenis_kelamin": jenisKelamin,
          "password": password,
        });
      }

      var response = await _api.dio.put(
        't/user/profile',
        data: formData,
      );

      ResponseResultUserModel responseResult =
          ResponseResultUserModel.fromJson(response.data);

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: "Data Users Successfully Updated",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }

      Navigator.pop(context);

      return responseResult.data;
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

  Future<List<UserModel>> getFollowers(String getToken, var context) async {
    try {
      _api.dio.options.headers["Authorization"] = "Bearer $getToken";

      var response = await _api.dio.get('t/user/followers');

      ResponseResultFollow responseResult =
          ResponseResultFollow.fromJson(response.data);

      return responseResult.data;
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
    return [];
  }

  Future<List<UserModel>> getFollowing(String getToken, var context) async {
    try {
      _api.dio.options.headers["Authorization"] = "Bearer $getToken";

      var response = await _api.dio.get('t/user/followed');

      ResponseResultFollow responseResult =
          ResponseResultFollow.fromJson(response.data);

      return responseResult.data;
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
    return [];
  }

  Future postFollowingUser(String getToken, int getIdUser) async {
    try {
      _api.dio.options.headers["Authorization"] = "Bearer $getToken";

      await _api.dio.post(
        't/follow',
        data: {
          "followed_id": getIdUser,
        },
      );

      Fluttertoast.showToast(
        msg: 'Successfull Follow',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
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
    return null;
  }

  Future delUnFollowingUser(String getToken, int getIdUser) async {
    try {
      _api.dio.options.headers["Authorization"] = "Bearer $getToken";

      await _api.dio.delete(
        't/follow',
        data: {
          "followed_id": getIdUser,
        },
      );
      Fluttertoast.showToast(
        msg: 'Successfull Unfollow',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
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
    return null;
  }
}
