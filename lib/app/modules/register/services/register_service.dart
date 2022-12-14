import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/models/response_model.dart';
import 'package:ripple_car_frontend/app/modules/register/models/register_model.dart';
import 'package:ripple_car_frontend/app/services/language_service.dart';
import 'package:ripple_car_frontend/app/utils/constants.dart';

class RegisterService extends GetConnect {
  final LanguageService _languageService = LanguageService();

  @override
  void onInit() {
    httpClient
      ..baseUrl = apiBaseUrl
      ..addRequestModifier<dynamic>((dynamic request) {
        request.headers['accept-language'] = _languageService.getLocaleString();
        return request;
      });
    super.onInit();
  }

  Future<ResponseModel> register(RegisterModel register) async {
    final response = await post<dynamic>('/user', register.toMap());
    if (response.status.hasError) {
      if (response.bodyString == null) {
        return Future.error('connection error');
      }
      return Future.error(response.body);
    }
    return ResponseModel.fromMap(response.body);
  }
}
