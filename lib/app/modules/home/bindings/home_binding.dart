import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/modules/home/controllers/home_controller.dart';
import 'package:ripple_car_frontend/app/modules/home/services/home_service.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(HomeService.new)
      ..lazyPut(
        () => HomeController(
          homeService: Get.find<HomeService>(),
        ),
      );
  }
}
