import 'package:get/get.dart';
import 'package:ripple_car_frontend/modules/landing/controller/landing_controller.dart';
import 'package:ripple_car_frontend/modules/landing/service/landing_service.dart';

class LandingBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(LandingService.new)
      ..lazyPut(
        () => LandingController(
          landingService: Get.find<LandingService>(),
        ),
      );
  }
}
