import 'package:get/get.dart';
import 'package:ripple_car_frontend/modules/splashscreen/controller/splashscreen_controller.dart';

class SplashscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(SplashscreenController.new);
  }
}
