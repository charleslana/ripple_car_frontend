import 'package:get/get.dart';
import 'package:ripple_car_frontend/modules/home/controller/home_controller.dart';
import 'package:ripple_car_frontend/modules/home/service/home_service.dart';

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
