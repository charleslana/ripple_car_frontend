import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/modules/login/models/auth_model.dart';
import 'package:ripple_car_frontend/app/modules/login/models/login_credential_model.dart';
import 'package:ripple_car_frontend/app/services/encrypt_service.dart';
import 'package:ripple_car_frontend/app/services/get_storage_service.dart';
import 'package:ripple_car_frontend/app/utils/constants.dart';

class LoginService extends GetConnect {
  final String _loginKey = 'login';
  final String _authKey = 'auth';

  final GetStorageService _getStorageService = GetStorageService();
  final EncryptService _encryptService = EncryptService();

  @override
  void onInit() {
    httpClient
      ..baseUrl = apiBaseUrl
      ..addRequestModifier<dynamic>((dynamic request) {
        request.headers['accept-language'] = 'pt-BR';
        return request;
      });
    super.onInit();
  }

  Future<AuthModel> login(LoginCredentialModel credential) async {
    final formData = FormData({
      'email': credential.email.value,
      'password': credential.password.value,
    });
    final response = await post<dynamic>('/login', formData);
    if (response.status.hasError) {
      if (response.bodyString == null) {
        return Future.error('connection error');
      }
      return Future.error(response.body);
    }
    return AuthModel.fromMap(response.body)
        .copyWith(cookie: _getCookieFromHeader(response));
  }

  String _getCookieFromHeader(Response<dynamic> response) {
    final String? rawCookie = response.headers!['set-cookie'];
    if (rawCookie != null) {
      final int index = rawCookie.indexOf(';');
      return (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
    return '';
  }

  dynamic readAuth() => _getStorageService.read(_authKey);

  dynamic readLogin() => _getStorageService.read(_loginKey);

  void removeAuth() => _getStorageService.remove(_authKey);

  void removeLogin() => _getStorageService.remove(_loginKey);

  void saveAuth(AuthModel auth) =>
      _getStorageService.save(_authKey, auth.toMap());

  void saveLogin(LoginCredentialModel credential) {
    credential
      ..setEmail(_encryptService.encrypt(credential.email.value))
      ..setPassword(_encryptService.encrypt(credential.password.value));
    _getStorageService.save(_loginKey, credential.toMap());
  }
}
