import 'package:get/get.dart';
import 'package:ripple_car_frontend/modules/garage/controller/garage_controller.dart';
import 'package:ripple_car_frontend/modules/garage/service/garage_service.dart';

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
