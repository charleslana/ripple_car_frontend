import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/modules/login/models/login_credential_model.dart';
import 'package:ripple_car_frontend/app/modules/login/services/login_service.dart';
import 'package:ripple_car_frontend/app/routes/app_routes.dart';

class LoginController extends GetxController {
  LoginController({
    required this.loginService,
  });

  LoginService loginService = LoginService();
  RxBool isObscured = true.obs;
  RxBool isLoading = false.obs;
  RxBool isLogged = false.obs;

  Future<void> login(LoginCredentialModel credential) async {
    isLogged.value = true;
  }

  void logout() {
    isLogged.value = false;
    Get.toNamed<dynamic>(AppRoutes.login);
  }
}
