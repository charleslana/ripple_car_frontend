import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/modules/garage_details/controllers/garage_details_controller.dart';
import 'package:ripple_car_frontend/app/modules/garage_details/services/garage_details_service.dart';

class GarageDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(GarageDetailsService.new)
      ..lazyPut(
        () => GarageDetailsController(
          garageDetailsService: Get.find<GarageDetailsService>(),
          userCarId: Get.arguments ?? 0,
        ),
      );
  }
}
