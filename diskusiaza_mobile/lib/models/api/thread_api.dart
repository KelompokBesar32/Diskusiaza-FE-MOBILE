import 'package:diskusiaza_mobile/models/thread.dart';
import 'package:diskusiaza_mobile/utils/api.dart';

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
}
