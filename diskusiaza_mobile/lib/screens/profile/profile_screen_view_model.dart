import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:flutter/material.dart';

class ProfileScreenViewModel extends ChangeNotifier {
  DataState dataState = DataState.loading;

  void changeState(DataState state) {
    dataState = state;
    notifyListeners();
  }

  void getDataProfile() async {
    changeState(DataState.loading);

    try {} catch (e) {
      changeState(DataState.error);
    }
  }
}
