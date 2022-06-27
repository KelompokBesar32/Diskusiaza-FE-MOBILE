import 'package:diskusiaza_mobile/models/api/user_model_api.dart';
import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:flutter/material.dart';

class AuthServices extends ChangeNotifier {
  DataState dataState = DataState.loading;

  final UserModelApi _userModelApi = UserModelApi();

  void changeState(DataState state) {
    dataState = state;
    notifyListeners();
  }

  void postLogin(String email, String password, var context) async {
    changeState(DataState.loading);

    try {
      await _userModelApi.login(
        email,
        password,
        context,
      );
    } catch (e) {
      changeState(DataState.error);
    }
  }

  void postRegister(
    String firstName,
    String lastName,
    String email,
    String password,
    String tanggalLahir,
    String jenisKelamin,
    var context,
  ) async {
    changeState(DataState.loading);

    try {
      await _userModelApi.register(
        firstName,
        lastName,
        email,
        password,
        tanggalLahir,
        jenisKelamin,
        context,
      );
    } catch (e) {
      changeState(DataState.error);
    }
  }
}
