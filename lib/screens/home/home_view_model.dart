import 'dart:io';

import 'package:diskusiaza_mobile/models/api/thread_api.dart';
import 'package:diskusiaza_mobile/models/api/user_thread_api.dart';
import 'package:diskusiaza_mobile/models/comment.dart';
import 'package:diskusiaza_mobile/models/thread.dart';
import 'package:diskusiaza_mobile/screens/profile/profile_view_model.dart';
import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
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
    var context,
  ) async {
    changeState(DataState.loading);

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

      image = null;
      fileName = null;

      getAllThread(context);

      changeState(DataState.filled);
    } catch (e) {
      changeState(DataState.error);
    }
  }

  final ThreadApi _threadApi = ThreadApi();

  List<Thread> allThreadList = [];
  Thread? threadDetail;

  Future getAllThread(var context) async {
    changeState(DataState.loading);

    try {
      SharedPreferences tokenPrefs = await SharedPreferences.getInstance();

      var myToken = tokenPrefs.getString('token');

      allThreadList = await _threadApi.getAllThread(myToken!, context);

      checkUserFollow(context);

      changeState(DataState.filled);
    } catch (e) {
      print('e getAllThread : $e');
      changeState(DataState.error);
    }
  }

  Future postLikeThread(
      int getId, int getIndex, var context, bool isDetail) async {
    try {
      SharedPreferences tokenPrefs = await SharedPreferences.getInstance();

      var myToken = tokenPrefs.getString('token');

      bool result = await _threadApi.postLikeThread(
        myToken!,
        getId,
        context,
      );

      threadDetail!.isLike = result;

      allThreadList[getIndex].isLike = result;

      changeState(DataState.filled);
    } catch (e) {
      changeState(DataState.error);
    }
  }

  Future getThreadById(int getId, var context) async {
    changeState(DataState.loading);

    try {
      SharedPreferences tokenPrefs = await SharedPreferences.getInstance();

      var myToken = tokenPrefs.getString('token');

      threadDetail = await _threadApi.getThreadById(myToken!, getId, context);

      getCommentByThreadId(getId, context);

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

  List<Comment?>? allCommentList = [];

  Future getCommentByThreadId(int getId, var context) async {
    try {
      allCommentList = await _threadApi.getCommentByThread(getId, context);

      changeState(DataState.filled);
    } catch (e) {
      changeState(DataState.error);
    }
  }

  Future postComment(int getId, String getComment, var context) async {
    try {
      await _threadApi.postCreateComment(getId, getComment, context);

      getCommentByThreadId(getId, context);

      changeState(DataState.filled);
    } catch (e) {
      changeState(DataState.error);
    }
  }

  Future postReplyComment(
    int threadId,
    int getId,
    String getComment,
    var context,
  ) async {
    try {
      await _threadApi.postReplyComment(getId, getComment, context);

      getCommentByThreadId(threadId, context);

      changeState(DataState.filled);
    } catch (e) {
      changeState(DataState.error);
    }
  }

  Future checkUserFollow(var context) async {
    final managerUser = Provider.of<ProfileViewModel>(context, listen: false);

    try {
      for (int i = 0; i < managerUser.followingList!.length; i++) {
        for (int j = 0; j < allThreadList.length; j++) {
          if (allThreadList[j].userId == managerUser.followingList![i].id) {
            allThreadList[j].isFollow = true;
            // print(
            //     'cek: ${managerUser.followingList![i].firstname} == ${allThreadList[j].authorName}');
            // print('j : $j');
            // print(
            //     'isFollow : ${allThreadList[j].authorName} ${allThreadList[j].isFollow}');
            continue;
          } else {
            continue;
          }
        }
        // print('i : $i');
      }
    } catch (e) {
      print('e check : $e');
    }

    // for (int index = 0; index < allThreadList.length; index++) {
    //   for (var map in managerUser.followingList!) {
    //     print('following : ${managerUser.followingList}');
    //     if (allThreadList[index].userId == map.id) {
    //       allThreadList[index].isFollow = true;
    //       print(
    //           'check : ${map.id} ${map.firstname} == ${allThreadList[index].userId} ${allThreadList[index].authorName}');
    //       print(
    //           'isFollow1: ${allThreadList[index].userId} ${allThreadList[index].isFollow}');
    //       break;
    //     } else {
    //       allThreadList[index].isFollow = false;
    //     }
    //     break;
    //   }
    //   print(
    //       'isFollow2: ${allThreadList[index].userId} ${allThreadList[index].isFollow}');
    // }
  }
}
