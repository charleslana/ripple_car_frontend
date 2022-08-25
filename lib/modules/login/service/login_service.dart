import 'package:get/get.dart';
import 'package:ripple_car_frontend/utils/constants.dart';

class LoginService extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = apiBaseUrl;
    super.onInit();
  }
}
