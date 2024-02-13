import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../utils/constants.dart';

class AuthApi {
  final Dio _dio = Dio();

  AuthApi() {
    _dio.options.baseUrl = '${AppConstants.localhostAdress}/';
    _dio.options.contentType = Headers.jsonContentType;
    _dio.options.responseType = ResponseType.json;
  }

  Future<String?> loginUserGET(String uID) async {
    var log = Logger();

    Response response = await _dio
        .get('authentication/access-token', queryParameters: {'uid': uID});
    String userID = response.data['data'];
    log.i('$userID');

    return userID;
  }
}
