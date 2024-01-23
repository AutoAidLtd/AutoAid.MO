import 'package:autoaid/data_api/auth_api.dart';

import '../model/auth_model.dart';

class AuthRepository {
  final AuthApi _authApi;
  AuthRepository({required AuthApi authApi}) : _authApi = authApi;
  Future<String?> loginUserGET(String uID) {
    return _authApi.loginUserGET(uID);
  }
}
