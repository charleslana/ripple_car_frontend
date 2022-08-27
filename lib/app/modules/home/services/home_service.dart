import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/modules/home/models/home_model.dart';
import 'package:ripple_car_frontend/app/modules/login/services/login_service.dart';
import 'package:ripple_car_frontend/app/services/language_service.dart';
import 'package:ripple_car_frontend/app/utils/constants.dart';

class HomeService extends GetConnect {
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

  Future<HomeModel> getUserDetails() async {
    final response = await get<dynamic>('/user/details');
    if (response.status.hasError) {
      if (response.bodyString == null) {
        return Future.error('connection error');
      }
      return Future.error(response.body);
    }
    return HomeModel.fromMap(response.body);
  }
}
