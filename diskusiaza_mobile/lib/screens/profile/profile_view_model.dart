import 'dart:io';

import 'package:diskusiaza_mobile/models/api/thread_api.dart';
import 'package:diskusiaza_mobile/models/api/user_model_api.dart';
import 'package:diskusiaza_mobile/models/api/user_thread_api.dart';
import 'package:diskusiaza_mobile/models/thread.dart';
import 'package:diskusiaza_mobile/models/user_model.dart';
import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:diskusiaza_mobile/widgets/input_gender_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileViewModel extends ChangeNotifier {
  DataState dataState = DataState.loading;

  final UserModelApi _userModelApi = UserModelApi();
  UserModel? dataProfile;

  Gender genderController = Gender.L;

  void changeState(DataState state) {
    dataState = state;
    notifyListeners();
  }

  void getDataProfile(var context) async {
    changeState(DataState.loading);

    try {
      SharedPreferences tokenPrefs = await SharedPreferences.getInstance();

      String? myToken = tokenPrefs.getString('token');

      dataProfile = await _userModelApi.getDataProfile(myToken!, context);

      image = null;
      fileName = null;

      changeState(DataState.filled);
    } catch (e) {
      changeState(DataState.error);
    }
  }

  final ThreadApi _threadApi = ThreadApi();

  List<Thread> allUserThreadList = [];

  Future getThreadByUser(var context) async {
    changeState(DataState.loading);

    try {
      SharedPreferences tokenPrefs = await SharedPreferences.getInstance();

      var myToken = tokenPrefs.getString('token');

      allUserThreadList = await _threadApi.getThreadByUser(myToken!, context);

      changeState(DataState.filled);
    } catch (e) {
      changeState(DataState.error);
    }
  }

  Future postLikeThread(int getId, int getIndex, var context) async {
    try {
      SharedPreferences tokenPrefs = await SharedPreferences.getInstance();

      var myToken = tokenPrefs.getString('token');

      bool result = await _threadApi.postLikeThread(
        myToken!,
        getId,
        context,
      );

      allUserThreadList[getIndex].isLike = result;

      changeState(DataState.filled);
    } catch (e) {
      changeState(DataState.error);
    }
  }

  final UserThreadApi _userThreadApi = UserThreadApi();

  void postThread(
    String title,
    String content,
    int category,
    var context,
  ) async {
    try {
      SharedPreferences tokenPrefs = await SharedPreferences.getInstance();

      var myToken = tokenPrefs.getString('token');

      await _userThreadApi.postThread(
        myToken!,
        title,
        content,
        category,
        image,
        fileName,
        context,
      );

      getThreadByUser(context);

      changeState(DataState.filled);
    } catch (e) {
      changeState(DataState.error);
    }
  }

  Future updateThread(
    int getId,
    String title,
    String content,
    int category,
    String status,
    var context,
  ) async {
    try {
      SharedPreferences tokenPrefs = await SharedPreferences.getInstance();

      var myToken = tokenPrefs.getString('token');

      await _userThreadApi.updateThread(
        myToken!,
        getId,
        title,
        content,
        category,
        image,
        fileName,
        status,
        context,
      );

      image = null;
      fileName = null;

      getThreadByUser(context);

      Navigator.pop(context);

      changeState(DataState.filled);
    } catch (e) {
      changeState(DataState.error);
    }
  }

  Future deleteThread(int getId, var context) async {
    try {
      SharedPreferences tokenPrefs = await SharedPreferences.getInstance();

      var myToken = tokenPrefs.getString('token');

      await _userThreadApi.delThread(myToken!, getId, context);

      getThreadByUser(context);

      changeState(DataState.filled);
    } catch (e) {
      changeState(DataState.error);
    }
    return false;
  }

  Future updateDataProfile(
    String firstName,
    String lastName,
    String? nohp,
    String tanggalLahir,
    String jenisKelamin,
    String? password,
    var context,
  ) async {
    changeState(DataState.loading);

    try {
      SharedPreferences tokenPrefs = await SharedPreferences.getInstance();

      String? myToken = tokenPrefs.getString('token');

      UserModel s = await _userModelApi.putUpdateDataProfile(
        myToken!,
        firstName,
        lastName,
        nohp,
        tanggalLahir,
        jenisKelamin,
        password,
        image,
        fileName,
        context,
      );

      getDataProfile(context);

      changeState(DataState.filled);
    } catch (e) {
      changeState(DataState.error);
    }
  }

  File? image;
  String? fileName;

  Future openCamera(var context) async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      fileName = basename(image!.path);
    }

    Navigator.pop(context);
  }

  Future openGallery(var context) async {
    final imageGallery =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageGallery != null) {
      image = File(imageGallery.path);
      fileName = basename(image!.path);
    }

    Navigator.pop(context);
  }
}
