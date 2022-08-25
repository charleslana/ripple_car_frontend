import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/modules/landing/controllers/landing_controller.dart';
import 'package:ripple_car_frontend/app/modules/landing/services/landing_service.dart';

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
