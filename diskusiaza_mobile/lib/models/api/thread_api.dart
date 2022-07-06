import 'package:diskusiaza_mobile/models/thread.dart';
import 'package:diskusiaza_mobile/utils/api.dart';

class ThreadApi {
  final API _api = API();

  Future<List<Thread>> getAllThread(String getToken, var context) async {
    try {
      var response = await _api.dio.get('therad');

      ResponseResultThread responseResult =
          ResponseResultThread.fromJson(response.data);

      print(responseResult.data);

      return responseResult.data;
    } catch (e) {
      return [];
    }
    return [];
  }
}
