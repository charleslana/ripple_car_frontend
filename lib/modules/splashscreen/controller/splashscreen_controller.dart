import 'dart:async';

import 'package:get/get.dart';
import 'package:ripple_car_frontend/routes/app_routes.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    Timer(
      const Duration(seconds: 2),
      () => Get.offAllNamed<dynamic>(AppRoutes.landing),
    );
    super.onInit();
  }
}
