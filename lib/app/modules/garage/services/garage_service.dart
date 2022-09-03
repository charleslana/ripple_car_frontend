import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/modules/login/services/login_service.dart';
import 'package:ripple_car_frontend/app/services/language_service.dart';
import 'package:ripple_car_frontend/app/utils/constants.dart';

class GarageService extends GetConnect {
  final LoginService _loginService = LoginService();
  final LanguageService _languageService = LanguageService();

  @override
  void onInit() {
    httpClient
      ..baseUrl = apiBaseUrl
      ..addRequestModifier<dynamic>((dynamic request) {
        request.headers['accept-language'] = _languageService.getLocaleString();
        request.headers['Authorization'] =
            'Bearer ${_loginService.getAuth().accessToken}';
        request.headers['cookie'] = _loginService.getAuth().cookie;
        return request;
      });
    super.onInit();
  }
}
