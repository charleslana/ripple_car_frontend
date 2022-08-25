import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/modules/register/controllers/register_controller.dart';
import 'package:ripple_car_frontend/app/modules/register/services/register_service.dart';

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
