import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/controllers/language_controller.dart';

class LanguageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LanguageController>(LanguageController.new);
  }
}
