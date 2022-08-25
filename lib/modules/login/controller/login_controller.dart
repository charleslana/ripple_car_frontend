import 'package:get/get.dart';
import 'package:ripple_car_frontend/auth/auth_store.dart';
import 'package:ripple_car_frontend/modules/login/models/login_credential_model.dart';
import 'package:ripple_car_frontend/modules/login/service/login_service.dart';

class LoginController extends GetxController {
  LoginController({
    required this.loginService,
  });

  LoginService loginService = LoginService();
  RxBool isObscured = true.obs;
  RxBool isLoading = false.obs;

  final AuthStore store = Get.find<AuthStore>();

  Future<void> login(LoginCredentialModel credential) async {
    store.isLogged.value = true;
  }

  void logout() {
    store.isLogged.value = false;
    Get.back<dynamic>();
  }
}
