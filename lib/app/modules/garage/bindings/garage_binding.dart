import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/modules/garage/controllers/garage_controller.dart';
import 'package:ripple_car_frontend/app/modules/garage/services/garage_service.dart';

class GarageBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(GarageService.new)
      ..lazyPut(
        () => GarageController(
          garageService: Get.find<GarageService>(),
        ),
      );
  }
}
