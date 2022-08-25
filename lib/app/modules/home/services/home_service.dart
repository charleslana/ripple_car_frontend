import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/utils/constants.dart';

class HomeService extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = apiBaseUrl;
    super.onInit();
  }
}