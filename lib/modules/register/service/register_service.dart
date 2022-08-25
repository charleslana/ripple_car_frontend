import 'package:get/get.dart';
import 'package:ripple_car_frontend/utils/constants.dart';

class RegisterService extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = apiBaseUrl;
    super.onInit();
  }
}
