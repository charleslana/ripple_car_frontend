import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/modules/login/controllers/login_controller.dart';
import 'package:ripple_car_frontend/app/modules/login/services/login_service.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(LoginService.new)
      ..lazyPut(
        () => LoginController(
          loginService: Get.find<LoginService>(),
        ),
      );
  }
}
