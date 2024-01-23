import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';

class AuthApi {
  final Dio _dio = Dio();

  AuthApi() {
    _dio.options.baseUrl = '${AppConstants.localhostAdress}/';
    _dio.options.contentType = Headers.jsonContentType;
    _dio.options.responseType = ResponseType.json;
  }

  // Future<ResponseUser?> loginUser(
  //     String idToken, String fcmToken, String? roleName) async {
  //   Response response = await _dio.post('/login', data: {
  //     'idToken': idToken,
  //     'fcmToken': fcmToken,
  //     'roleName': roleName ?? 'Customer',
  //   });
  //   var log = Logger();
  //   User user = ResponseUser.fromJson(response.data['data']).user;

  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('userId', user.id);
  //   await prefs.setString('userInfo', jsonEncode(user));
  //   log.i('UserId: ${user.id}');
  //   log.i('fcmToken $fcmToken');
  //   return ResponseUser.fromJson(response.data['data']);
  // }

  Future<String?> loginUserGET(String uID) async {
    var log = Logger();
    log.i('hello loginUserGET');

    // Response response = await _dio.get('', queryParameters: {'uID': uID});
    Response response = await _dio
        .get('authentication/access-token', queryParameters: {'uid': uID});
    String userID = response.data['data'];

    return userID;
  }
}
