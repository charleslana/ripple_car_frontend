import 'package:get/get.dart';
import 'package:ripple_car_frontend/modules/register/controller/register_controller.dart';
import 'package:ripple_car_frontend/modules/register/service/register_service.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(RegisterService.new)
      ..lazyPut(
        () => RegisterController(
          registerService: Get.find<RegisterService>(),
        ),
      );
  }
}
