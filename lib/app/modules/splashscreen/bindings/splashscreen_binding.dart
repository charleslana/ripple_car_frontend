import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/modules/splashscreen/controllers/splashscreen_controller.dart';

class SplashscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(SplashscreenController.new);
  }
}
